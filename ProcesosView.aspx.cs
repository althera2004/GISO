using System;
using System.Collections.Generic;
using System.Web.UI;
using GisoFramework.Item;

public partial class ProcesosView : Page
{
    #region Fields
    private Giso master;
    private int processId;
    private Process process;
    private Company company;
    private Dictionary<string, string> dictionary;
    #endregion

    #region Fields
    public Process Proceso
    {
        get
        {
            return this.process;
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
    #endregion

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

        if (this.Request.QueryString["id"] != null)
        {
            this.processId = Convert.ToInt32(this.Request.QueryString["id"].ToString());
        }

        this.company = (Company)Session["company"];
        this.dictionary = Session["Dictionary"] as Dictionary<string, string>;

        if (processId > 0)
        {
            this.process = new Process(this.processId, this.company.Id);
            this.LtModificado.Text = string.Format("<strong>{0}</strong><br />{1}", this.process.ModifiedBy.FullName, this.process.ModifiedOn);
        }
        else
        {
            this.process = Process.Empty;
            this.LtModificado.Text = string.Format("<i>({0})</i>", this.dictionary["Nuevo"]);
        }

        string label = this.processId == -1 ? "Nuevo proceso" : "Editar proceso";
        this.master = this.Master as Giso;
        string serverPath = this.Request.Url.AbsoluteUri.Replace(this.Request.RawUrl.Substring(1), string.Empty);
        this.master.AddBreadCrumb("Procesos", "ProcesosList.aspx", false);
        this.master.AddBreadCrumb(label);
        this.master.Titulo = label;

        if (!IsPostBack)
        {
            //this.RenderEmployees();
            //this.RenderDepartamentos();
            //this.GetEmployeeDepartmentMemberShip();
        }
    }
}