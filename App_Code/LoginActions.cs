using System.Web.Script.Services;
using System.Web.Services;
using GisoFramework;

/// <summary>
/// Summary description for LoginActions
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[ScriptService]
public class LoginActions : WebService {

    public LoginActions () {
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod]
    public LogOnObject GetLogin(string userName, string password,string company, string ip)
    {
        return ApplicationLogOn.GetLogin(userName, password, company, ip);
    }
}
