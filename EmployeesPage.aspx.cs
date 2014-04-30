using System;
using System.Text;
using System.Web.UI;
using GisoFramework;
using GisoFramework.Item;

public partial class EmployessPage : Page
{
    private Company company;
    private ApplicationUser user;

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

    /// <summary>
    /// Page's load event
    /// </summary>
    /// <param name="sender">Loaded page</param>
    /// <param name="e">Event's arguments</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            this.Response.Redirect("Index.aspx");
        }

        this.user = (ApplicationUser)Session["User"];
        this.company = new Company(Convert.ToInt32(Session["CompanyId"]));
        this.RenderEmployeesList();
    }

    private void RenderEmployeesList()
    {
        StringBuilder res = new StringBuilder("<ul>");

        string letter = string.Empty;

        foreach (Employee employee in this.company.Employees)
        {
            if (employee.LastName.Substring(0, 1) != letter)
            {
                if (!string.IsNullOrEmpty(letter))
                {
                    res.Append("</ul></li>");
                }
                letter = employee.LastName.Substring(0, 1);
                res.Append("<li id=\"").Append(letter.ToLowerInvariant()).Append("\"><a name=\"a\" class=\"title\">").Append(letter.ToUpperInvariant()).Append("</a><ul>").Append(Environment.NewLine);
            }

            string name = employee.LastName;
            if(!string.IsNullOrEmpty(employee.SecondLastName))
            {
                name+=" " + employee.SecondLastName;
            }
            name+=", " + employee.Name;

            string departments = string.Empty;
            bool first = true;
            foreach(Department deparment in employee.Departments)
            {
                if(first)
                {
                    first = false;
                }
                else
                {
                    departments += ", ";
                }

                departments += deparment.Name;
            }

            string user = string.Empty;
            if (employee.User != null)
            {
                if (employee.User.Id > 0)
                {
                    user = string.Format(@"<span class=""small"">User:&quot;<strong>{0}</strong>&quot; - Status: {1} - Language: {2}</span>", employee.User.Login, employee.User.Status, employee.User.Language);
                }
            }

            res.Append(String.Format(@"
                                <li title=""{0}"">
                                    <a href=""#"">
                                        <span class=""thumbnail""><img src=""images/face/face1.png""></span> {0}
                                        <span class=""small"">{1}</span>
                                        {2}
                                    </a>
                                </li>", name, departments, user)).Append(Environment.NewLine);
        }

        res.Append("</ul></li></ul>");
        this.EmployeesList.Text = res.ToString();
    }
}