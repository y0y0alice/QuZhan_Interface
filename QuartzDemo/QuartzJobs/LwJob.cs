﻿using IWorkFlow.Host;
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

        WebService1 service = new WebService1();
        /// <summary>
        /// 待收文任务列表
        /// </summary>
        public void unReceiveTasks()
        {
            IList<B_OA_IReceiveTask> receiveList = new List<B_OA_IReceiveTask>();

            //用于本地测试
            XmlDocument xmlDocument = new XmlDocument();
            var dir = Directory.GetCurrentDirectory();
            string serverpath = dir + "\\unReceiveTasks.xml";
            xmlDocument.Load(serverpath);
            XmlNodeList xmlNodeList = xmlDocument.SelectSingleNode("SW").SelectSingleNode("SWINFOS").ChildNodes;

            //wsdl发布测试
            //string returnXml = service.unReceiveTasks("qjc_lims_test");
            //_logger.InfoFormat("接口连接成功!");
            //XmlDocument xmlDocument = new XmlDocument();
            //xmlDocument.LoadXml(returnXml);
            //XmlNodeList xmlNodeList = xmlDocument.SelectSingleNode("SW").SelectSingleNode("SWINFOS").ChildNodes;

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
                    //条件查找
                    receive.Condition.Add("YWBH =" + detail.SelectSingleNode("YWBH").InnerText);
                    receive.Condition.Add("SWLX =" + detail.SelectSingleNode("SWLX").InnerText);
                    if (Utility.Database.QueryObject(receive, tran) == null)
                    {
                        Utility.Database.Insert(receive, tran);
                        _logger.InfoFormat("成功插入待收任务据！");
                    };
                    //添加或者修改通知公告详细内容
                    //if (receive.SWLX == "TZGG")
                    //{
                    //    TaskDetail_TZGG("qjc_lims_test", receive.YWBH, receive.SWLX, tran);
                    //}
                    //else if (receive.SWLX == "LW") {
                    //    TaskDetail_LW("qjc_lims_test", receive.YWBH, receive.SWLX, tran);
                    //}

                    //收文测试
                    if (receive.SWLX == "LW")
                    {
                        TaskDetail_LW("qjc_lims_test", receive.YWBH, receive.SWLX, tran);
                    }
                    else
                    {
                        TaskDetail_TZGG("qjc_lims_test", receive.YWBH, receive.SWLX, tran);
                    }
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

        public void TaskDetail_LW(string xtbh, string swbh, string swlx, IDbTransaction tran)
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
            InserOrUpdateAttachment(attachmentXmls, swbh, swlx, tran);
        }

        public void TaskDetail_TZGG(string xtbh, string swbh, string swlx, IDbTransaction tran)
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
            InserOrUpdateAttachment(attachmentXmls, swbh, swlx, tran);
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
        public void InserOrUpdateAttachment(XmlNodeList attachmentXmls, string swbh, string swlx, IDbTransaction tran)
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

        public class TZGGModel
        {
            public B_OA_ITaskDetail JBXX;
        }

        public class LWModel
        {
            public B_OA_ILW JBXX;
        }
    }
}
