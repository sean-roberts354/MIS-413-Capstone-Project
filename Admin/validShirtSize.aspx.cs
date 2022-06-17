using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_validShirtSize : System.Web.UI.Page
{

    PersonInfo person = new PersonInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        // Block users who are not admins using session variable
        person = (PersonInfo)Session["person"];
        if (person.RoleID != 3)
        {
            Response.Redirect("~/user/menu.aspx");
        }
    }

    protected void _shirtSize_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        this._message.Text = "Shirt size option was updated";
    }

    protected void _shirtSize_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        this._message.Text = "Shirt size option was deleted";
    }
    
    protected void _addNew_Click(object sender, EventArgs e)
    {
        this._addNew.Visible = false;
        this._pnlAddNew.Visible = true;
        this._shirtSize.Visible = false;
        this._message.Text = "";
        this._newShirtSize.Text = "";
    }

    protected void _cancel_Click(object sender, EventArgs e)
    {
        this._addNew.Visible = true;
        this._pnlAddNew.Visible = false;
        this._shirtSize.Visible = true;
    }

    protected void _addNow_Click(object sender, EventArgs e)
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

            using (SqlCommand cmd = new SqlCommand("[validShirtSizeInsert]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                // Build the parameters (input items) that the stored procedures needs
                cmd.Parameters.AddWithValue("@shirtSize", this._newShirtSize.Text);

                // Open the database and actually run the stored procedure, also catch any errors and display them in your _message label, also refreshed grid to show new record
                try
                {
                    conn.Open();
                    int intResponse = Convert.ToInt16(cmd.ExecuteScalar());

                    if (intResponse == 0)
                    {
                        this._message.Text = "Shirt Size already existed -                  Not Added";
                    }
                    else
                    {
                        this._message.Text = "New Shirt Size was Added";
                    }

                    // Following line refreshes your grid for the new record
                    this._shirtSize.DataBind();
                    this._pnlAddNew.Visible = false;
                    this._addNew.Visible = true;
                    this._shirtSize.Visible = true;
                    this._newShirtSize.Text = "";
                }

                // If there are any errors with the store procedure, display them in the message label
                catch (SqlException ex)
                {
                    this._message.Text = "Error on inserting into the validShirtSize Table " + ex.Message;
                }
            }
        }

        
    }
}
