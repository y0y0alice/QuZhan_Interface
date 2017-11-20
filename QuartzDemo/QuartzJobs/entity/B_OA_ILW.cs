using IWorkFlow.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuartzDemo.QuartzJobs.entity
{
    [Serializable]
    [DataTableInfo("B_OA_ILW", "YWBH")]
    public class B_OA_ILW : QueryInfo
    {
        //来文编号
        [DataField("YWBH", "B_OA_ILW")]
        public string YWBH { get; set; }

        //来文标题
        [DataField("LWBT", "B_OA_ILW")]
        public string LWBT { get; set; }

        //来文日期
        [DataField("LWRQ", "B_OA_ILW")]
        public DateTime? LWRQ { get; set; }

        //来文单位
        [DataField("LWDW", "B_OA_ILW")]
        public string LWDW { get; set; }

        //来文文号
        [DataField("LWWH", "B_OA_ILW")]
        public string LWWH { get; set; }
        
        //厅拟办意见
        [DataField("TNBYJ", "B_OA_ILW")]
        public string TNBYJ { get; set; }

        //编号
        [DataField("BH", "B_OA_ILW")]
        public string BH { get; set; }

        //编号
        [DataField("XH", "B_OA_ILW")]
        public string XH { get; set; }

        //编号
        [DataField("BWBH", "B_OA_ILW")]
        public string BWBH { get; set; }
        
    }
}
