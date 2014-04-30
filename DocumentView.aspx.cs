using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using GisoFramework;
using GisoFramework.Activity;
using GisoFramework.Item;

public partial class DocumentView : Page
{
    #region Fields
    private Giso master;
    private ApplicationUser user;
    private int documentId;
    private Document documento;
    private Dictionary<string, string> dictionary;
    private string categoriasJson;
    private string procedenciasJson;
    #endregion

    #region Properties
    public string CompanyId
    {
        get
        {
            return this.master.CompanyId;
        }
    }

    public string UserId
    {
        get
        {
            return this.master.UserId;
        }
    }

    public string UserName
    {
        get
        {
            return this.master.UserName;
        }
    }

    public string CategoriasJson
    {
        get
        {
            return this.categoriasJson;
        }
    }

    public string ProcedenciasJson
    {
        get
        {
            return this.procedenciasJson;
        }
    }

    public string DocumentoJson
    {
        get
        {
            if (this.documentId == -1)
            {
                return "{}";
            }

            return this.documento.Json;
        }
    }

    public int DocumentId
    {
        get
        {
            return this.documentId;
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
    #endregion

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
        else
        {
            this.user = Session["user"] as ApplicationUser;
        }

        if (this.Request.QueryString["id"] != null)
        {
            this.documentId = Convert.ToInt32(this.Request.QueryString["id"].ToString());
        }

        string label = this.documentId == -1 ? "Nuevo documento" : "Detalle del documento";
        this.dictionary = Session["Dictionary"] as Dictionary<string, string>;
        this.master = this.Master as Giso;;
        string serverPath = this.Request.Url.AbsoluteUri.Replace(this.Request.RawUrl.Substring(1), string.Empty);
        this.master.AddBreadCrumb("Documentos", "Documents.aspx", false);
        this.master.AddBreadCrumb(label);
        this.master.Titulo = label;

        if (this.documentId != -1)
        {
            this.documento = Document.GetById(this.documentId, (Company)Session["Company"]);
            this.LtUser.Text = this.documento.ModifiedBy.Employee.FullName;
            this.LtFecha.Text = string.Format("{0:dd/MM/yyyy}", this.documento.ModifiedOn);
        }
        else
        {
            this.documento = new Document();
            this.LtUser.Text = "-";
            this.LtFecha.Text = this.dictionary["Nuevo"];
        }

        this.RenderHistorico();
        this.RenderTrazas();

        if (!this.IsPostBack)
        {
            this.dictionary = Session["Dictionary"] as Dictionary<string, string>;
            this.FillCmbConservacion();
            this.FillCmbOrigen();
            this.FillCmbCategorias();
            this.FillCmbProcedencias();
        }
    }

    private void RenderHistorico()
    {
        StringBuilder res = new StringBuilder();
        foreach (DocumentVersion version in this.documento.Versions)
        {
            res.Append(version.TableRow);
        }

        this.LtHistorico.Text = res.ToString();
    }

    private void RenderTrazas()
    {
       
        StringBuilder res = new StringBuilder();
        foreach (ActivityTrace activity in ActivityLog.GetActivity(this.documentId, 4, ((Company)Session["company"]).Id, null, null))
        {
            res.Append(activity.TableTargetedRow);
        }

        this.LtTrazas.Text = res.ToString();
    }

    private void FillCmbConservacion()
    {
        this.LtConservacion.Text = string.Format(@"
                <option value=""0""></option>
                <option value=""1"" {3}>{0}</option>
                <option value=""2"" {4}>{1}</option>
                <option value=""3"" {5}>{2}</option>
            ", this.dictionary["Años"], this.dictionary["Meses"], this.dictionary["Días"], this.documento.ConservationType == 1 ? "selected=\"selected\"" : string.Empty, this.documento.ConservationType == 2 ? "selected=\"selected\"" : string.Empty, this.documento.ConservationType == 3 ? "selected=\"selected\"" : string.Empty);
    }

    private void FillCmbOrigen()
    {
        if (this.documento.Source)
        {
            this.LtOrigen.Text = @"
                <option value=""0"" selected=""selected"">" + this.dictionary["Interno"] + @"</option>
                <option value=""1"">" + this.dictionary["Externo"] + @"</option>
                ";
        }
        else
        {
            this.LtOrigen.Text = @"
                <option value=""0"">" + this.dictionary["Interno"] + @"</option>
                <option value=""1"" selected=""selected"">" + this.dictionary["Externo"] + @"</option>
                ";
        }
    }

    private void FillCmbCategorias()
    {
        StringBuilder res = new StringBuilder();
        StringBuilder resTable = new StringBuilder();
        StringBuilder json = new StringBuilder();
        bool first = true;
        foreach (KeyValuePair<string, int> categoria in ((Company)Session["Company"]).Categories)
        {
            string isChecked = string.Empty;
            if (categoria.Value == documento.Category.Value)
            {
                isChecked = " selected=\"selected\"";
            }

            res.Append("<option value=\"").Append(categoria.Value).Append("\"").Append(isChecked).Append(">").Append(categoria.Key).Append("</option>");
            resTable.Append("<tr><td class=\"categoria\" id=\"Categoria-").Append(categoria.Value).Append("\">");
            if (!string.IsNullOrEmpty(isChecked))
            {
                resTable.Append("<strong>");
            }

            resTable.Append(categoria.Key);
            if (!string.IsNullOrEmpty(isChecked))
            {
                resTable.Append("</strong>");
            }

            resTable.Append("</td></tr>");
            if (first)
            {
                first = false;
            }
            else
            {
                json.Append(",");
            }

            json.Append("{key:'").Append(categoria.Key.Replace('\'', '´')).Append("', value:").Append(categoria.Value).Append("}");
        }

        this.LtCategoriasTable.Text = resTable.ToString();
        this.LtCategorias.Text = res.ToString();
        this.categoriasJson = json.ToString();
    }

    private void FillCmbProcedencias()
    {
        StringBuilder res = new StringBuilder();
        StringBuilder resTable = new StringBuilder();
        StringBuilder json = new StringBuilder();
        bool first = true;
        foreach (KeyValuePair<string, int> procedencia in ((Company)Session["Company"]).Origins)
        {
            string isChecked = string.Empty;
            if (procedencia.Value == documento.Origin.Value)
            {
                isChecked = " selected=\"selected\"";
            }

            res.Append("<option value=\"").Append(procedencia.Value).Append("\"").Append(isChecked).Append(">").Append(procedencia.Key).Append("</option>");
            resTable.Append("<tr><td class=\"procedencia\" id=\"Procedencia-").Append(procedencia.Value).Append("\">");
            if (!string.IsNullOrEmpty(isChecked))
            {
                resTable.Append("<strong>");
            }

            resTable.Append(procedencia.Key);
            if (!string.IsNullOrEmpty(isChecked))
            {
                resTable.Append("</strong>");
            }
            resTable.Append("</td></tr>");

            if (first)
            {
                first = false;
            }
            else
            {
                json.Append(",");
            }

            json.Append("{key:'").Append(procedencia.Key.Replace('\'','´')).Append("', value:").Append(procedencia.Value).Append("}");
        }

        this.LtProcedenciasTable.Text = resTable.ToString();
        this.LtProcedencias.Text = res.ToString();
        this.procedenciasJson = json.ToString();
    }
}