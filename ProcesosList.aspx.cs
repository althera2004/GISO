using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Text;
using System.Web.UI;
using GisoFramework.Item;

public partial class ProcesosList : Page
{
    private Giso master;

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

        this.master = this.Master as Giso;
        string serverPath = this.Request.Url.AbsoluteUri.Replace(this.Request.RawUrl.Substring(1), string.Empty);
        this.master.AddBreadCrumb("Procesos");
        this.master.Titulo = "Procesos";
        this.RenderProcesosData();
    }

    private void RenderProcesosData()
    {
        StringBuilder res = new StringBuilder();
        ReadOnlyCollection<Process> processList = Process.GetProcesos(((Company)Session["Company"]).Id);
        foreach (Process process in processList)
        {
            res.Append(string.Format(@"
                <tr>
                    <td><a href=""ProcesosView.aspx?id={0}"">{1}</a></td>
                    <td><a href=""EmployeeView.aspx?id={4}"">{2}</td>
                    <td>{3}</td>
                </tr>", process.Id, process.Description, process.JobPosition.Employee.FullName, Process.TypeToString(process.ProcessType), process.JobPosition.Employee.Id));
        }

        this.ProcesosData.Text = res.ToString();
    }
}