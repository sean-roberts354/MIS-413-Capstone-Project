using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_speakerPresentation : System.Web.UI.Page
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

    protected void _addNew_Click(object sender, EventArgs e)
    {
        this._pnlAddNew.Visible = true;
        this._addNew.Visible = false;
        this._speakerPresentationGridView.Visible = false;
        this._message.Text = "";
        this._newSpeakerPair.SelectedIndex = 0;
        this._newPresentationPair.SelectedIndex = 0;
    }

    protected void _cancel_Click(object sender, EventArgs e)
    {
        this._pnlAddNew.Visible = false;
        this._addNew.Visible = true;
        this._speakerPresentationGridView.Visible = true;
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

            using (SqlCommand cmd = new SqlCommand("[speakerPresentationInsert]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                // Build the parameters (input items) that the stored procedures needs
                cmd.Parameters.AddWithValue("@presentationID", this._newPresentationPair.SelectedValue);
                cmd.Parameters.AddWithValue("@speakerID", this._newSpeakerPair.SelectedValue);

                // Open the database and actually run the stored procedure, also catch any errors and display them in your _message label, also refreshed grid to show new record
                try
                {
                    conn.Open();
                    int intResponse = Convert.ToInt16(cmd.ExecuteScalar());

                    if (intResponse == 0)
                    {
                        this._message.Text = "Speaker already a part of this presentation";
                    }
                    else
                    {
                        this._message.Text = "New speaker added to presentation";
                    }

                    // Following line refreshes your grid for the new record
                    this._speakerPresentationGridView.DataBind();
                    this._pnlAddNew.Visible = false;
                    this._addNew.Visible = true;
                    this._speakerPresentationGridView.Visible = true;
                    
                }

                // If there are any errors with the store procedure, display them in the message label
                catch (SqlException ex)
                {
                    this._message.Text = "Error on inserting into the speakerPresentation Table " + ex.Message;
                }
            }
        }
    }

    protected void _speakerPresentationGridView_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        this._message.Text = "Speaker was removed from presentation";
    }
}