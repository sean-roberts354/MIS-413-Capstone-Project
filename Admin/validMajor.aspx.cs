using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_validMajor : System.Web.UI.Page
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
    

    protected void _majors_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        this._message.Text = "Major was Updated";
    }

    protected void _majors_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        this._message.Text = "Major was Deleted";
    }

    protected void _addNew_Click(object sender, EventArgs e)
    {
        this._addNew.Visible = false;
        this._pnlAddNew.Visible = true;
        this._majors.Visible = false;
        this._message.Text = "";
        this._majorName.Text = "";
    }

    protected void _clear_Click(object sender, EventArgs e)
    {
        this._addNew.Visible = true;
        this._pnlAddNew.Visible = false;
        this._majors.Visible = true;
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

            using (SqlCommand cmd = new SqlCommand("[validMajorInsert]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                // Build the parameters (input items) that the stored procedures needs
                cmd.Parameters.AddWithValue("@majorName", this._majorName.Text);

                // Open the database and actually run the stored procedure, also catch any errors and display them in your _message label, also refreshed grid to show new record
                try
                {
                    conn.Open();
                    int intResponse = Convert.ToInt16(cmd.ExecuteScalar());

                    if (intResponse == 0)
                    {
                        this._message.Text = "Major already existed - Not Added";
                    }
                    else
                    {
                        this._message.Text = "New Major was Added";
                    }

                    // Following line refreshes your grid for the new record
                    this._majors.DataBind();
                }

                // If there are any errors with the store procedure, display them in the message label
                catch (SqlException ex)
                {
                    this._message.Text = "Error on inserting into the validMajor Table " + ex.Message;
                }
            }
        }

        this._majorName.Text = "";

        this._addNew.Visible = true;
        this._pnlAddNew.Visible = false;
        this._majors.Visible = true;


    }
}