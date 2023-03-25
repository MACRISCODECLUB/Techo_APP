using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techo_form
{
    public partial class DashboardVolunteer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PanelActiv2_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridView gv = PanelActiv2;
            string Id_Activity = gv.SelectedDataKey.Value.ToString();
            Response.Redirect("DetalleActividad.aspx?i=" + Id_Activity);
        }
    }
}