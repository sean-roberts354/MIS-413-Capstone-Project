using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this._cookieRetrieveInfo.Text = "Your Person ID is: " + Convert.ToString(RetrieveID()) + " and your Role ID is: " + Convert.ToString(RetrieveRole());

        // Switch statement which determines what users can see on page
        switch (RetrieveRole())
        {
            case 1: // Student
                this._studentPanel.Visible = true;
                break;

            case 2: // Speaker
                this._speakerPanel.Visible = true;
                break;

            case 3: // Event Coordinator/Admin
                this._studentPanel.Visible = true;
                this._speakerPanel.Visible = true;
                this._adminPanel.Visible = true;
                break;

            default:
                this._studentPanel.Visible = true;
                this._speakerPanel.Visible = true;
                break;
        }


    }

    protected void _validShirtSize_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/validShirtSize.aspx");
    }

    protected void _presentation_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/presentation.aspx");
    }
    protected void _speakerInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/speakerInfo.aspx");
    }
    protected void _validRooms_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/validRooms.aspx");
    }
    protected void _speakerPresentation_Click_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/speakerPresentation.aspx");
    }
    protected void _presentationReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/presentationReport.aspx");
    }
    protected void _employer_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/Employer.aspx");
    }
    protected void _profile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Profile.aspx");
    }
    protected void _studentHostsReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/StudentHostsReport.aspx");
    }
    protected void _majorsAddModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/validMajor.aspx");
    }
    protected void _personRoleAddDelete_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/personRole.aspx");
    }

    protected void _validRolesAddModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/validRoles.aspx");
    }
    protected void _personEmployerAddDelete_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/personEmployer.aspx");
    }
    protected void _studentInfoAddDelete_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/studentInfo.aspx");
    }
    protected void _speakerReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/speakerInfoReport.aspx");
    }

    protected int RetrieveID()
    {
        // This checks to see if a cookie exists and returns the PersonID
        int iTempID = 0;
        if (Request.Cookies["userInfo"] != null)
        {
            iTempID =
           Convert.ToInt32(Server.HtmlEncode(Request.Cookies["userInfo"]["personID"]));
        }
        return iTempID;
    }

    protected int RetrieveRole()
    {
        // this checks to see if a cookie exists and returns the RoleID
        int iTempID = 0;
        if (Request.Cookies["userInfo"] != null)
        {
            iTempID =
            Convert.ToInt32(Server.HtmlEncode(Request.Cookies["userInfo"]["roleID"]));
        }
        return iTempID;
    }








}