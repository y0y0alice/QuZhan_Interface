using IWorkFlow.Host;
using log4net;
using Quartz;
using QuartzDemo.QuartzJobs.entity;
using QuartzDemo.WebReference;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

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
                        _logger.InfoFormat("业务编号:" + receive.YWBH + " 收文标题:" + receive.SWBT + "插入成功！");
                    };
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

        public void taskDetail(string xtbh, string swbh, string swlx)
        {
            //本地测试
            XmlDocument xmlDocument = new XmlDocument();
            var dir = Directory.GetCurrentDirectory();
            string serverpath = dir + "\\taskDetai.xml";
            xmlDocument.Load(serverpath);
            XmlNodeList xmlNodeList = xmlDocument.SelectSingleNode("SW").SelectSingleNode("SWINFOS").ChildNodes;

            //基本信息
            XmlNodeList jbxx = xmlNodeList[0].SelectSingleNode("JBXX").ChildNodes;
            foreach (XmlNode detail in jbxx)
            {

            }
        }
    }
}
