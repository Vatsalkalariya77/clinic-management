using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class admin_adminHome : System.Web.UI.MasterPage
{
    string cn = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack) {
            SqlDataAdapter da = new SqlDataAdapter("select * from doctors", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            avldoctor.Text = dt.Rows.Count.ToString();
        }

      if(!IsPostBack){
            SqlDataAdapter da = new SqlDataAdapter("select * from appoiment", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            totappo.Text = dt.Rows.Count.ToString();
            totpatient.Text = dt.Rows.Count.ToString();
        }
      if (!IsPostBack)
      {
          SqlDataAdapter da = new SqlDataAdapter("select status from appoiment where status='pending'", cn);
          DataTable dt = new DataTable();
          da.Fill(dt);
          penrepo.Text = dt.Rows.Count.ToString();
      }
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Abandon(); // This abandons the current session


        // Redirect to the login page after logging out
        Response.Redirect("login.aspx");
    }
}
