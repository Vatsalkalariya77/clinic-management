using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class home : System.Web.UI.MasterPage
{
    string cn = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] != null)
        {
            Button1.Visible = true;
            lnkLogin.Visible = false;

        }
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Abandon(); // This abandons the current session
        Session.Clear();
        Button1.Visible = false;
        lnkLogin.Visible = true;
        // Redirect to the login page after logging out
        //Response.Redirect("login.aspx");
    }
}
