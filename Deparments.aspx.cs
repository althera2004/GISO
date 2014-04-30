﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Web.UI;
using GisoFramework.Item;

public partial class Deparments : Page
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
        this.master.AddBreadCrumb("Departamentos");
        this.master.Titulo = "Departamentos";
        this.RenderDepartmentData();
    }

    private void RenderDepartmentData()
    {
        StringBuilder res = new StringBuilder();
        foreach (Department department in ((Company)Session["Company"]).Departments)
        {
            res.Append(department.TableRow);
        }

        this.DepartmentData.Text = res.ToString();
    }
}