using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class register : System.Web.UI.Page
{
    string cn = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("INSERT INTO adminReg values('" + txtUserName.Text + "', '" + txtRegEmail.Text + "','" + txtRegPassword.Text + "')", cn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count >= 0)
        {
            Session["Adminemail"] = txtRegEmail.Text;
            Response.Redirect("index.aspx");
        }
    }
}