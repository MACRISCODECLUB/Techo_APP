using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Techo_form
{
    public partial class actividades : System.Web.UI.Page
    {
        Techo_form.code.udf udf = new code.udf();
        Techo_form.code.activity activity = new code.activity();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddl_CategoryActiv_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_ActivityType.Items.Clear();
            ddl_ActivityType.DataBind();
        }

        protected void ddl_CountryActiv_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_StateActiv.Items.Clear();
            ddl_StateActiv.DataBind();
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                udf.Execute_Non_Query(activity.Insert_New_Activity(tb_nameactiv.Text, Convert.ToInt32(ddl_Cityactiv.SelectedItem.Value)
                    , Convert.ToInt32(ddl_Coordinatoractiv.Text), Convert.ToDouble(tb_Workhours.Text), DescriptionActiv.Text
                    , Convert.ToBoolean(ddl_visibility.Text), Convert.ToBoolean(ddl_status.Text), tb_startdate.Text, tb_enddate.Text
                    , Convert.ToInt32(tb_capacityactiv.Text), Convert.ToBoolean(ddl_adminconfirm.Text)));
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}