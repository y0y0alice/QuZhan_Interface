using IWorkFlow.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuartzDemo.QuartzJobs.entity
{
    [Serializable]
    [DataTableInfo("T_OA_JKFW_YBJSRWLB", "ywbh")]
    public class T_OA_JKFW_YBJSRWLB : QueryInfo
    {

        public T_OA_JKFW_YBJSRWLB(string userid, string ywbh, string swlx,
            string swbt, string swlcbh, string sfzdjr, string swzt, string fkyj, string bz)
        {
            this.USERID = userid;
            this.YWBH = ywbh;
            this.SWLX = swlx;
            this.SWBT = swbt;
            this.SWLCBH = swlcbh;
            this.SFZDJR = sfzdjr;
            this.SWZT = swzt;
            this.FKYJ = fkyj;
            this.BZ = bz;
        }
        [DataField("USERID", "T_OA_JKFW_YBJSRWLB")]
        public string USERID { get; set; }

        [DataField("YWBH", "T_OA_JKFW_YBJSRWLB")]
        public string YWBH { get; set; }

        [DataField("SWLX", "T_OA_JKFW_YBJSRWLB")]
        public string SWLX { get; set; }

        [DataField("SWBT", "T_OA_JKFW_YBJSRWLB")]
        public string SWBT { get; set; }

        [DataField("SWLCBH", "T_OA_JKFW_YBJSRWLB")]
        public string SWLCBH { get; set; }

        [DataField("SFZDJR", "T_OA_JKFW_YBJSRWLB")]
        public string SFZDJR { get; set; }

        [DataField("SWZT", "T_OA_JKFW_YBJSRWLB")]
        public string SWZT { get; set; }

        [DataField("FKYJ", "T_OA_JKFW_YBJSRWLB")]
        public string FKYJ { get; set; }

        [DataField("BZ", "T_OA_JKFW_YBJSRWLB")]
        public string BZ { get; set; }

    }
}
