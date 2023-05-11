using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techo_form
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_login_Click(object sender, EventArgs e)
        {
            switch (tb_Username.Text)
            {
                case "rhasbun@macrisschool.org": 
                    Session["profileId"] = 4;
                    Session["email"] = tb_Username.Text;
                    break;
                case "marcoestebanfigueroa@macrisschool.org":
                    Session["profileId"] = 4;
                    Session["email"] = tb_Username.Text;
                    break;
                case "ramonhasbun@gmail.com":
                    Session["profileId"] = 4;
                    Session["email"] = tb_Username.Text;
                    break;
                //case "ramonhasbun@gmail.com":
                //    Session["profileId"] = 4;
                //    break;
                case "marcoefigueroa042@gmail.com":
                    Session["profileId"] = 1;
                    Session["email"] = tb_Username.Text;
                    break;
                case "alfreddavidaguero@macrisschool.org":
                    Session["profileId"] = 2;
                    Session["email"] = tb_Username.Text;
                    break;
                default:
                    break;
            }
            Response.Redirect("default.aspx");
        }
    }
}