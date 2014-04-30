using System;
using System.Collections.Generic;
using System.Globalization;
using System.Web.Script.Services;
using System.Web.Services;
using GisoFramework.Activity;
using GisoFramework.Item;

/// <summary>
/// Summary description for DocumentActions
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[ScriptService]
public class DocumentActions : WebService {

    public DocumentActions () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod]
    public ActionResult Versioned(int documentId, int userId, int companyId, string version)
    {
        int versionNumber = Convert.ToInt32(version.Split(':')[1]);
        versionNumber++;

        ActionResult res = Document.Versioned(documentId, userId, companyId, versionNumber);
        if(res.Success)
        {
            res = ActivityLog.DocumentVersioned(documentId, userId, companyId, versionNumber);
            res.MessageError = versionNumber.ToString(CultureInfo.InvariantCulture);
        }

        return res;
    }

    [WebMethod(EnableSession = true)]
    [ScriptMethod]
    public ActionResult Update(int documentId, int userId, int companyId, Document document, string categoryId, string procedenciaId, string categoryName, string procedenciaName)
    {
        string extraData=string.Empty;
        Document newDocument = Document.GetById(documentId, companyId);

        if (newDocument.Code != document.Code)
        {
            extraData += "Codigo:" + document.Code + ";";
            newDocument.Code = document.Code;
        }

        if (newDocument.Description != document.Description)
        {
            extraData += "Nombre:" + document.Description + ";";
            newDocument.Description = document.Description;
        }

        if (newDocument.Location != document.Location)
        {
            extraData += "Ubicacion:" + document.Location + ";";
            newDocument.Location = document.Location;
        }

        if (newDocument.Conservation != document.Conservation)
        {
            extraData += "Conservacion:" + document.Conservation.ToString(CultureInfo.InvariantCulture) + ";";
            newDocument.Conservation = document.Conservation;
        }

        if (newDocument.FechaBaja.HasValue && document.FechaBaja.HasValue)
        {
            if (newDocument.FechaBaja.Value != document.FechaBaja.Value)
            {
                newDocument.FechaBaja = document.FechaBaja;
                extraData += "Baja:" + document.FechaBaja.Value.ToShortDateString();
            }
        }
        else
        {
            if (!newDocument.FechaBaja.HasValue && document.FechaBaja.HasValue)
            {
                newDocument.FechaBaja = document.FechaBaja;
                extraData += "Baja:" + document.FechaBaja.Value.ToShortDateString();
            }
        }

        if (newDocument.Category.Value != Convert.ToInt32(categoryId))
        {
            newDocument.Category = new KeyValuePair<string, int>(string.Empty, Convert.ToInt32(categoryId));
            extraData += "Categoría:" + categoryName;
        }

        if (newDocument.Origin.Value != Convert.ToInt32(procedenciaId))
        {
            newDocument.Origin = new KeyValuePair<string, int>(string.Empty, Convert.ToInt32(procedenciaId));
            extraData += "Procedencia:" + procedenciaName;
        }

        ActionResult res = newDocument.Update(userId);
        if (res.Success)
        {
            res = ActivityLog.Document(documentId, userId, companyId, (int)ActivityTrace.Document.Update, extraData);
        }

        return res;
    }
    
}
