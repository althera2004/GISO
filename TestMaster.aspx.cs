using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;
using System.Web.UI;
using GisoFramework.Item;

public partial class TestMaster : Page
{
    private Giso master;
    private ReadOnlyCollection<Document> documents;

    public int DocumentsNumber { get { return this.documents.Count; } }
    public int DocumentsRecentNumber { get { return Document.Recent(this.documents).Count; } }
    public int DocumentsDraftsNumber { get { return Document.Drafts(this.documents).Count; } }

    public string UltimosDocumentos
    {
        get
        {
            StringBuilder res = new StringBuilder(string.Empty);
            foreach (Document doc in Document.Recent(this.documents))
            {
                string ribbon = "success";
                DocumentVersion version = doc.LastVersion;
                switch (doc.LastVersion.State)
                {
                    case DocumentStatus.Draft:
                        ribbon = "info";
                        break;
                    case DocumentStatus.Obsolete:
                        ribbon = "danger";
                        break;
                }

                res.Append(string.Format(@"
                    <tr>
						<td><a href=""DocumentView.aspx?id={4}"">{0}</a></td>
						<td>
							<small><s class=""red""></s></small>
							<b class=""green"">V{1}</b>
						</td>
						<td class=""hidden-480"">
							<span class=""label label-{3} arrowed-right arrowed-in"">{2}</span>
						</td>
					</tr>", doc.Description, version.Version, version.State, ribbon, doc.Id.ToString().Trim()));
            }

            return res.ToString();
        }
    }

    /// <summary>
    /// Gets the dictionary for interface texts
    /// </summary>
    public Dictionary<string, string> Dictionary
    {
        get
        {
            return master.Dictionary;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.master = this.Master as Giso;
        string serverPath = this.Request.Url.AbsoluteUri.Replace(this.Request.RawUrl.Substring(1), string.Empty);
        this.master.AddBreadCrumb("Cuadro de mandos");
        this.master.Titulo = "Cuadro de mandos";
        this.documents = Document.GetByCompany(master.Company);
    }
}