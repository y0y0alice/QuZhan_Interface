using IWorkFlow.Host;
using log4net;
using Newtonsoft.Json;
using Quartz;
using QuartzDemo.QuartzJobs.entity;
using QuartzDemo.WebReference;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Serialization;
using VIM.Data.Common.Parser;

namespace QuartzDemo.QuartzJobs
{
    public sealed class LwJob : IJob
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(LwJob));

        public void Execute(IJobExecutionContext context)
        {
            try
            {
                //接收所有收文
                unReceiveTasks();
                _logger.InfoFormat("待收文任务列表获取成功");
            }
            catch (Exception ex)
            {
                _logger.InfoFormat("待收文任务列表获取失败：" + ex);
            }
        }

        /// <summary>
        /// 待收文任务列表
        /// </summary>
        public void unReceiveTasks()
        {
            IList<B_OA_IReceiveTask> receiveList = new List<B_OA_IReceiveTask>();

            //用于本地测试
            //XmlDocument xmlDocument = new XmlDocument();
            //var dir = Directory.GetCurrentDirectory();
            //string serverpath = dir + "\\unReceiveTasks.xml";
            //xmlDocument.Load(serverpath);
            //XmlNodeList xmlNodeList = xmlDocument.SelectSingleNode("SW").SelectSingleNode("SWINFOS").ChildNodes;

            //wsdl发布测试
            WebService1 service = new WebService1();
            string returnXml = service.unReceiveTasks("qjc_lims_test");
            _logger.InfoFormat("接口连接成功!");
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(returnXml);
            XmlNodeList xmlNodeList = xmlDocument.SelectSingleNode("SW").SelectSingleNode("SWINFOS").ChildNodes;

            foreach (XmlNode detail in xmlNodeList)
            {
                var tran = Utility.Database.BeginDbTransaction();
                try
                {
                    B_OA_IReceiveTask receive = new B_OA_IReceiveTask(
                    detail.SelectSingleNode("USERID").InnerText,
                    detail.SelectSingleNode("YWBH").InnerText,
                    detail.SelectSingleNode("SWLX").InnerText,
                    detail.SelectSingleNode("SWBT").InnerText,
                    detail.SelectSingleNode("SWLCBH").InnerText,
                    detail.SelectSingleNode("SFZDJR").InnerText,
                    detail.SelectSingleNode("SWZT").InnerText,
                    detail.SelectSingleNode("FKYJ").InnerText,
                    detail.SelectSingleNode("BZ").InnerText
                    );
                    //条件查找
                    receive.Condition.Add("YWBH =" + detail.SelectSingleNode("YWBH").InnerText);
                    receive.Condition.Add("SWLX =" + detail.SelectSingleNode("SWLX").InnerText);
                    if (Utility.Database.QueryObject(receive, tran) == null)
                    {
                        Utility.Database.Insert(receive, tran);
                        _logger.InfoFormat("成功插入主表一条数据！");
                    };
                    //添加或者修改通知公告详细内容
                    taskDetail("qjc_lims_test", receive.YWBH, receive.SWLX, tran);
                    Utility.Database.Commit(tran);
                }
                catch (Exception ex)
                {
                    Utility.Database.Rollback(tran);
                    _logger.InfoFormat("业务编号:" + detail.SelectSingleNode("YWBH").InnerText + " 收文标题:" + detail.SelectSingleNode("SWBT").InnerText + "插入失败！\n" +
                        "失败原因" + ex);
                }
            }
        }

        public void taskDetail(string xtbh, string swbh, string swlx, IDbTransaction tran)
        {
            //本地测试
            XmlDocument xmlDocument = new XmlDocument();
            var dir = Directory.GetCurrentDirectory();
            string serverpath = dir + "\\taskDetai.xml";
            xmlDocument.Load(serverpath);

            XmlNodeList xmlNodeList = xmlDocument.SelectSingleNode("SW").SelectSingleNode("SWINFOS").ChildNodes;
            //获取基本信息
            XmlNode receiveXml = xmlNodeList[0].SelectSingleNode("JBXX");
            string json = Newtonsoft.Json.JsonConvert.SerializeXmlNode(receiveXml);
            JBXXModel JBXXModel = JsonConvert.DeserializeObject<JBXXModel>(json);
            B_OA_ITaskDetail taskDetail = JBXXModel.JBXX;
            taskDetail.YWBH = swbh;
            taskDetail.SWLX = swlx;
            taskDetail.Condition.Add("YWBH =" + taskDetail.YWBH);
            taskDetail.Condition.Add("SWLX =" + taskDetail.SWLX);
            if (Utility.Database.QueryObject(taskDetail, tran) == null)
            {
                Utility.Database.Insert(taskDetail, tran);
                _logger.InfoFormat("成功插入父表一条数据！");
            }
            else
            {
                Utility.Database.Update(taskDetail, tran);
                _logger.InfoFormat("成功修改父表一条数据！");
            }
        }

        public class JBXXModel
        {
            public B_OA_ITaskDetail JBXX;
        }


        public static T DeserializeXML<T>(string xmlObj)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(T));
            using (StringReader reader = new StringReader(xmlObj))
            {
                return (T)serializer.Deserialize(reader);
            }
        }

        /// <summary>
        /// 反序列化
        /// </summary>
        public static T Deserialize<T>(string xmlContent)
        {
            XmlSerializer xs = new XmlSerializer(typeof(T));
            using (StringReader strReader = new StringReader(xmlContent))
            {
                XmlReader xmlReader = XmlReader.Create(strReader);
                return (T)xs.Deserialize(xmlReader);
            }
        }
    }
}
