using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_patients : System.Web.UI.Page
{
    string cn = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Adminemail"] == null)
        {
            Response.Redirect("login.aspx");
        }
        select();
        if(Request.QueryString["patient"]!= null){
            Panel2.Visible = true;
            // Define SQL query with a parameter
            string query = "SELECT patient_name, medicine, date FROM complete WHERE patient_name = @patientName";

            // Create SqlDataAdapter with a parameterized query
            SqlDataAdapter da = new SqlDataAdapter(query, cn);

            // Add parameter value to prevent SQL injection
            da.SelectCommand.Parameters.AddWithValue("@patientName", Request.QueryString["patient"]);

            // Fill DataTable
            DataTable dt = new DataTable();
            da.Fill(dt);

            // Bind data to GridView
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
    protected void select()
    {
        SqlDataAdapter da = new SqlDataAdapter("select name , email , dob ,p_no , city ,gender from appoiment", cn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        patients.DataSource = dt;
        patients.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false; 
    }
}