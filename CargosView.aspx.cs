using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;
using GisoFramework.Item;

public partial class CargosView : Page
{
    private Giso master;
    private int cargoId;
    private JobPosition cargo;
    private Company company;
    private Dictionary<string, string> dictionary;
    private string departments;
    private string employeeDepartmentMemberShip;
    public string EmployeeDepartmentMemberShip { get { return this.employeeDepartmentMemberShip; } }
    public JobPosition Cargo { get { return this.cargo; } }
    public string Deparments
    {
        get
        {
            return this.departments;
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

        if (this.Request.QueryString["id"] != null)
        {
            this.cargoId = Convert.ToInt32(this.Request.QueryString["id"].ToString());
        }

        this.company = (Company)Session["company"];
        this.dictionary = Session["Dictionary"] as Dictionary<string, string>;

        if (cargoId > 0)
        {
            this.cargo = new JobPosition(this.cargoId, this.company.Id);
            this.LtModificado.Text = string.Format("<strong>{0}</strong><br />{1}", this.cargo.ModifiedBy.FullName, this.cargo.ModifiedOn);
        }
        else
        {
            this.cargo = JobPosition.Empty;
            this.LtModificado.Text = string.Format("<i>({0})</i>", this.dictionary["Nuevo"]);
        }

        string label = this.cargoId == -1 ? "Nuevo cargo" : "Editar cargo";
        this.master = this.Master as Giso;
        string serverPath = this.Request.Url.AbsoluteUri.Replace(this.Request.RawUrl.Substring(1), string.Empty);
        this.master.AddBreadCrumb("Cargos", "CargosList.aspx", false);
        this.master.AddBreadCrumb(label);
        this.master.Titulo = label;

        if (!IsPostBack)
        {
            this.RenderEmployees();
            this.RenderDepartamentos();
            this.GetEmployeeDepartmentMemberShip();
        }
    }

    private void RenderDepartamentos()
    {
        StringBuilder res = new StringBuilder();
        StringBuilder json = new StringBuilder("[");
        bool first = true;
        foreach (Department department in this.company.Departments)
        {
            if (first)
            {
                first = false;
            }
            else
            {
                json.Append(",");
            }

            res.Append(string.Format("<tr><td class=\"department\" id=\"Dep-{1}\">{0}</td></tr>", department.Name, department.Id));
            json.Append(string.Format(@"{{""Id"":{0},""Name"":""{1}""}}", department.Id, department.Name));
        }

        json.Append("]");
        this.LtDepartamentosTable.Text = res.ToString();
        this.departments = json.ToString();
    }

    private void RenderEmployees()
    {
        StringBuilder res = new StringBuilder("<option></option>");
        foreach (Employee employee in this.company.Employees)
        {
            res.Append("<option value=\"").Append(employee.Id).Append("\">").Append(employee.FullName).Append("</option>");
        }

        this.LtEmpleados.Text = res.ToString();
    }

    

    private void GetEmployeeDepartmentMemberShip()
    {
        StringBuilder json = new StringBuilder("[");
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cns"].ConnectionString);
        SqlCommand cmd = new SqlCommand("Get_EmployeeDepartmentAsignation", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@CompanyId", SqlDbType.Int);
        cmd.Parameters["@CompanyId"].Value = this.company.Id;

        try
        {
            bool first = true;
            cnn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                if (first)
                {
                    first = false;
                }
                else
                {
                    json.Append(",");
                }

                json.Append(string.Format(@"{{""Employee"":{0},""Department"":{1}}}", rdr.GetInt32(0), rdr.GetInt32(1)));
            }
        }
        finally
        {
        }

        json.Append("]");
        this.employeeDepartmentMemberShip = json.ToString();
    }
}