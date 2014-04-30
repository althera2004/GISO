using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Collections.ObjectModel;
using GisoFramework;
using GisoFramework.Activity;
using GisoFramework.Item;
using GisoFramework.UserInterface;

public partial class FormacionList : Page
{
    private Giso master;
    private Company company;
    private Dictionary<string, string> dictionary;
    private string learningData;

    public string LearningData
    {
        get
        {
            return this.learningData;
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

        this.company = (Company)Session["company"];
        this.dictionary = Session["Dictionary"] as Dictionary<string, string>; 
        this.master = this.Master as Giso;
        string serverPath = this.Request.Url.AbsoluteUri.Replace(this.Request.RawUrl.Substring(1), string.Empty);
        this.master.AddBreadCrumb("Formación");
        this.master.Titulo = "Formación";
        this.RenderLearningData();
    }

    private void RenderLearningData()
    {
        StringBuilder res = new StringBuilder();
        StringBuilder json = new StringBuilder("[");

        bool first = true;
        foreach (Assistant assistant in Assistant.GetAll(this.company.Id, null, null))
        {
            res.Append(assistant.GetRow(this.dictionary));

            if (first)
            {
                first = false;
            }
            else
            {
                json.Append(",");
            }

            json.Append(assistant.Json);
        }

        this.LtLearningTable.Text = res.ToString();
        this.learningData = json.ToString();
    }
}