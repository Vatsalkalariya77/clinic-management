using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class admin_login : System.Web.UI.Page
{
    string cn = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from register where email ='"+txtEmail.Text+"' and password ='"+txtPassword.Text+"'",cn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            Session["email"] = txtEmail.Text;
            Response.Redirect("index.aspx");
        }
    }
}