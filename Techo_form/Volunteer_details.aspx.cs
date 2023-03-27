using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techo_form
{
    public partial class Volunteer_details : System.Web.UI.Page
    {
        Techo_form.code.udf udf = new code.udf();
        Techo_form.code.volunteer vol = new code.volunteer();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Request.QueryString["idv"].ToString();
            get_volunteer_info_by_Id(Request.QueryString["idv"].ToString());
        }

        private void get_volunteer_info_by_Id(string Id_Vol)
        {
            DataTable Dt_Vol = new DataTable();
            Dt_Vol = udf.Get_DataSet_Query(vol.get_volunteer_info_by_Id(Id_Vol)).Tables[0];

            foreach (DataRow r in Dt_Vol.Rows)
            {
                Label1.Text = r["FirstName"].ToString() + " " + r["LastName"].ToString();
            }
        }
    }
}