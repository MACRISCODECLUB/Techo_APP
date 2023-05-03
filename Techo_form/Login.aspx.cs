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
                    break;
                case "mfigueroa@macrisschool.org":
                    Session["profileId"] = 1;
                    break;
                case "aaguero@macrisschool.org":
                    Session["profileId"] = 1;
                    break;
                default:
                    break;
            }
            Response.Redirect("default.aspx");
        }
    }
}