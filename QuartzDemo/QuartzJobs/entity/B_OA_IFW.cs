using IWorkFlow.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuartzDemo.QuartzJobs.entity
{
    [Serializable]
    [DataTableInfo("B_OA_IFW", "YWBH")]
    public class B_OA_IFW : QueryInfo
    {
        //业务编号
        [DataField("YWBH", "B_OA_IFW")]
        public string YWBH { get; set; }

        //收文类型
        [DataField("SWLX", "B_OA_IFW")]
        public string SWLX { get; set; }

        //收文标题
        [DataField("SWBT", "B_OA_IFW")]
        public string SWBT { get; set; }

        //文号
        [DataField("WH", "B_OA_IFW")]
        public string WH { get; set; }

        //发文单位
        [DataField("FBDW", "B_OA_IFW")]
        public string FBDW { get; set; }

        //文件名称
        [DataField("WJMC", "B_OA_IFW")]
        public string WJMC { get; set; }

        //修订人
        [DataField("XDR", "B_OA_IFW")]
        public string XDR { get; set; }

        //主送
        [DataField("ZS", "B_OA_IFW")]
        public string ZS { get; set; }

        //抄送
        [DataField("CS", "B_OA_IFW")]
        public string CS { get; set; }

        //抄报
        [DataField("CB", "B_OA_IFW")]
        public string CB { get; set; }

        //编号
        [DataField("BH", "B_OA_IFW")]
        public string BH { get; set; }

        //签发时间
        [DataField("QFSJ", "B_OA_IFW")]
        public DateTime? QFSJ { get; set; }

        
        //接收时间
        [DataField("receiveTime", "B_OA_IFW")]
        public DateTime? receiveTime { get; set; }
    }
}
