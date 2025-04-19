using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Doctor : System.Web.UI.Page
{
    string cn = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        select();
    }
    protected void select()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from doctors", cn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        AllDoctors.DataSource = dt;
        AllDoctors.DataBind();
    }
}