using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class index : System.Web.UI.Page
{
    string cn = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["email"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (!IsPostBack)
        {
            // Set the current date to be displayed first
            txtDate.VisibleDate = DateTime.Today;
        }
        if(!IsPostBack)
        {
            ddlSpecialty.Items.Add("Select the Speciality");
            ddlSpecialty.Items.Add("General Medicine");
            ddlSpecialty.Items.Add("Eye Care");
            ddlSpecialty.Items.Add("Dental Care");
        }

        SqlDataAdapter da = new SqlDataAdapter("select top 4 * from doctors", cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptDoctors.DataSource = dt;
        rptDoctors.DataBind();
    }
    protected void submit_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("INSERT INTO appoiment values('" + pname.Text + "','" + pemail.Text + "','" + pdate.Text + "','" + pphone.Text + "','" + paddress.Text + "','" + pgender.SelectedItem.ToString() + "','" + ddlSpecialty.SelectedItem.ToString() + "','" + trem.SelectedItem.ToString() + "','" + ddlDoctor.SelectedItem.ToString() + "','" + txtDate.SelectedDate + "' , 'pending')", cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count >= 0) {
            Response.Write("<script>alert('appoiment booked')</script>");
        }
        ClearForm();
    }
    protected void ClearForm() {
        pname.Text = string.Empty;
        pemail.Text = string.Empty;
        pdate.Text = string.Empty;
        pphone.Text = string.Empty;
        paddress.Text = string.Empty;
        //txtDate.SelectedDate = ;

        pgender.SelectedIndex = 0;
        ddlDoctor.SelectedIndex = 0;
        ddlSpecialty.SelectedIndex = 0;
        trem.SelectedIndex = 0;
    }
    protected void ddlSpecialty_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSpecialty.SelectedItem.ToString() == "General Medicine")
        {
            
            //Add doctors
          
            SqlDataAdapter da = new SqlDataAdapter("select docName , docDegree , id from doctors where docDegree= 'MBBS'", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            
            ddlDoctor.DataSource = dt;
            ddlDoctor.DataTextField = "docName";
            ddlDoctor.DataValueField = "id";
            ddlDoctor.DataBind();
           

        }
        if (ddlSpecialty.SelectedItem.ToString() == "Eye Care")
        {
            SqlDataAdapter da = new SqlDataAdapter("select docName , docDegree , id  from doctors where docDegree= 'OD'", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlDoctor.Items.Add("Select doctor");
            ddlDoctor.DataSource = dt;
            ddlDoctor.DataTextField = "docName";
            ddlDoctor.DataValueField = "id";
            ddlDoctor.DataBind();
        }
        if (ddlSpecialty.SelectedItem.ToString() == "Dental Care")
        {
            
            SqlDataAdapter da = new SqlDataAdapter("select docName , docDegree , id  from doctors where docDegree= 'BDS'", cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlDoctor.DataSource = dt;
            ddlDoctor.DataTextField = "docName";
            ddlDoctor.DataValueField = "id";
            ddlDoctor.DataBind();
        }
    }

    protected void txtDate_DayRender(object sender, DayRenderEventArgs e)
    {
        DateTime currentDay = e.Day.Date;

        // Limit the visible days to today and the next 7 days (8 total days)
        if (currentDay < DateTime.Today || currentDay > DateTime.Today.AddDays(7))
        {
            // Disable days that are outside of the range
            e.Day.IsSelectable = false;
        }
        if (currentDay >= DateTime.Today && currentDay <= DateTime.Today.AddDays(7))
        {
            e.Cell.BackColor = System.Drawing.Color.DodgerBlue; // Highlight selected 7 days
        }
    }
}