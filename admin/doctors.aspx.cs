using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class doctors : System.Web.UI.Page
{
    string cn = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Adminemail"] == null)
        {
            Response.Redirect("login.aspx");
        }
        select();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        String path;
        if (fuDoctorImage.HasFile)
        {
            Directory.CreateDirectory(Server.MapPath("Doctors"));
            path = "~/admin/Doctors/"+fuDoctorImage.FileName;
            fuDoctorImage.SaveAs(Server.MapPath(path));

            SqlDataAdapter da = new SqlDataAdapter("insert into doctors values('"+txtName.Text+"','"+txtDegree.Text+"','"+txtExperience.Text+"','"+txtDescription.Text+"','"+ddlAvailability.SelectedItem.ToString()+"','"+path+"','"+txtpass.Text+"')",cn);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ClearForm();
        }
    }
    protected void ClearForm() {
        txtName.Text = string.Empty;
        txtpass.Text = string.Empty;
        txtExperience.Text = string.Empty;
        txtDegree.Text = string.Empty;
        txtDescription.Text = string.Empty;
        ddlAvailability.SelectedIndex = 0;
        
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ClearForm();
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