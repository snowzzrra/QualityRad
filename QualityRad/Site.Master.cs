using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QualityRad
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginSession"] != null)
            {
                this.Sidebar.Visible = true;
                this.Footer.Visible = true;
            }
            else if (Context.Request.Path != "/Login/LoginPage" && Context.Request.Path != "/Login/Registro")
            {
                Response.Redirect("~/Login/LoginPage");
            }
        }

        protected void LogOff_Click(object sender, EventArgs e)
        {
            if (Session["LoginSession"] != null)
            {
                Session.Abandon();
                Response.Redirect("~/Login/LoginPage");
            }
        }
    }
}