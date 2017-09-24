using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml.Serialization;
using Newtonsoft.Json;

namespace VIM.Data.Common.Parser
{
    /// <summary>
    /// TOP XML响应通用解释器。
    /// </summary>
    public class TopToXml //: ITopParser
    {
        
        //private static Dictionary<string, XmlSerializer> parsers = new Dictionary<string, XmlSerializer>();

        #region ITopParser Members

        ///// <summary>
        ///// 对象数组转成XML格式
        ///// </summary>
        ///// <typeparam name="T">对象类型</typeparam>
        ///// <param name="data">数组</param>
        ///// <returns></returns>
        //public string ToXml<T>(T[] data) where T : DBFields
        //{
        //    Type t= typeof(T);
        //    StringBuilder strxml = new StringBuilder();
        //    strxml.AppendFormat("<{0}s>", t.Name).AppendLine();
        //    foreach (T field in data)
        //    {
        //        strxml.AppendFormat("{0}", field.ToXml()).AppendLine();
        //    }
        //    strxml.AppendFormat("</{0}s>", t.Name).AppendLine();
        //    //if (data == null || data.Length == 0) return "";
        //    //Type type = data[0].GetType();            

        //    //string key = type.FullName;            

        //    //XmlSerializer serializer = null;
        //    //bool incl = parsers.TryGetValue(key, out serializer);
        //    //if (!incl || serializer == null)
        //    //{
        //    //    XmlAttributes rootAttrs = new XmlAttributes();
        //    //    rootAttrs.XmlRoot = new XmlRootAttribute(key+"s");

        //    //    XmlAttributeOverrides attrOvrs = new XmlAttributeOverrides();
        //    //    attrOvrs.Add(type, rootAttrs);

        //    //    serializer = new XmlSerializer(data.GetType(), attrOvrs);
        //    //    //serializer = new XmlSerializer(type, new XmlRootAttribute(rootTagName));
        //    //    parsers[key] = serializer;
        //    //}
        //    //string strRet = "";
        //    //using (MemoryStream stream = new MemoryStream())
        //    //{
        //    //    serializer.Serialize(stream,data);
        //    //    byte[] by = stream.ToArray();
        //    //    strRet = Encoding.UTF8.GetString(by);
        //    //}
        //    //strxml.AppendFormat("</{0}s>", t.Name).AppendLine();
        //    //string path = AppDomain.CurrentDomain.BaseDirectory;
        //    //using (StreamWriter st = new StreamWriter(path +t.Name + ".xml",false,Encoding.UTF8))
        //    //{
        //    //    st.Write(strxml.ToString());
        //    //}
        //    return strxml.ToString();
        //}

        /// <summary>
        /// 对象数组转成XML格式
        /// </summary>
        /// <typeparam name="T">对象类型</typeparam>
        /// <param name="data">数组</param>
        /// <returns></returns>
        public static string ToXml<T>(List<T> data) where T : DBFields
        {
            Type t = typeof(T);
            StringBuilder strxml = new StringBuilder();
            strxml.AppendFormat("<{0}s>", t.Name).AppendLine();
            foreach (T field in data)
            {
                strxml.AppendFormat("{0}", field.ToXml()).AppendLine();
            }
            strxml.AppendFormat("</{0}s>", t.Name).AppendLine();
            //if (data == null || data.Length == 0) return "";
            //Type type = data[0].GetType();            

            //string key = type.FullName;            

            //XmlSerializer serializer = null;
            //bool incl = parsers.TryGetValue(key, out serializer);
            //if (!incl || serializer == null)
            //{
            //    XmlAttributes rootAttrs = new XmlAttributes();
            //    rootAttrs.XmlRoot = new XmlRootAttribute(key+"s");

            //    XmlAttributeOverrides attrOvrs = new XmlAttributeOverrides();
            //    attrOvrs.Add(type, rootAttrs);

            //    serializer = new XmlSerializer(data.GetType(), attrOvrs);
            //    //serializer = new XmlSerializer(type, new XmlRootAttribute(rootTagName));
            //    parsers[key] = serializer;
            //}
            //string strRet = "";
            //using (MemoryStream stream = new MemoryStream())
            //{
            //    serializer.Serialize(stream,data);
            //    byte[] by = stream.ToArray();
            //    strRet = Encoding.UTF8.GetString(by);
            //}
            //strxml.AppendFormat("</{0}s>", t.Name).AppendLine();
            //string path = AppDomain.CurrentDomain.BaseDirectory;
            //using (StreamWriter st = new StreamWriter(path +t.Name + ".xml",false,Encoding.UTF8))
            //{
            //    st.Write(strxml.ToString());
            //}
            return strxml.ToString();
        }

        /// <summary>
        /// 对象数组转成XML格式
        /// </summary>
        /// <typeparam name="T">对象类型</typeparam>
        /// <param name="data">数组</param>
        /// <param name="bCreateRoot">是否创建根节点，true创建，false不创建</param>
        /// <param name="bFilterAuto">是否过滤自增长字段，true过滤，false不过滤</param>
        /// <returns></returns>
        public static string ToXml<T>(List<T> data, bool bCreateRoot = true, bool bFilterAuto = true) where T : DBFields
        {
            Type t = typeof(T);
            StringBuilder strxml = new StringBuilder();
            if (bCreateRoot)
            {
                strxml.AppendFormat("<{0}s>", t.Name).AppendLine();
            }
            foreach (T field in data)
            {
                strxml.AppendFormat("{0}", field.ToXml(bFilterAuto)).AppendLine();
            }
            if (bCreateRoot)
            {
                strxml.AppendFormat("</{0}s>", t.Name).AppendLine();
            }

            return strxml.ToString();
        }

        //public string ToXml<T>(T data) //where T : DBFields
        //{
            
        //    //if (data == null || data.Length == 0) return "";
        //    Type type = data.GetType();

        //    string key = type.FullName;

        //    XmlSerializer serializer = null;
        //    bool incl = parsers.TryGetValue(key, out serializer);
        //    if (!incl || serializer == null)
        //    {
        //        //XmlAttributes rootAttrs = new XmlAttributes();
        //        //string strroot = type.Name;
        //        //if (type.IsArray)
        //        //{
        //        //    strroot = type.Name.Replace("[", "").Replace("]", "") + "s";
        //        //}
        //        //rootAttrs.XmlRoot = new XmlRootAttribute(strroot);

        //        //XmlAttributeOverrides attrOvrs = new XmlAttributeOverrides();
        //        //attrOvrs.Add(type, rootAttrs);

        //        //serializer = new XmlSerializer(type, attrOvrs);
        //        //serializer = new XmlSerializer(type, new XmlRootAttribute(rootTagName));
        //        serializer = new XmlSerializer(type);
        //        parsers[key] = serializer;
        //    }
        //    string strRet = "";
        //    using (MemoryStream stream = new MemoryStream())
        //    {
        //        serializer.Serialize(stream, data);
        //        byte[] by = stream.ToArray();
        //        strRet = Encoding.UTF8.GetString(by);
        //    }

        //    return strRet;
        //}

        #endregion

        
    }
}
