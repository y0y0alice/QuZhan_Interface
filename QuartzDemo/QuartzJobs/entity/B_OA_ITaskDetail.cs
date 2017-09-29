using IWorkFlow.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
namespace QuartzDemo.QuartzJobs.entity
{
    [Serializable]
    [DataTableInfo("B_OA_ITaskDetail", "YWBH")]
    public class B_OA_ITaskDetail :  QueryInfo
    {

        public B_OA_ITaskDetail() { }

       
        [DataField("USERID", "B_OA_ITaskDetail")]
        public string USERID { get; set; }

       
        [DataField("YWBH", "B_OA_ITaskDetail")]
        public string YWBH { get; set; }

       
        [DataField("SWLX", "B_OA_ITaskDetail")]
        public string SWLX { get; set; }

       
       [DataField("SWLCBH", "B_OA_ITaskDetail")]
        public string SWLCBH { get; set; }

       
        [DataField("SWZT", "B_OA_ITaskDetail")]
        public string SWZT { get; set; }

       
       [DataField("FKYJ", "B_OA_ITaskDetail")]
        public string FKYJ { get; set; }

       
       [DataField("BZ", "B_OA_ITaskDetail")]
        public string BZ { get; set; }

       
        [DataField("LCDYBH", "B_OA_ITaskDetail")]
        public string LCDYBH { get; set; }

       
        [DataField("BZDYBH", "B_OA_ITaskDetail")]
        public string BZDYBH { get; set; }

       
       [DataField("BZBH", "B_OA_ITaskDetail")]
        public string BZBH { get; set; }

       
        [DataField("SWBT", "B_OA_ITaskDetail")]
        public string SWBT { get; set; }

       
        [DataField("TZNR", "B_OA_ITaskDetail")]
        public string TZNR { get; set; }

       
        [DataField("TZNRTEXT", "B_OA_ITaskDetail")]
        public string TZNRTEXT { get; set; }


       
       [DataField("TZZT", "B_OA_ITaskDetail")]
        public string TZZT { get; set; }

       
        [DataField("TZJSR", "B_OA_ITaskDetail")]
        public string TZJSR { get; set; }

       
       [DataField("SFYX", "B_OA_ITaskDetail")]
        public string SFYX { get; set; }

       
       [DataField("YXJ", "B_OA_ITaskDetail")]
        public string YXJ { get; set; }

       [DataField("JSFS", "B_OA_ITaskDetail")]
        public string JSFS { get; set; }

       [DataField("ZXFK", "B_OA_ITaskDetail")]
        public string ZXFK { get; set; }

        [DataField("CJSJ", "B_OA_ITaskDetail")]
        public DateTime? CJSJ { get; set; }

       [DataField("CJR", "B_OA_ITaskDetail")]
        public string CJR { get; set; }

       [DataField("WRITER", "B_OA_ITaskDetail")]
        public string WRITER { get; set; }


       [DataField("TITLETYPE", "B_OA_ITaskDetail")]
        public string TITLETYPE { get; set; }

       [DataField("TITLECOLOR", "B_OA_ITaskDetail")]
        public string TITLECOLOR { get; set; }


       [DataField("TITLESIZE", "B_OA_ITaskDetail")]
        public int? TITLESIZE { get; set; }


       [DataField("COPYFROM", "B_OA_ITaskDetail")]
        public string COPYFROM { get; set; }

       [DataField("PCDATE", "B_OA_ITaskDetail")]
        public DateTime? PCDATE { get; set; }


       [DataField("SAVEPATH", "B_OA_ITaskDetail")]
        public string SAVEPATH { get; set; }

       [DataField("FILENAME", "B_OA_ITaskDetail")]
        public string FILENAME { get; set; }

       [DataField("FILEEXNAME", "B_OA_ITaskDetail")]
        public string FILEEXNAME { get; set; }

       [DataField("SHR", "B_OA_ITaskDetail")]
        public string SHR { get; set; }


       [DataField("SHRQ", "B_OA_ITaskDetail")]
        public string SHRQ { get; set; }
        
       [DataField("QF", "B_OA_ITaskDetail")]
        public string QF { get; set; }
        
       [DataField("NGRQ", "B_OA_ITaskDetail")]
        public DateTime? NGRQ {get; set; }


       [DataField("GLBH", "B_OA_ITaskDetail")]
        public string GLBH { get; set; }
        
       [DataField("TZMB", "B_OA_ITaskDetail")]
        public string TZMB { get; set; }
        
       [DataField("ZBDW", "B_OA_ITaskDetail")]
        public string ZBDW { get; set; }
        
       [DataField("FBR", "B_OA_ITaskDetail")]
        public string FBR { get; set; }
        
       [DataField("NGR", "B_OA_ITaskDetail")]
        public string NGR { get; set; }


       [DataField("NGSJ", "B_OA_ITaskDetail")]
        public DateTime? NGSJ { get; set; }


       [DataField("CSHGR", "B_OA_ITaskDetail")]
        public string CSHGR { get; set; }

       [DataField("HGSJ", "B_OA_ITaskDetail")]
        public DateTime? HGSJ { get; set; }

       [DataField("TGSSG", "B_OA_ITaskDetail")]
        public string TGSSG { get; set; }

       [DataField("TLDQF", "B_OA_ITaskDetail")]
        public string TLDQF { get; set; }

       [DataField("QFSJ", "B_OA_ITaskDetail")]
        public DateTime? QFSJ { get; set; }

       [DataField("TGXXID", "B_OA_ITaskDetail")]
        public string TGXXID { get; set; }

       [DataField("DXNR", "B_OA_ITaskDetail")]
        public string DXNR { get; set; }

        [DataField("CSSHZT", "B_OA_ITaskDetail")]
        public string CSSHZT { get; set; }

       [DataField("CHYJ", "B_OA_ITaskDetail")]
        public string CHYJ { get; set; }
        }
}
