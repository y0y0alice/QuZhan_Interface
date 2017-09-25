using IWorkFlow.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuartzDemo.QuartzJobs.entity
{
    [Serializable]
    [DataTableInfo("B_OA_IAttachment", "WDBH")]
    public class B_OA_IAttachment : QueryInfo
    {
        [DataField("WDBH", "B_OA_IAttachment")]
        public string WDBH { get; set; }

        [DataField("APPBH", "B_OA_IAttachment")]
        public string APPBH { get; set; }

        [DataField("WDMC", "B_OA_IAttachment")]
        public string WDMC { get; set; }

        [DataField("WDLX", "B_OA_IAttachment")]
        public string WDLX { get; set; }

        [DataField("WDSX", "B_OA_IAttachment")]
        public string WDSX { get; set; }

        [DataField("WDDX", "B_OA_IAttachment")]
        public string WDDX { get; set; }

        [DataField("WDYYR", "B_OA_IAttachment")]
        public string WDYYR { get; set; }

        [DataField("WDZT", "B_OA_IAttachment")]
        public string WDZT { get; set; }

        [DataField("WDMS", "B_OA_IAttachment")]
        public string WDMS { get; set; }

        [DataField("WDZZ", "B_OA_IAttachment")]
        public string WDZZ { get; set; }

        [DataField("WDLJ", "B_OA_IAttachment")]
        public string WDLJ { get; set; }

        [DataField("SYSTEMID", "B_OA_IAttachment")]
        public string SYSTEMID { get; set; }

        [DataField("WDBT", "B_OA_IAttachment")]
        public string WDBT { get; set; }

        [DataField("DQBB", "B_OA_IAttachment")]
        public string DQBB { get; set; }

        [DataField("WDHZ", "B_OA_IAttachment")]
        public string WDHZ { get; set; }

        [DataField("CJSJ", "B_OA_IAttachment")]
        public string CJSJ { get; set; }

        [DataField("CJR", "B_OA_IAttachment")]
        public string CJR { get; set; }
    }
}
