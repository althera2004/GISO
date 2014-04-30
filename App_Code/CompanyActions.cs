using System.Collections.ObjectModel;
using System.Text;
using System.Web.Script.Services;
using System.Web.Services;
using GisoFramework.Activity;
using GisoFramework.Item;

/// <summary>
/// Summary description for CompanyActions
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[ScriptService]
public class CompanyActions : WebService
{

    public CompanyActions()
    {
    }

    [WebMethod]
    [ScriptMethod]
    public Company GetById(int companyId)
    {
        return new Company(companyId);
    }

    [WebMethod]
    [ScriptMethod]
    public string GetDepartments(int companyId)
    {
        ReadOnlyCollection<Department> departments = new Company(companyId).Departments;
        bool first = true;
        StringBuilder res = new StringBuilder("[");

        foreach (Department department in departments)
        {
            if (first)
            {
                first = false;
            }
            else
            {
                res.Append(",");
            }

            res.Append(department.Json);
        }

        res.Append("]");
        return res.ToString();
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod]
    public ActionResult Save(int id, string name, string nif, int address, int userId)
    {
        return Company.Update(id, name, nif, address, userId);
    }
}
