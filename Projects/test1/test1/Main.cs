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
      if (element.NextNode != null) {
	StringBuilder sb = new StringBuilder ();
	sb.Append (String.Format ("NodeType: " + element.NodeType.ToString ().PadRight (10) + "NodeName: " + element.Name));
	sb.Append (String.Format ("NodeType: " + element.NextNode.NodeType.ToString ().PadRight (10) + "NodeName: " + element.Name));
	element.Add (new XAttribute ("MyAttr", "Attribute Value"));
	Console.WriteLine (sb.ToString ());

	switch (node.NodeType)
	  {
	  case XmlNodeType.Text:
            sb.Append((node as XText).Value);
            break;
	  case XmlNodeType.Element:
            sb.Append((node as XElement).Name);
            break;
	  case XmlNodeType.Comment:
            sb.Append((node as XComment).Value);
            break;
	  }

      }
			
    }
    doc.Save("1.xml");
		         
  }
}
