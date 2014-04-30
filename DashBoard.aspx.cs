using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using GisoFramework;
using GisoFramework.Item;
using GisoFramework.UserInterface;

public partial class DashBoard : Page
{
    private Company company;
    private ApplicationUser user;
    private Dictionary<string, string> dictionary;
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
            return this.dictionary;
        }
    }

    public string UserLanguage { get { return this.user.Language; } }

    public new string User
    {
        get
        {
            return this.user.Json;
        }
    }

    public string CompanyId
    {
        get
        {
            return this.company.Id.ToString();
        }
    }

    public string CompanyData
    {
        get
        {
            return Company.ToJson(this.company);
        }
    }

    public Company Company { get { return this.company; } }

    /// <summary>
    /// Page's load event
    /// </summary>
    /// <param name="sender">Loaded page</param>
    /// <param name="e">Event's arguments</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            this.Response.Redirect("Default.aspx");
        }

        this.user = new ApplicationUser(Convert.ToInt32(Session["UserId"]));
        this.company = (Company)Session["Company"];
        this.dictionary = Session["Dictionary"] as Dictionary<string, string>;
        this.LeftMenu.Text = new LeftMenu(this.user, this.dictionary).Render();
        this.documents = Document.GetByCompany(this.company);
    }
}