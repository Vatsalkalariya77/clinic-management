    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Data;
    using System.Data.SqlClient;
using System.Configuration;

    public partial class admin_appoiment : System.Web.UI.Page
    {
        string cn = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Adminemail"] == null)
            {
                Response.Redirect("login.aspx");
            }


            select();



            if (!IsPostBack)
            {
                // Set the current date to be displayed first
                AppoimentDates.VisibleDate = DateTime.Today;
            }

            if (Request.QueryString["res"]!= null)
            {
                DateTime tomorrow = DateTime.Today.AddDays(1);
                string query = "UPDATE appoiment set appo_date = @tomorrow where id=" + Request.QueryString["res"];

            // Create the SqlDataAdapter with the query
            SqlDataAdapter da = new SqlDataAdapter(query, cn);

            // Add the @today parameter to the SqlDataAdapter's SelectCommand
            da.SelectCommand.Parameters.AddWithValue("@tomorrow", tomorrow);

            // Create a DataTable to hold the fetched data
            DataTable dt = new DataTable();

            // Fill the DataTable with data from the database
            da.Fill(dt);

            }
            if (Request.QueryString["com"] != null)
            {
                SqlDataAdapter da = new SqlDataAdapter("UPDATE appoiment set status='complete' where id= "+Request.QueryString["com"],cn);
                DataTable dt = new DataTable();
                da.Fill(dt);

            }

            
        }

        protected void select()
        {
            // Get today's date (without the time part)
            DateTime today = DateTime.Today;

            // Create the SQL query using the parameter @today
            string query = "SELECT * FROM appoiment WHERE CAST(appo_date AS DATE)= @today and status='pending'";

            // Create the SqlDataAdapter with the query
            SqlDataAdapter da = new SqlDataAdapter(query, cn);
            // Add the @selectedDate parameter to the SqlDataAdapter's SelectCommand
            da.SelectCommand.Parameters.AddWithValue("@today", today);

            // Create a DataTable to hold the fetched data
            DataTable dt = new DataTable();

            // Fill the DataTable with data from the database
            da.Fill(dt);

            // Bind the data to the GridView or other data control
            appoiments.DataSource = dt;
            appoiments.DataBind();
        }

        protected void selectedDate(DateTime selectedDate)
        {
            // Create the SQL query to fetch appointments for the selected date
            string query = "SELECT * FROM appoiment WHERE CAST(appo_date AS DATE) = @selectedDate and status='pending'";

            // Create the SqlDataAdapter with the parameterized query
            SqlDataAdapter da = new SqlDataAdapter(query, cn);

            // Add the @selectedDate parameter to the SqlDataAdapter's SelectCommand
            da.SelectCommand.Parameters.AddWithValue("@selectedDate", selectedDate);

            // Create a DataTable to hold the fetched data
            DataTable dt = new DataTable();

            // Fill the DataTable with data from the database
            da.Fill(dt);

            // Bind the data to the GridView
            appoiments.DataSource = dt;
            appoiments.DataBind();
        }

        protected void AppoimentDates_DayRender(object sender, DayRenderEventArgs e)
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
        protected void AppoimentDates_SelectionChanged(object sender, EventArgs e)
        {
            // Get the selected date from the Calendar control
            DateTime selectDate = AppoimentDates.SelectedDate;

            // Fetch appointments for the selected date
            selectedDate(selectDate);
        }
    }