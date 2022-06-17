using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class user_Profile : System.Web.UI.Page
{
    PersonInfo person = new PersonInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        //block users who are not admins
        //retrieve the session variable set on the login page
        //yes you could have used the cookie also, demonstrating additional features
        person = (PersonInfo)Session["person"];
        if (person.RoleID != 3)
        {
            Response.Redirect("~/user/menu.aspx");
        }
        
    }

    protected void _clear_Click(object sender, EventArgs e)
    {
        this._firstName.Text = "";
        this._lastName.Text = "";
        this._email.Text = "";
        this._password.Text = "";
        this._Role.SelectedIndex = 0;
        this._results.Text = "";
        this._phone.Text = "";
        this._employer.SelectedIndex = 0;
        this._message.Text = "";
        _pnlAddUser.Visible = false;
        _personAddModify.Visible = true;
        _people.Visible = true;
        // clear the results label
        
    }

    protected void _submit_Click(object sender, EventArgs e)
    {
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
            using (SqlCommand cmd = new SqlCommand("[validPersonInsert]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                //build the parameters (input items) that the stored procedures needs
                cmd.Parameters.AddWithValue("@firstName", this._firstName.Text);
                cmd.Parameters.AddWithValue("@lastName", this._lastName.Text);
                cmd.Parameters.AddWithValue("@email", this._email.Text);
                cmd.Parameters.AddWithValue("@pwd", this._password.Text);
                cmd.Parameters.AddWithValue("@phone", this._phone.Text);
                cmd.Parameters.AddWithValue("@roleID", this._Role.SelectedValue);
                // add more parameters as needed by your stored procedure
                // open the database and actually run the stored procedure, also catch
                // any errors and display them in your _message label, also refreshed grid to show new record
                try
                {
                    conn.Open();
                    int intResponse = Convert.ToInt16(cmd.ExecuteScalar());
                    if (intResponse == 0)
                    {
                        this._message.Text = "Person already exists - Not Added";
                    }
                    else
                    {
                        this._message.Text = "New Person was Added";
                    }                // following line refreshes your grid for the new record
                    this._people.DataBind();
                }
                //if there are any errors with the store procedure, display them in the message label
                catch (SqlException ex)
                {
                    this._message.Text = "Error on inserting into the Valid Roles Table " + ex.Message;
                }
            }
        }
        
        
     
        this._results.Text = "Thank you " + this._firstName.Text + " " +
            this._lastName.Text + "<br/>" + "We are showing your email as: " + this._email.Text +
            "<br/>Your intial role is " + this._Role.SelectedItem.Text;

        this._firstName.Text = "";
        this._lastName.Text = "";
        this._email.Text = "";
        this._password.Text = "";
        this._Role.SelectedIndex = 0;
        this._phone.Text = "";
        this._employer.SelectedIndex = 0;

        _pnlAddUser.Visible = false;
        _personAddModify.Visible = true;
        _people.Visible = true;
    }



    protected void _personAddModify_Click(object sender, EventArgs e)
    {
        _pnlAddUser.Visible = true;
        _personAddModify.Visible = false;
        _people.Visible = false;
        _message.Text = "";
        _results.Text = "";
    }



    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        this._message.Text = "Person deleted";
    }

    protected void _people_SelectedIndexChanged(object sender, EventArgs e)
    {

    }



    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
     
    }

    protected void LinkButton1_Click2(object sender, EventArgs e)
    {
        _message.Text = "Person updated";
    }
}