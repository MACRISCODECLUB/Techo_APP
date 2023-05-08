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
        Techo_form.email email = new Techo_form.email();
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
            Boolean Visibility;
            string VisibilityText = "";
            Boolean Status;
            string StatusText = "";
            string StartDate = "";
            string EndDate = "";
            string Capacity = "";
            Boolean AdminConfirm = false;
            string AdminConfirmText = "";
            string Cost = "";

            foreach (DataRow r in dt_Actividad.Rows)
            {
                lbl_ActivName.Text = r["Activ_Name"].ToString();
                lbl_WorkHoursActiv.Text = r["Work_Hours"].ToString();
                Id_City = r["Id_City"].ToString();
                dt_City = udf.Get_DataSet_Query(activity.GetCitybyId(Id_City)).Tables[0];
                Id_Coordinator = r["Id_Coordinator"].ToString();
                dt_Coordinators = udf.Get_DataSet_Query(activity.GetCoordinatorbyId(Id_Coordinator)).Tables[0];
                Visibility = Convert.ToBoolean(r["Visibility"].ToString());
                Status = Convert.ToBoolean(r["Status"].ToString());
                StartDate = Convert.ToString(r["StartF"]);
                EndDate = Convert.ToString(r["EndF"]);
                Capacity = Convert.ToString(r["capacityactiv"]);
                lbl_DescriptionActiv.Text = (r["descripactiv"]).ToString();
                Cost = (r["Cost"]).ToString() + "L";
                lbl_CostActiv.Text = Cost;
                //Visibility function, convert boolean to string
                if(Visibility == true)
                {
                    VisibilityText = "Visible";
                }
                else
                {
                    VisibilityText = "Invisible";
                }
                
                lbl_VisibilityActiv.Text = VisibilityText;

                //Status function, convert boolean to string
                if(Status == true)
                {
                    StatusText = "Abierto";
                }
                else
                {
                    StatusText = "Cerrado";
                }

                lbl_StatusActiv.Text = StatusText;
                lbl_StartDateActiv.Text = StartDate;
                lbl_EndDateActiv.Text = EndDate;
                lbl_CapacityActiv.Text = Capacity;

                //Admin confirm function, Convert boolean to Yes or No
                if(AdminConfirm == true)
                {
                    AdminConfirmText = "Si";
                }
                else
                {
                    AdminConfirmText = "No";
                }

                lbl_AdminConfirmActiv.Text = AdminConfirmText;
                foreach (DataRow c in dt_City.Rows)
                {
                    lbl_ActivCity.Text = c["City_Name"].ToString();
                }
                
                foreach (DataRow CORD in dt_Coordinators.Rows)
                {
                    //CORD for Cordinator ID
                    lbl_CoordinatorActiv.Text = CORD["FirstName"].ToString() + " " + CORD["LastName"].ToString();
                }
            }
        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            try
            {
                 
                
                lbl_RegisterOutput.Text = "El voluntario fue registrado satisfactoriamente.";
                lbl_RegisterOutput.BackColor = System.Drawing.Color.Green;
                lbl_RegisterOutput.Visible = true;
                //Send email with Id people from ID User
                string Subject = "";
                Subject = "Te has registrado en" + lbl_ActivName.Text;
                email.SendEmail("marcoefigueroa042@gmail.com", Subject, GetBodyRegisterVolunt());
            }
            catch (Exception ex)
            {
               
            }
        }
        private string GetBodyRegisterVolunt()
        {
            string b = "";
            b += "<h1> Confirmamos tu registro en la actividad <h1/>";
            b += "<p>Gracias por tu intencion de participar en la actividad" + " " + lbl_ActivName.Text + "!";
            b += "recuerda reportarte con el coordinador de la actividad" + " " + lbl_CoordinatorActiv.Text;

            return (b);
        }
    }
}
    //FOR DATE
//CONVERT (varchar(10), Starts, 111) AS Expr1, CONVERT (varchar(10)