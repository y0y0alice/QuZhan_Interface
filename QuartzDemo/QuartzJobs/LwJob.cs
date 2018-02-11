using IWorkFlow.Host;
using log4net;
using Newtonsoft.Json;
using Quartz;
using QuartzDemo.QuartzJobs.entity;
using QuartzDemo.WebReference;
using QuartzDemo.WebReference2;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Serialization;
namespace QuartzDemo.QuartzJobs
{
    public sealed class LwJob : IJob
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(LwJob));

        public void Execute(IJobExecutionContext context)
        {
            try
            {
                loadTasks();
                //reloadFW();
                //reloadAttachment("2018-01-29", null);
            }
            catch (Exception ex)
            {
                _logger.InfoFormat("待收文任务列表获取失败：" + ex);
            }
        }

        //重新获取附件信息
        public void reloadAttachment(string date, IDbTransaction tran)
        {
            string sql = "select * from B_OA_IReceiveTask where receiveDate >'2018-01-30'";
            DataTable dt = Utility.Database.ExcuteDataSet(sql).Tables[0];
            string jsonData = JsonConvert.SerializeObject(dt);
            List<B_OA_IReceiveTask> detailList = (List<B_OA_IReceiveTask>)JsonConvert.DeserializeObject(jsonData, typeof(List<B_OA_IReceiveTask>));
            foreach (var receive in detailList)
            {
                if (receive.SWLX == "LW")//来文
                {
                    TaskDetail_LW("qjc_lims_test", receive.YWBH, receive.SWLX, "1", tran);
                }
                else if (receive.SWLX == "NBYJ")//内部邮件
                {
                    if ((!string.IsNullOrEmpty(receive.USERID)))
                    {
                        TaskDetail_Mail("qjc_lims_test", receive.YWBH, receive.BZ, receive.SWLX, "1", tran, receive.USERID);
                    }
                    else
                    {
                        TaskDetail_Mail("qjc_lims_test", receive.YWBH, receive.BZ, receive.SWLX, "1", tran);
                    }
                }
                else if (receive.SWLX == "TZGG")//通知公告
                {
                    TaskDetail_TZGG("qjc_lims_test", receive.YWBH, receive.SWLX, "1", tran);
                }
                else if (receive.SWLX == "FW")//发文
                {
                    TaskDetail_FW("qjc_lims_test", receive.YWBH, receive.SWLX, "1", tran);
                }
            }
        }

        public void reloadMail()
        {
            B_OA_IEmail mail = new B_OA_IEmail();
            List<B_OA_IEmail> list = Utility.Database.QueryList(mail);
            foreach (var m in list)
            {
                TaskDetail_Mail("qjc_lims_test", m.YWBH, m.BZ, m.SWLX, "1", null);
            }
        }

        public void reloadFW()
        {
            B_OA_IReceiveTask receive = new B_OA_IReceiveTask();
            receive.Condition.Add("SWLX =FW ");
            List<B_OA_IReceiveTask> listReceive = Utility.Database.QueryList(receive);
            foreach (B_OA_IReceiveTask re in listReceive)
            {
                TaskDetail_FW("qjc_lims_test", re.YWBH, re.SWLX, "1", null);
            }
        }

        TaskWorkflowServiceService service = new TaskWorkflowServiceService();

        public void loadTasks()
        {
            //接收所有收文
            unReceiveTasks("LW");
            // _logger.InfoFormat("待收文任务列表获取成功");
            unReceiveTasks("TZGG");
            //  _logger.InfoFormat("通知公告任务列表获取成功");
            unReceiveTasks("NBYJ");
            // _logger.InfoFormat("内部邮件任务列表获取成功");
            unReceiveTasks("FW");
            // _logger.InfoFormat("发文任务列表获取成功");
        }

        public void TaskDetail_FW(string xtbh, string swbh, string swlx, string isreload, IDbTransaction tran)
        {
            string xmlString = service.taskDetail(xtbh, swbh, swlx);
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(xmlString);
            XmlNodeList xmlNodeList = xmlDocument.SelectSingleNode("SW").SelectSingleNode("SWINFOS").ChildNodes;
            //附件详情
            XmlNodeList attachmentXmls = xmlNodeList[0].SelectSingleNode("FJXXS").SelectNodes("FJXX");
            InserOrUpdateAttachment(attachmentXmls, swbh, swlx, isreload, tran);
            //文档详情
            XmlNode receiveXml = xmlNodeList[0].SelectSingleNode("JBXX");
            InserOrUpdateDetail_FW(receiveXml, swbh, swlx, tran);
        }

        /// <summary>
        /// 插入或者修改发文
        /// </summary>
        /// <param name="receiveXml">xml数据</param>
        /// <param name="xtbh">系统编号</param>
        /// <param name="swbh">收文编号</param>
        /// <param name="swlx">收文类型</param>
        /// <param name="tran">事务</param>
        public void InserOrUpdateDetail_FW(XmlNode receiveXml, string swbh, string swlx, IDbTransaction tran)
        {
            string json = Newtonsoft.Json.JsonConvert.SerializeXmlNode(receiveXml);
            FWModel fwModel = JsonConvert.DeserializeObject<FWModel>(json);
            B_OA_IFW taskDetail = fwModel.JBXX;
            taskDetail.YWBH = swbh;
            taskDetail.SWLX = swlx;
            taskDetail.Condition.Add("YWBH =" + taskDetail.YWBH);
            taskDetail.Condition.Add("SWLX =" + taskDetail.SWLX);
            if (Utility.Database.QueryObject(taskDetail, tran) == null)
            {
                taskDetail.receiveTime = DateTime.Now;
                Utility.Database.Insert(taskDetail, tran);
                _logger.InfoFormat("成功插入发文成功！");
            }
            else
                taskDetail.receiveTime = DateTime.Now;
            {
                Utility.Database.Update(taskDetail, tran);
                _logger.InfoFormat("成功修改发文成功！");
            }
        }

        /// <summary>
        /// 待收文任务列表
        /// </summary>
        public void unReceiveTasks(string swlx, string receiveDate = null)
        {
            IList<B_OA_IReceiveTask> receiveList = new List<B_OA_IReceiveTask>();

            //用于本地测试
            //XmlDocument xmlDocument = new XmlDocument();
            //var dir = Directory.GetCurrentDirectory();
            //string serverpath = dir + "\\unReceiveTasks.xml";
            //xmlDocument.Load(serverpath);
            //XmlNodeList xmlNodeList = xmlDocument.SelectSingleNode("SW").SelectSingleNode("SWINFOS").ChildNodes;

            //wsdl发布测试
            string returnXml = service.unReceiveTasks("qjc_lims_test", swlx);
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
                    detail.SelectSingleNode("SWZT").InnerText,
                    detail.SelectSingleNode("FKYJ").InnerText,
                    detail.SelectSingleNode("BZ").InnerText
                    );
                    receive.receiveDate = DateTime.Now;
                    //条件查找
                    receive.Condition.Add("YWBH =" + detail.SelectSingleNode("YWBH").InnerText);
                    receive.Condition.Add("SWLX =" + detail.SelectSingleNode("SWLX").InnerText);
                    receive.Condition.Add("USERID =" + detail.SelectSingleNode("USERID").InnerText);
                    if (Utility.Database.QueryObject(receive, tran) == null)
                    {
                        var tran2 = Utility.Database.BeginDbTransaction();
                        Utility.Database.Insert(receive, tran2);
                        _logger.InfoFormat("成功插入待收任务据！");
                        Utility.Database.Commit(tran2);
                    };
                    if (receive.SWLX == "LW")//来文
                    {
                        TaskDetail_LW("qjc_lims_test", receive.YWBH, receive.SWLX, null, tran);
                    }
                    else if (receive.SWLX == "NBYJ")//内部邮件
                    {
                        if ((!string.IsNullOrEmpty(receive.USERID)))
                        {
                            TaskDetail_Mail("qjc_lims_test", receive.YWBH, receive.BZ, receive.SWLX, null, tran, receive.USERID);
                        }
                        else
                        {
                            TaskDetail_Mail("qjc_lims_test", receive.YWBH, receive.BZ, receive.SWLX, null, tran);
                        }
                    }
                    else if (receive.SWLX == "TZGG")//通知公告
                    {
                        TaskDetail_TZGG("qjc_lims_test", receive.YWBH, receive.SWLX, null, tran);
                    }
                    else if (receive.SWLX == "FW")//发文
                    {
                        TaskDetail_FW("qjc_lims_test", receive.YWBH, receive.SWLX, null, tran);
                    }
                    var taskRecevieConfirm = service.taskRecevieConfirm("qjc_lims_test", receive.YWBH, receive.SWLX);
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

        public void TaskDetail_Mail(string xtbh, string swbh, string bz, string swlx, string isreload, IDbTransaction tran, string userid = null)
        {
            string xmlString = service.taskDetail(xtbh, swbh, swlx);
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(xmlString);
            XmlNodeList xmlNodeList = xmlDocument.SelectSingleNode("SW").SelectSingleNode("SWINFOS").ChildNodes;
            //邮件详情
            XmlNode receiveXml = xmlNodeList[0].SelectSingleNode("JBXX");
            InserOrUpdateDetail_Mail(receiveXml, swbh, bz, swlx, tran, userid);
            //附件详情
            XmlNodeList attachmentXmls = xmlNodeList[0].SelectSingleNode("FJXXS").SelectNodes("FJXX");
            InserOrUpdateAttachment(attachmentXmls, swbh, swlx, isreload, tran);
        }

        public void InserOrUpdateDetail_Mail(XmlNode receiveXml, string swbh, string bz, string swlx, IDbTransaction tran, string userid = null)
        {
            string json = Newtonsoft.Json.JsonConvert.SerializeXmlNode(receiveXml);
            MailModel mailModel = JsonConvert.DeserializeObject<MailModel>(json);
            B_OA_IEmail maildetail = mailModel.JBXX;
            maildetail.BZ = bz;
            maildetail.YWBH = swbh;
            maildetail.SWLX = swlx;
            maildetail.USERID = userid;
            maildetail.Condition.Add("YWBH =" + maildetail.YWBH);
            maildetail.Condition.Add("SWLX =" + maildetail.SWLX);
            if (!string.IsNullOrEmpty(maildetail.USERID))
            {
                maildetail.Condition.Add("USERID =" + userid);
            }
            if (Utility.Database.QueryObject(maildetail, tran) == null)
            {
                Utility.Database.Insert(maildetail, tran);
                _logger.InfoFormat("成功插入邮件！");
            }
            else
            {
                Utility.Database.Update(maildetail, tran);
                _logger.InfoFormat("成功修改邮件！");
            }
        }

        public void TaskDetail_LW(string xtbh, string swbh, string swlx, string isreload, IDbTransaction tran)
        {
            string xmlString = service.taskDetail(xtbh, swbh, swlx);
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(xmlString);
            XmlNodeList xmlNodeList = xmlDocument.SelectSingleNode("SW").SelectSingleNode("SWINFOS").ChildNodes;
            //处理意见
            //  XmlNodeList suggestXmls = xmlNodeList[0].SelectSingleNode("CLYJS").SelectNodes("CLYJ");
            //  InserOrUpdateSuggestion(suggestXmls, tran);
            //收文详情
            XmlNode receiveXml = xmlNodeList[0].SelectSingleNode("JBXX");
            InserOrUpdateDetail_LW(receiveXml, swbh, swlx, tran);
            //附件详情
            XmlNodeList attachmentXmls = xmlNodeList[0].SelectSingleNode("FJXXS").SelectNodes("FJXX");
            InserOrUpdateAttachment(attachmentXmls, swbh, swlx, isreload, tran);
        }

        public void TaskDetail_TZGG(string xtbh, string swbh, string swlx, string isreload, IDbTransaction tran)
        {
            //本地测试
            //XmlDocument xmlDocument = new XmlDocument();
            //var dir = Directory.GetCurrentDirectory();
            //string serverpath = dir + "\\taskDetai.xml";
            //xmlDocument.Load(serverpath);
            string xmlString = service.taskDetail(xtbh, swbh, swlx);
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(xmlString);
            XmlNodeList xmlNodeList = xmlDocument.SelectSingleNode("SW").SelectSingleNode("SWINFOS").ChildNodes;
            //附件详情
            XmlNodeList attachmentXmls = xmlNodeList[0].SelectSingleNode("FJXXS").SelectNodes("FJXX");
            InserOrUpdateAttachment(attachmentXmls, swbh, swlx, isreload, tran);
            //处理意见
            //   XmlNodeList suggestXmls = xmlNodeList[0].SelectSingleNode("CLYJS").SelectNodes("CLYJ");
            //   InserOrUpdateSuggestion(suggestXmls, tran);
            //文档详情
            XmlNode receiveXml = xmlNodeList[0].SelectSingleNode("JBXX");
            InserOrUpdateDetail_TZGG(receiveXml, swbh, swlx, tran);
        }

        public void InserOrUpdateSuggestion(XmlNodeList suggestionXmls, IDbTransaction tran)
        {
            foreach (XmlNode node in suggestionXmls)
            {
                string json = Newtonsoft.Json.JsonConvert.SerializeXmlNode(node);
                SuggestionModel CLYJModel = JsonConvert.DeserializeObject<SuggestionModel>(json);
                B_OA_ISuggestion suggestion = CLYJModel.CLYJ;
                suggestion.Condition.Add("TID = " + suggestion.TID);
                if (Utility.Database.QueryObject(suggestion, tran) == null)
                {
                    Utility.Database.Insert(suggestion, tran);
                    _logger.InfoFormat("成功插入意见数据！");
                }
                else
                {
                    suggestion.Condition.Add("TID = " + suggestion.TID);
                    Utility.Database.Update(suggestion, tran);
                    _logger.InfoFormat("成功修改意见表数据！");
                }
            }
        }

        /// <summary>
        /// 附件的删除与修改
        /// </summary>
        /// <param name="attachmentXmls"></param>
        /// <param name="swbh"></param>
        /// <param name="swlx"></param>
        /// <param name="tran"></param>
        public void InserOrUpdateAttachment(XmlNodeList attachmentXmls, string swbh, string swlx, string isreload, IDbTransaction tran)
        {
            foreach (XmlNode node in attachmentXmls)
            {
                string json = Newtonsoft.Json.JsonConvert.SerializeXmlNode(node);
                AttachmentModel JBXXModel = JsonConvert.DeserializeObject<AttachmentModel>(json);
                B_OA_IAttachment attachment = JBXXModel.FJXX;
                attachment.Condition.Add("WDBH = " + attachment.WDBH);
                attachment.Condition.Add("APPBH = " + attachment.APPBH);
                if (Utility.Database.QueryObject(attachment, tran) == null)
                {
                    Utility.Database.Insert(attachment, tran);
                    _logger.InfoFormat("成功插入附件表数据！");
                }
                else if (!string.IsNullOrEmpty(isreload))
                {
                    attachment.Condition.Add("WDBH = " + attachment.WDBH);
                    attachment.Condition.Add("APPBH = " + attachment.APPBH);
                    Utility.Database.Update(attachment, tran);
                    _logger.InfoFormat("成功修改附件表数据！");
                }
                //文件复制到相应文件夹
                service.taskAttachmentsDownload("qjc_lims_test", "TZGG", attachment.WDBH, 0, 100);
            }
        }

        /// <summary>
        /// 附件的删除与修改
        /// </summary>
        /// <param name="attachmentXmls"></param>
        /// <param name="swbh"></param>
        /// <param name="swlx"></param>
        /// <param name="tran"></param>
        public void InserOrUpdateAttachment2(XmlNodeList attachmentXmls, string swbh, string swlx, IDbTransaction tran)
        {
            foreach (XmlNode node in attachmentXmls)
            {
                string json = Newtonsoft.Json.JsonConvert.SerializeXmlNode(node);
                AttachmentModel JBXXModel = JsonConvert.DeserializeObject<AttachmentModel>(json);
                B_OA_IAttachment attachment = JBXXModel.FJXX;
                attachment.Condition.Add("WDBH = " + attachment.WDBH);
                attachment.Condition.Add("APPBH = " + attachment.APPBH);
                if (Utility.Database.QueryObject(attachment, tran) == null)
                {
                    Utility.Database.Insert(attachment, tran);
                    _logger.InfoFormat("成功插入附件表数据！");
                }
                else
                {
                    attachment.Condition.Add("WDBH = " + attachment.WDBH);
                    attachment.Condition.Add("APPBH = " + attachment.APPBH);
                    Utility.Database.Update(attachment, tran);
                    _logger.InfoFormat("成功修改附件表数据！");
                }
                //文件复制到相应文件夹
                service.taskAttachmentsDownload("qjc_lims_test", "TZGG", attachment.WDBH, 0, 100);
            }
        }

        /// <summary>
        /// 插入或者修改文档详情表
        /// </summary>
        /// <param name="receiveXml">xml数据</param>
        /// <param name="xtbh">系统编号</param>
        /// <param name="swbh">收文编号</param>
        /// <param name="swlx">收文类型</param>
        /// <param name="tran">事务</param>
        public void InserOrUpdateDetail_TZGG(XmlNode receiveXml, string swbh, string swlx, IDbTransaction tran)
        {
            string json = Newtonsoft.Json.JsonConvert.SerializeXmlNode(receiveXml);
            TZGGModel TZGGModel = JsonConvert.DeserializeObject<TZGGModel>(json);
            B_OA_ITaskDetail taskDetail = TZGGModel.JBXX;
            taskDetail.YWBH = swbh;
            taskDetail.SWLX = swlx;
            taskDetail.Condition.Add("YWBH =" + taskDetail.YWBH);
            taskDetail.Condition.Add("SWLX =" + taskDetail.SWLX);
            if (Utility.Database.QueryObject(taskDetail, tran) == null)
            {
                Utility.Database.Insert(taskDetail, tran);
                _logger.InfoFormat("成功插入通知公告！");
            }
            else
            {
                Utility.Database.Update(taskDetail, tran);
                _logger.InfoFormat("成功修改通知公告！");
            }
        }

        public void InserOrUpdateDetail_LW(XmlNode receiveXml, string swbh, string swlx, IDbTransaction tran)
        {
            string json = Newtonsoft.Json.JsonConvert.SerializeXmlNode(receiveXml);
            LWModel lwModel = JsonConvert.DeserializeObject<LWModel>(json);
            B_OA_ILW lw = lwModel.JBXX;
            lw.YWBH = swbh;
            lw.Condition.Add("YWBH =" + lw.YWBH);
            if (Utility.Database.QueryObject(lw, tran) == null)
            {
                Utility.Database.Insert(lw, tran);
                _logger.InfoFormat("成功插入收文数据！");
            }
            else
            {
                // lw.Condition.Add("YWBH =" + lw.YWBH);
                Utility.Database.Update(lw, tran);
                _logger.InfoFormat("成功修改收文数据！");
            }
        }

        public class TestModel
        {
            public FJXXS FJXXS;
        }

        public class FJXXS
        {
            public List<B_OA_IAttachment> FJXX;
        }

        public class SuggestionModel
        {
            public B_OA_ISuggestion CLYJ;
        }

        public class AttachmentModel
        {
            public B_OA_IAttachment FJXX;
        }

        public class MailModel
        {
            public B_OA_IEmail JBXX;
        }

        public class TZGGModel
        {
            public B_OA_ITaskDetail JBXX;
        }

        public class LWModel
        {
            public B_OA_ILW JBXX;
        }

        public class FWModel
        {
            public B_OA_IFW JBXX;
        }
    }
}
