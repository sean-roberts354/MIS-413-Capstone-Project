using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_studentInfo : System.Web.UI.Page
{
   
        PersonInfo person = new PersonInfo();
        protected void Page_Load(object sender, EventArgs e)
        {
            //block users who are not admins
            //retrieve the session vaiable set on the login page
            //yes you could have used the cookie also, demonstrating additional features
            person = (PersonInfo)Session["person"];
            if (person.RoleID != 3)
            {
                Response.Redirect("~/user/menu.aspx");
            }
        }
    

    protected void _RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        this._message.Text = "Person Role was Updated";
    }

    protected void _RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        this._message.Text = "Person Role was Deleted";
    }

    protected void _addNew_Click(object sender, EventArgs e)
    {
        this._addNew.Visible = false;
        this._pnlAddNew.Visible = true;
        this._studentInfo.Visible = false;
        this._message.Text = "";
        this._personID.SelectedValue = "0";
        this._majorID.SelectedValue = "0";
    }

    protected void _clear_Click(object sender, EventArgs e)
    {
        this._addNew.Visible = true;
        this._pnlAddNew.Visible = false;
        this._studentInfo.Visible = true;
    }

    protected void _submit_Click(object sender, EventArgs e)
    {
        // First check the page passed the error checking
        if (Page.IsValid)
        {
            // This will insert a new record into the database
            // Build a link to the name/pwd/user for your particular database
            // Note below the [mis413...] should be the name of your connection string,
            // Open your webconfig file and find the connection string name

            string dbConn = System.Configuration.ConfigurationManager.ConnectionStrings["S18CDSpeakCDSConnectionString"].ConnectionString;

            // Build a connection to the database
            SqlConnection conn = new SqlConnection(dbConn);

            // Use the above connection to execute a particular stored procedure

            using (SqlCommand cmd = new SqlCommand("[studentInfoInsert]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                // Build the parameters (input items) that the stored procedures needs
                cmd.Parameters.AddWithValue("@personID", this._personID.Text);
                cmd.Parameters.AddWithValue("@majorID", this._majorID.Text);

                // Open the database and actually run the stored procedure, also catch any errors and display them in your _message label, also refreshed grid to show new record
                try
                {
                    conn.Open();
                    int intResponse = Convert.ToInt16(cmd.ExecuteScalar());

                    if (intResponse == 0)
                    {
                        this._message.Text = "Student Info already existed - Not Added";
                    }
                    else
                    {
                        this._message.Text = "Student Info was Added";
                    }

                    // Following line refreshes your grid for the new record
                    this._studentInfo.DataBind();
                }

                // If there are any errors with the store procedure, display them in the message label
                catch (SqlException ex)
                {
                    this._message.Text = "Error on inserting into the studentInfo Table " + ex.Message;
                }
            }
        }



        this._addNew.Visible = true;
        this._pnlAddNew.Visible = false;
        this._studentInfo.Visible = true;


    }

}