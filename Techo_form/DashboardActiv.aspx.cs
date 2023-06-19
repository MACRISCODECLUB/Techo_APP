using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techo_form
{
    public partial class DashboardActiv : System.Web.UI.Page
    {
        Techo_form.code.udf udf = new code.udf();
        Techo_form.code.activity activity = new code.activity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PanelActiv.DataSourceID = "ds_ActivityPanel";
                PanelActiv.DataBind();

            }
        }

        protected void PanelActiv_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv = PanelActiv;
            string Id_Activity = gv.SelectedDataKey.Value.ToString();
            //If user profile is volunteer or else get user profile from Session["profileID"] when login
            string pid = Session["profileId"].ToString();
            if (Session["profileId"].ToString() == "4")
            {
                Response.Redirect("DetalleActividad.aspx?i=" + Id_Activity);
            }
            else
            {
                Response.Redirect("Activities.aspx?i=" + Id_Activity);
            }
        }

        protected void btn_Applyfilters_Click(object sender, EventArgs e)
        {
            DataTable dt_Filtered = new DataTable();
            DateTime Endf;
            Endf = DateTime.ParseExact(tb_Enddate_Filter.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            DateTime Startf;
            Startf = DateTime.ParseExact(tb_startdate_Filter.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            dt_Filtered = udf.Get_DataSet_Query(activity.Get_Activities_by_Date(Startf, Endf)).Tables[0];

            PanelActiv.DataSourceID = "";
            PanelActiv.DataSource = dt_Filtered;
            PanelActiv.DataBind();
        }

        protected void btn_RemoveFilter_Click(object sender, EventArgs e)
        {
            PanelActiv.DataSourceID = "ds_ActivityPanel";
            PanelActiv.DataBind();
        }
    }
}