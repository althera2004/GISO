using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using GisoFramework;
using GisoFramework.Item;

public partial class InitSession : Page
{
    /// <summary>
    /// Page's load event
    /// </summary>
    /// <param name="sender">Loaded page</param>
    /// <param name="e">Event's arguments</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["UserId"] = this.Request.Form["UserId"];
        Session["CompanyId"] = this.Request.Form["CompanyId"];
        Session["Company"] = new Company(Convert.ToInt32(this.Request.Form["CompanyId"]));
        Session["User"] = new ApplicationUser(Convert.ToInt32(this.Request.Form["UserId"]));

        // Carga de diccionario
        Dictionary<string, string> dictionay = new Dictionary<string, string>();
        StreamReader input = new StreamReader(Request.PhysicalApplicationPath+"\\dicc\\ca.dicc");
        string linea = input.ReadLine();
        while(!string.IsNullOrEmpty(linea))
        {
            if (linea.IndexOf("::") != -1)
            {
                linea = linea.Replace("::", "^");
                string key = linea.Split('^')[0];
                string value = linea.Split('^')[1];
                if (!dictionay.ContainsKey(key))
                {
                    dictionay.Add(key, value);
                }
            }

            linea=input.ReadLine();
        }

        input.Close();
        Session["Dictionary"] = dictionay;
        //Response.Redirect("/DashBoard.aspx");

        ApplicationUser user = new ApplicationUser(Convert.ToInt32(Session["UserId"]));
        if (user.Groups.Contains(SecurityGroup.Company))
        {
            Response.Redirect("/TestMaster.aspx");
        }
        else
        {
            Response.Redirect("/Documents.aspx");
        }
    }
}