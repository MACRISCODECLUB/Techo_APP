using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techo_form
{
    public partial class DashboardActiv : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PanelActiv_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv = PanelActiv;
            string Id_Activity = gv.SelectedDataKey.Value.ToString();
            //TODO if user profile is volunteer or else get user profile from Session["profileID"] when login
            if (Session["profileId"].ToString() == "4")
            {
                Response.Redirect("DetalleActividad.aspx?i=" + Id_Activity);
            }
            else
            {
                Response.Redirect("Activities.aspx?i=" + Id_Activity);
            }
        }
    }
}