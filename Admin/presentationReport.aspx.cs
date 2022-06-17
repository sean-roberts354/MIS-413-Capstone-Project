using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_presentationReport : System.Web.UI.Page
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
}