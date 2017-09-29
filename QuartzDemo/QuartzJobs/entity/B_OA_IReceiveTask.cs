using IWorkFlow.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuartzDemo.QuartzJobs.entity
{
    [Serializable]
    [DataTableInfo("B_OA_IReceiveTask", "YWBH")]
    public class B_OA_IReceiveTask : QueryInfo
    {
        public B_OA_IReceiveTask() { }
        public B_OA_IReceiveTask(string userid, string ywbh, string swlx,
            string swbt, string swlcbh,string swzt, string fkyj, string bz)
        {
            this.USERID = userid;
            this.YWBH = ywbh;
            this.SWLX = swlx;
            this.SWBT = swbt;
            this.SWLCBH = swlcbh;
            this.SWZT = swzt;
            this.FKYJ = fkyj;
            this.BZ = bz;
        }
        [DataField("USERID", "B_OA_IReceiveTask")]
        public string USERID { get; set; }

        [DataField("YWBH", "B_OA_IReceiveTask")]
        public string YWBH { get; set; }

        [DataField("SWLX", "B_OA_IReceiveTask")]
        public string SWLX { get; set; }

        [DataField("SWBT", "B_OA_IReceiveTask")]
        public string SWBT { get; set; }

        [DataField("SWLCBH", "B_OA_IReceiveTask")]
        public string SWLCBH { get; set; }

        [DataField("SWZT", "B_OA_IReceiveTask")]
        public string SWZT { get; set; }

        [DataField("FKYJ", "B_OA_IReceiveTask")]
        public string FKYJ { get; set; }

        [DataField("BZ", "B_OA_IReceiveTask")]
        public string BZ { get; set; }

    }
}
