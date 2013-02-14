<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;

public class Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        String json = "{ \"result\": \"OK\" }";
        String callback = context.Request.Params["callback"];
        if (!String.IsNullOrEmpty(callback))
        {
            json = String.Format("{0}({1});", callback, json);
        }

        context.Response.ContentType = "text/javascript";
        
        // Uncomment for nasty surprise!
        // json += "alert('Youve been hacked');";

        context.Response.Write(json);
    }

    public bool IsReusable {
        get {
            return true;
        }
    }
}
