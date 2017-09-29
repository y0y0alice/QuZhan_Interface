using IWorkFlow.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuartzDemo.QuartzJobs.entity
{
    [Serializable]
    [DataTableInfo("B_OA_ISuggestion", "TID")]
    public class B_OA_ISuggestion : QueryInfo
    {
        [DataField("TID", "B_OA_ISuggestion")]
        public string TID { get; set; }

        [DataField("TZBH", "B_OA_ISuggestion")]
        public string TZBH { get; set; }

        [DataField("DM", "B_OA_ISuggestion")]
        public string DM { get; set; }
        
        [DataField("MC", "B_OA_ISuggestion")]
        public string MC { get; set; }

        [DataField("FKNR", "B_OA_ISuggestion")]
        public string FKNR { get; set; }

        [DataField("RRQ", "B_OA_ISuggestion")]
        public string RRQ { get; set; }

        [DataField("VIP", "B_OA_ISuggestion")]
        public string VIP { get; set; }

        [DataField("ZT", "B_OA_ISuggestion")]
        public string ZT { get; set; }

        [DataField("UID", "B_OA_ISuggestion")]
        public string UID { get; set; }

        [DataField("RUID", "B_OA_ISuggestion")]
        public string RUID { get; set; }

        [DataField("CJR", "B_OA_ISuggestion")]
        public string CJR { get; set; }

        [DataField("CJSJ", "B_OA_ISuggestion")]
        public string CJSJ { get; set; }

        [DataField("XGR", "B_OA_ISuggestion")]
        public string XGR { get; set; }
        
        [DataField("XGSJ", "B_OA_ISuggestion")]
        public string XGSJ { get; set; }
        
        [DataField("ORGID", "B_OA_ISuggestion")]
        public string ORGID { get; set; }
        
    }
}
