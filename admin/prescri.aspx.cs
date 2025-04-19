using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_prescri : System.Web.UI.Page
{

    string cn = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
       if(Request.QueryString["com"]!= null){
           SqlDataAdapter da = new SqlDataAdapter("select * from appoiment  where id=" + Request.QueryString["com"], cn);
           DataTable dt = new DataTable();
           da.Fill(dt);
           lblPatient.Text = dt.Rows[0][1].ToString();
           lblDoctor.Text = dt.Rows[0][9].ToString();
           
       }
    }

    protected void btnAddMedicine_Click(object sender, EventArgs e)
    {
        string medicineEntry = txtMedicine1.Text + " - " + ddlPower1.SelectedValue;

        // Add to ListBox
        medicines.Items.Add(medicineEntry);

        // Clear input fields
        txtMedicine1.Text = string.Empty;
        ddlPower1.SelectedIndex = 0; 
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string date = DateTime.Now.ToString("yyyy-MM-dd");

        string medicineEntry = txtMedicine1.Text + " - " + ddlPower1.SelectedValue;

        // Add to ListBox
        medicines.Items.Add(medicineEntry);

        List<string> medicineList = new List<string>();
        foreach (ListItem item in medicines.Items)
        {
            medicineList.Add(item.Text);
        }

        // Step 2: Convert List to a comma-separated string
        string medicineString = string.Join(",", medicineList);
        SqlDataAdapter da = new SqlDataAdapter("INSERT INTO complete values('"+lblPatient.Text+"','"+medicineString+"','"+date+"');", cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count >= 0)
        {
            
            SqlDataAdapter DA = new SqlDataAdapter("UPDATE appoiment set status='complete' where id= " + Request.QueryString["com"], cn);
            DataTable d = new DataTable();
            DA.Fill(d);
           
        }
        Response.Write("<script>alert('Pricription Addded')</script>");
        Response.Redirect("appoiment.aspx");
    }
    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{
    //    string date = DateTime.Now.ToString("yyyy-MM-dd");
    //    string medicineEntry = txtMedicine1.Text + " - " + ddlPower1.SelectedValue;

    //    // Add to ListBox
    //    medicines.Items.Add(medicineEntry);

    //    // Convert ListBox items to a comma-separated string
    //    List<string> medicineList = new List<string>();
    //    foreach (ListItem item in medicines.Items)
    //    {
    //        medicineList.Add(item.Text);
    //    }
    //    string medicineString = string.Join(",", medicineList);

    //    // Ensure connection is open
    //    if (cn.State == ConnectionState.Closed)
    //    {
    //        cn.Open();
    //    }

    //    // Step 1: Insert prescription data into the "complete" table
    //    string insertQuery = "INSERT INTO complete (patientName, medicineDetails, prescriptionDate) VALUES (@patient, @medicines, @date)";
    //    using (SqlCommand cmd = new SqlCommand(insertQuery, cn))
    //    {
    //        cmd.Parameters.AddWithValue("@patient", lblPatient.Text);
    //        cmd.Parameters.AddWithValue("@medicines", medicineString);
    //        cmd.Parameters.AddWithValue("@date", date);
    //        cmd.ExecuteNonQuery();
    //    }

    //    // Step 2: Update the appointment status to 'complete'
    //    string updateQuery = "UPDATE appoiment SET status='complete' WHERE id=@id";
    //    using (SqlCommand cmd = new SqlCommand(updateQuery, cn))
    //    {
    //        cmd.Parameters.AddWithValue("@id", Request.QueryString["com"]);
    //        cmd.ExecuteNonQuery();
    //    }

    //    // Step 3: Show alert message and redirect
    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Prescription Printed'); window.location='appoiment.aspx';", true);
    //}

}