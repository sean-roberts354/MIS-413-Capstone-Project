using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_Employer : System.Web.UI.Page
{
    PersonInfo person = new PersonInfo();

    protected void Page_Load(object sender, EventArgs e)
    {
        person = (PersonInfo)Session["person"];
    }

    protected void _employers_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void _employers_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        this._message.Text = "Employer Name was Updated"; 
    }

    protected void _employers_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        this._message.Text = "Employer was Deleted";
    }

    protected void _addNew_Click(object sender, EventArgs e)
    {
        this._employerAddModify.Visible = false;
        this._pnlAddNew.Visible = true;
        this._employerGrid.Visible = false;
        this._message.Text = "";
        this._employerName.Text = "";
    }

    protected void _clear_Click(object sender, EventArgs e)
    {
        this._employerAddModify.Visible = true;
        this._pnlAddNew.Visible = false;
        this._employerGrid.Visible = true;
        this._message.Text = "";
    }

    protected void _submit_Click(object sender, EventArgs e)
    {
        this._employerAddModify.Visible = false;
        this._pnlAddNew.Visible = true;
        this._employerGrid.Visible = false;

        // first check the page passed the error checking
        if (Page.IsValid)
        {
            // this will insert a new record into the database
            //build a link the the name/pwd/user for your particular database
            //note below the [mis413...] should be the name of your connection string, 
            //open your webconfig file and find the connection string name
            string dbConn = System.Configuration.ConfigurationManager.ConnectionStrings["S18CDSpeakCDSConnectionString"].ConnectionString;
            //build a connection to the database
            SqlConnection conn = new SqlConnection(dbConn);
            //use the above connection to execute a particular stored procedure
            //[substitue your validTableInsert stored procedure name below]
            using (SqlCommand cmd = new SqlCommand("[validEmployerInsert]", conn))
        {
            cmd.CommandType = CommandType.StoredProcedure;
             //build the parameters (input items) that the stored procedures needs
            cmd.Parameters.AddWithValue("@employerName", this._employerName.Text);
        // add more parameters as needed by your stored procedure
        // open the database and actually run the stored procedure, also catch
        // any errors and display them in your _message label, also refreshed grid to show new record
                try
                {
                    conn.Open();
                    int intResponse = Convert.ToInt16(cmd.ExecuteScalar());
                    if (intResponse == 0)
                    {
                        this._message.Text = "Employer already existed - Not Added";
                    }
                    else
                    {
                    this._message.Text = "New Employer was Added";
                    }                // following line refreshes your grid for the new record
                        this._employerGrid.DataBind();
                    }
                        //if there are any errors with the store procedure, display them in the message label
                    catch (SqlException ex)
                     {
                        this._message.Text = "Error on inserting into the Valid Roles Table " + ex.Message;
                     }
                 }
         }

        //Toggling Begins
        _pnlAddNew.Visible = false;
        _employerGrid.Visible = true;
        _employerAddModify.Visible = true;

     }



    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        this._message.Text = "Person deleted";
    }
}
