using System.Text;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// Summary description for DeparmentActions
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[ScriptService]
public class DeparmentActions : System.Web.Services.WebService {

    public DeparmentActions () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod]
    [ScriptMethod]
    public string DeparmentData(int companyId, int deparmentId)
    {
        StringBuilder res = new StringBuilder("[");        
        res.Append("]");
        return res.ToString();
    }    
}
