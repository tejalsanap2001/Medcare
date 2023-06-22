using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI;
using Tejal_Site;

public partial class Account_Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterHyperLink.NavigateUrl = "Register";
        OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
        var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        if (!String.IsNullOrEmpty(returnUrl))
        {
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
        }
    }

    protected void LogIn(object sender, EventArgs e)
    {
        if (IsValid)
        {
            //var manager = new UserManager();
            //ApplicationUser user = manager.Find(UserName.Text, Password.Text);
            if (UserName.Text.Trim().ToString() == "vp123" && Password.Text.Trim().ToString() == "vp123")
            {
                //IdentityHelper.SignIn(manager, user, RememberMe.Checked);

                Session["IsLogin"] = "true";

                Response.Redirect("~/");
            }
            else
            {
                FailureText.Text = "Invalid username or password.";
                ErrorMessage.Visible = true;
            }

            // Validate the user password
            //var manager = new UserManager();
            //ApplicationUser user = manager.Find(UserName.Text, Password.Text);
            //if (user != null)
            //{
            //    IdentityHelper.SignIn(manager, user, RememberMe.Checked);
            //    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            //}
            //else
            //{
            //    FailureText.Text = "Invalid username or password.";
            //    ErrorMessage.Visible = true;
            //}
        }
    }
}