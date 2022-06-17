using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using smrProject2;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

public partial class Account_Login : Page
{
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";

        // Previously used for social media login (References <div class="col-md-4">)
        // OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];

            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

    // OLD LOGIN CODE

    //protected void LogIn(object sender, EventArgs e)
    //{
    //    if (IsValid)
    //    {
    //        // Validate the user password
    //        var manager = new UserManager();
    //        ApplicationUser user = manager.Find(_emaillogin.Text, Password.Text);
    //        if (user != null)
    //        {
    //            IdentityHelper.SignIn(manager, user, RememberMe.Checked);
    //            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
    //        }
    //        else
    //        {
    //            FailureText.Text = "Invalid username or password.";
    //            ErrorMessage.Visible = true;
    //        }
    //    }
    //}



    protected void LogIn(object sender, EventArgs e)
    {
        if (IsValid)
        {

            Boolean isOK = false;

            // Build a link the the name/pwd/user for your particular database
            // Note below the [mis413...] should be the name of your connection string, open your webconfig file and find the connection string name

            string dbConn = System.Configuration.ConfigurationManager.ConnectionStrings["S18CDSpeakCDSConnectionString"].ConnectionString;

            // Build a connection to the database

            SqlConnection conn = new SqlConnection(dbConn);

            // Use the above connection to execute a particular stored procedure [substitue your personInsert stored procedure name]

            using (SqlCommand cmd = new SqlCommand("[smrLogin]", conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                // Build the parameters (input items) that the stored procedures needs

                cmd.Parameters.AddWithValue("@email", this._emaillogin.Text);
                cmd.Parameters.AddWithValue("@pwd", this._passwordlogin.Text);

                // Open the database and actually run the stored procedure, also catch any errors and display them in your _message label

                try
                {
                    conn.Open();
                    SqlDataReader dtrReader = cmd.ExecuteReader();

                    // See if any data was returned from the stored procedure. If no data, then not a valid user or password

                    if (dtrReader.HasRows)
                    {
                        // Read the first record
                        dtrReader.Read();



                        // Specialized code goes here, what should you do if the login is valid?
                        HttpCookie aCookie = new HttpCookie("userInfo");

                        aCookie.Values["firstName"] = (string)dtrReader["firstName"];
                        aCookie.Values["lastName"] = (string)dtrReader["lastName"];
                        //aCookie.Values["email"] = (string)dtrReader["email"];
                        aCookie.Values["personID"] = Convert.ToString(dtrReader["personID"]);
                        aCookie.Values["roleID"] = Convert.ToString(dtrReader["roleID"]);
                        aCookie.Expires = DateTime.Now.AddMinutes(20);

                        //// This actually writes the cookie on the users machine on the postback to the client
                        Response.Cookies.Add(aCookie);
                        isOK = true;

                        //// Set authentication to true and save the user’s name
                        string userName = (string)(dtrReader["firstName"]) + " " + (string)(dtrReader["lastName"]);
                        FormsAuthentication.RedirectFromLoginPage(userName, true);

                        // Demonstrate the use of a person class and session variables
                        // remember the dtrReader field names must be YOUR field names in your database

                        PersonInfo person = new PersonInfo();
                        person.PersonID = Convert.ToInt32(dtrReader["personID"]);
                        person.FirstName = (string)dtrReader["firstName"];
                        person.LastName = (string)dtrReader["lastName"];
                        person.Email = (string)dtrReader["email"];
                        person.RoleID = Convert.ToInt32(dtrReader["roleID"]);

                        Session["person"] = person;



                        // If you would like to check if all of this works you might want to test to here by inserting the following code and the deleting once you confirm it works

                        FailureText.Text = "Email/Password Good.";
                        ErrorMessage.Visible = true;
                    }
                    else
                    {
                        // no data was returned from the stored procedure, this uses the
                        // Login Page’s Literal Object named FailureText

                        FailureText.Text = "Invalid username or password.";
                        ErrorMessage.Visible = true;
                    }
                }

                // if there are any errors with the store procedure, display them in the FailureText Literal

                catch (SqlException ex)
                {
                    FailureText.Text = "Error on sign in procedure " + ex.Message;
                    ErrorMessage.Visible = true;
                }
            }
            
            if (isOK)
            {
                Response.Redirect("~/user/menu.aspx");
            }
        }
    }
}