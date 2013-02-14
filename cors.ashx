<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;

public class Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {

        String origin = context.Request.Headers["Origin"];
        String result = "OK";
        if (!String.IsNullOrEmpty(origin))
        {
            result += " - Origin:" + origin;
        }
        
        // Very basic JSON escaping (to avoid needing an assembly import)
        String escapedResult = result.Replace("\\", "\\\\").Replace("\"", "\\\"");
        String json = "{\"result\":\"" + escapedResult + "\"}";
        
        context.Response.AddHeader("Access-Control-Allow-Origin", "*");
        context.Response.ContentType = "application/json";
        context.Response.Write(json);
    }

    public bool IsReusable {
        get {
            return true;
        }
    }
}
