using IWorkFlow.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuartzDemo.QuartzJobs.entity
{
    [Serializable]
    [DataTableInfo("B_OA_IEmail", "YWBH")]
    public class B_OA_IEmail : QueryInfo
    {
        
        [DataField("YWBH", "B_OA_IEmail")]
        public string YWBH { get; set; }

        [DataField("LBBH", "B_OA_IEmail")]
        public string LBBH { get; set; }

        [DataField("SWLX", "B_OA_IEmail")]
        public string SWLX { get; set; }
        
        [DataField("SWBT", "B_OA_IEmail")]
        public string SWBT { get; set; }

        [DataField("CJR", "B_OA_IEmail")]
        public string CJR { get; set; }

        [DataField("CJSJ", "B_OA_IEmail")]
        public DateTime? CJSJ { get; set; }

        [DataField("BZ", "B_OA_IEmail")]
        public string BZ { get; set; }

        [DataField("BZTEXT", "B_OA_IEmail")]
        public string BZTEXT { get; set; }
        
    }
}
