using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using GisoFramework.Item;

public partial class CompanyProfile : Page
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

    public Company Company
    {
        get
        {
            return this.master.Company;
        }
    }

    public CompanyAddress CompanyDefaultAddress
    {
        get
        {
            return this.master.Company.DefaultAddress;
        }
    }

    public string Addresses
    {
        get
        {
            StringBuilder res = new StringBuilder("[");
            bool first = true;
            foreach (CompanyAddress address in this.master.Company.Addresses)
            {
                if (first)
                {
                    first = false;
                }
                else
                {
                    res.Append(",");
                }

                res.Append(address.Json).Append(Environment.NewLine);
            }

            return res.Append("]").ToString();
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
        this.master.AddBreadCrumb("Compañía");
        this.master.AddBreadCrumb("Datos de la compañía");
        this.master.Titulo = "Datos de la compañía";
        this.RenderAddressOptions();
    }

    private void RenderAddressOptions()
    {
        StringBuilder res = new StringBuilder("<option value\"\">&nbsp;</option>").Append(Environment.NewLine);
        Company company = new Company(Convert.ToInt32(Session["CompanyId"]));
        foreach (CompanyAddress address in company.Addresses)
        {
            res.Append(address.SelectOption);
        }

        this.LtAddressOptions.Text = res.ToString();
    }
}