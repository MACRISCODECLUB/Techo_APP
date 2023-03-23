using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace Techo_form
{
    public partial class DetalleActividad : System.Web.UI.Page
    {
        Techo_form.code.udf udf = new code.udf();
        Techo_form.code.activity activity = new code.activity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Get_Actividad_Info(Request.QueryString["I"].ToString());
                
            }
        }

        private void Get_Actividad_Info(string Idactividad)
        {
            DataTable dt_Coordinators = new DataTable();
            DataTable dt_Actividad = new DataTable();
            DataTable dt_City = new DataTable();
            dt_Actividad = udf.Get_DataSet_Query(activity.GetActivitybyId(Idactividad)).Tables[0];
            string Id_City = "";
            dt_Coordinators = udf.Get_DataSet_Query(activity.GetCoordinatorbyId(Idactividad)).Tables[0];
            string Id_Coordinator = "";
            foreach (DataRow r in dt_Actividad.Rows)
            {
                lbl_ActivName.Text = r["Activ_Name"].ToString();
                Id_City = r["Id_City"].ToString();
                dt_City = udf.Get_DataSet_Query(activity.GetCitybyId(Id_City)).Tables[0];
                Id_Coordinator = r["Id_Coordinator"].ToString();
                dt_Coordinators = udf.Get_DataSet_Query(activity.GetCoordinatorbyId(Id_Coordinator)).Tables[0];
                foreach (DataRow c in dt_City.Rows)
                {
                    lbl_ActivCity.Text = c["City_Name"].ToString();
                }
                
                foreach (DataRow CORD in dt_Coordinators.Rows)
                {
                    //CORD for Cordinator ID
                    lbl_CoordinatorActiv.Text = CORD["FirstName"].ToString();
                }
            }
        }
    }
}