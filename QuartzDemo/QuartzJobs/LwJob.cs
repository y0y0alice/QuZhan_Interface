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
                taskDetail();
                _logger.InfoFormat("待收文任务列表获取成功");
            }
            catch (Exception ex)
            {
                _logger.InfoFormat("待收文任务列表获取失败：" + ex);
            }
        }

        /// <summary>
        /// 待收文
        /// </summary>
        public void taskDetail()
        {
            IList<T_OA_JKFW_YBJSRWLB> receiveList = new List<T_OA_JKFW_YBJSRWLB>();

            //用于本地测试
            //XmlDocument xmlDocument = new XmlDocument();
            //var dir = Directory.GetCurrentDirectory();
            //string serverpath = dir + "\\taskDetail.xml";
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
                try
                {
                    T_OA_JKFW_YBJSRWLB receive = new T_OA_JKFW_YBJSRWLB(
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
                    _logger.InfoFormat("业务编号:" + receive.YWBH + " 收文标题:" + receive.SWBT + "插入成功！");
                    Utility.Database.Insert(receive);
                }
                catch (Exception ex)
                {
                    _logger.InfoFormat("业务编号:" + detail.SelectSingleNode("YWBH").InnerText + " 收文标题:" + detail.SelectSingleNode("SWBT").InnerText + "插入失败！\n" +
                        "失败原因" + ex);
                }

            }
        }

    }
}
