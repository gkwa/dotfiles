// http://stackoverflow.com/questions/5118788/linq-to-xml-how-to-select-the-next-element
// http://msdn.microsoft.com/en-us/library/system.xml.linq.xnode.nextnode%28v=vs.95%29.aspx

using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using System.Xml;
using System;

class Test
{
  static void Main (){
    XDocument doc = XDocument.Load ("hd-mp-bundle.packproj");
    foreach (var element in doc.Descendants ("key").Where (x => (string)x == "Path")) {
      XNode node = element;
      string p = ((XElement)node.NextNode).Value;
      string p2 = p.Replace("/Users/demo/pdev/mediaplayer-hd-osx/", "");
      ((XElement)node.NextNode).Value = p2;
    }
    doc.Save("1.xml");
		         
  }
}
