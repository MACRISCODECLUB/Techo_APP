using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techo_form.Scripts
{
    public partial class Volunteer_dashboard : System.Web.UI.Page
    {
       Techo_form.code.volunteer volunteer = new code.volunteer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GV_Volunteers_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView GV_volunteer_dashboard = GV_Volunteers;
            string Id_people = GV_volunteer_dashboard.SelectedDataKey.Value.ToString();
            Response.Redirect("Volunteer_details.aspx?idv=" + Id_people);
        }

        //protected void bt_apply_filter_Click(object sender, EventArgs e)
        //{
        //    string c = "";
        //    c = Convert.ToInt32(DDL_City.Text);
        //    volunteer.get_volunteer_by_city(c);
        //}
    }
}