using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QualityRad.Pages
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string name = nameTextBox.Text;
            string email = emailTextBox.Text;
            string password = passwordTextBox.Text;
            string confirmPassword = passwordConfirmTextBox.Text;
            string phone = phoneTextBox.Text;

            if (password == confirmPassword)
            {
                Response.Redirect("~/SuccessPage.aspx"); 
            }
            else
            {
                
            }
        }
    }
}
