using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    private string languageBrowser;
    private string ip;
    private string companyCode;

    public string CompanyCode { get { return this.companyCode; } }

    public string LanguageBrowser { get { return this.languageBrowser; } }
    public string Ip { get { return this.ip; } }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["company"] != null)
        {
            this.companyCode = this.Request.QueryString["company"].ToString();
            this.SpanCompany.Attributes.Add("style", "display:none !important;");
        }
        else 
        {
            this.companyCode = string.Empty;
        }

        this.languageBrowser = this.Request.UserLanguages[0];
        this.ip = this.GetUserIP();
    }

    private string GetUserIP()
    {
        string ipList = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipList))
        {
            return ipList.Split(',')[0];
        }

        return Request.ServerVariables["REMOTE_ADDR"];
    }
}