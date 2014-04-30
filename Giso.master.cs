using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Text;
using System.Web.UI;
using GisoFramework;
using GisoFramework.Item;
using GisoFramework.UserInterface;

public partial class Giso : MasterPage
{
    private Company company;
    private ApplicationUser user;
    private string titulo;
    private Dictionary<string, string> dictionary;
    private bool titleInvariant;

    private Collection<BreadCrumItem> breadCrumb;

    public Collection<BreadCrumItem> BreadCrumb
    {
        get
        {
            return this.breadCrumb;
        }
    }

    public bool TitleInvariant
    {
        get
        {
            return this.titleInvariant;
        }

        set
        {
            this.titleInvariant = value;
        }
    }

    public string CompanyName
    {
        get
        {
            return this.company.Name;
        }
    }

    public void AddBreadCrumb(string label)
    {
        if (this.breadCrumb == null)
        {
            this.breadCrumb = new Collection<BreadCrumItem>();
        }

        BreadCrumItem newBreadCrumb = new BreadCrumItem() { Link = "#", Label = label, Leaf = true };
        this.breadCrumb.Add(newBreadCrumb);
    }

    public void AddBreadCrumbInvariant(string label)
    {
        if (this.breadCrumb == null)
        {
            this.breadCrumb = new Collection<BreadCrumItem>();
        }

        BreadCrumItem newBreadCrumb = new BreadCrumItem() { Link = "#", Label = label, Leaf = true, Invariant = true };
        this.breadCrumb.Add(newBreadCrumb);
    }

    public void AddBreadCrumb(string label, bool leaf)
    {
        if (this.breadCrumb == null)
        {
            this.breadCrumb = new Collection<BreadCrumItem>();
        }

        BreadCrumItem newBreadCrumb = new BreadCrumItem() { Link = "#", Label = label, Leaf = leaf };
        this.breadCrumb.Add(newBreadCrumb);
    }

    public void AddBreadCrumb(string label, string link, bool leaf)
    {
        if (this.breadCrumb == null)
        {
            this.breadCrumb = new Collection<BreadCrumItem>();
        }

        BreadCrumItem newBreadCrumb = new BreadCrumItem() { Link = link, Label = label, Leaf = leaf };
        this.breadCrumb.Add(newBreadCrumb);
    }

    public string RenderBreadCrumb
    {
        get
        {
            StringBuilder res = new StringBuilder("<li><i class=\"icon-home home-icon\"></i><a href=\"/DashBoard.aspx\">").Append(this.dictionary["Inicio"]).Append("</a></li>");


            foreach (BreadCrumItem item in this.breadCrumb)
            {
                string label = item.Invariant ? item.Label : this.dictionary[item.Label];
                if (item.Leaf)
                {
                    res.Append("<li class \"active\">").Append(label).Append("</li>");
                }
                else
                {
                    string link = "#";
                    if (!string.IsNullOrEmpty(item.Link))
                    {
                        link = item.Link;
                    }

                    res.Append("<li><a href=\"").Append(link).Append("\" title=\"").Append(label).Append("\">").Append(this.dictionary[item.Label]).Append("</a></li>");
                }
            }

            return res.ToString();
        }
    }

    public string UserName
    {
        get
        {
            return this.user.Employee.FullName;
        }
    }

    public string UserId
    {
        get
        {
            return this.user.Id.ToString(CultureInfo.InvariantCulture);
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

    public string UserLanguage { get { return this.user.Language; } }

    public string User
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

    public Company Company { get { return this.company; } }

    public string Titulo
    {
        get
        {
            if (this.titleInvariant)
            {
                return this.titulo;
            }

            return this.dictionary[this.titulo];
        }

        set
        {
            this.titulo = value;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            this.Response.Redirect("Default.aspx");
        }

        this.user = new ApplicationUser(Convert.ToInt32(Session["UserId"]));
        this.company = new Company(Convert.ToInt32(Session["CompanyId"]));
        this.dictionary = Session["Dictionary"] as Dictionary<string, string>;
        this.LeftMenu.Text = new LeftMenu(this.user, this.dictionary).Render();
        this.RenderShortCuts();
    }

    private void RenderShortCuts()
    {
        StringBuilder res = new StringBuilder(@"<div class=""sidebar-shortcuts"" id=""sidebar-shortcuts"">");        
        StringBuilder big = new StringBuilder(@"<div class=""sidebar-shortcuts-large"" id=""sidebar-shortcuts-large"">");
        StringBuilder small = new StringBuilder(@"<div class=""sidebar-shortcuts-mini"" id=""sidebar-shortcuts-mini"">");

        bool showShortCuts = false;

        if (!string.IsNullOrEmpty(this.user.MenuShortcuts.Blue.Label))
        {
            showShortCuts = true;
            big.Append(string.Format(@"
                            <button class=""btn btn-info"" style=""height:32px;"" onclick=""document.location='{0}';"" title=""{1}"">
								<i class=""{2}""></i>
							</button>", this.user.MenuShortcuts.Blue.Link, this.Dictionary[this.user.MenuShortcuts.Blue.Label], this.user.MenuShortcuts.Blue.Icon));
            small.Append(@"<span class=""btn btn-info""></span>");
        }

        if (!string.IsNullOrEmpty(this.user.MenuShortcuts.Green.Label))
        {
            showShortCuts = true;
            big.Append(string.Format(@"
                            <button class=""btn btn-success"" style=""height:32px;"" onclick=""document.location='{0}';"" title=""{1}"">
								<i class=""{2}""></i>
							</button>", this.user.MenuShortcuts.Green.Link, this.Dictionary[this.user.MenuShortcuts.Green.Label], this.user.MenuShortcuts.Green.Icon));
            small.Append(@"<span class=""btn btn-info""></span>");
        }

        if (!string.IsNullOrEmpty(this.user.MenuShortcuts.Red.Label))
        {
            showShortCuts = true;
            big.Append(string.Format(@"
                            <button class=""btn btn-danger"" style=""height:32px;"" onclick=""document.location='{0}';"" title=""{1}"">
								<i class=""{2}""></i>
							</button>", this.user.MenuShortcuts.Red.Link, this.Dictionary[this.user.MenuShortcuts.Red.Label], this.user.MenuShortcuts.Red.Icon));
            small.Append(@"<span class=""btn btn-info""></span>");
        }

        if (!string.IsNullOrEmpty(this.user.MenuShortcuts.Yellow.Label))
        {
            showShortCuts = true;
            big.Append(string.Format(@"
                            <button class=""btn btn-warning"" style=""height:32px;"" onclick=""document.location='{0}';"" title=""{1}"">
								<i class=""{2}""></i>
							</button>", this.user.MenuShortcuts.Yellow.Link, this.Dictionary[this.user.MenuShortcuts.Yellow.Label], this.user.MenuShortcuts.Yellow.Icon));
            small.Append(@"<span class=""btn btn-info""></span>");
        }


        big.Append("</div>");
        small.Append("</div>");

        res.Append(big).Append(small);
        res.Append(@"</div>");

        if (showShortCuts)
        {
            this.LtMenuShortCuts.Text = res.ToString();
        }
        else
        {
            this.LtMenuShortCuts.Text = string.Empty;
        }
    }
}
