using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techo_form.Scripts
{
    public partial class Voluntario_Creado : System.Web.UI.Page
    {
        Techo_form.code.udf udf = new code.udf();
        Techo_form.code.volunteer vol = new code.volunteer();
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = "";
            int conf_number = 0;
            try
            {
                conf_number = Convert.ToInt32(Request.QueryString["cn"].ToString());
                email = Request.QueryString["e"].ToString();
                //Comparar el confirmation number and email with db
                DataTable Dt_Vol = new DataTable();
                Dt_Vol = udf.Get_DataSet_Query(vol.Compare_cn_and_e_with_db(email, conf_number)).Tables[0];
                if(Dt_Vol.Rows.Count > 0)
                {
                    //Found

                    udf.Execute_Non_Query(vol.Update_Verification_Users("1", email, conf_number));

                    lbl_mensaje.Text = "Muchas Gracias!, El voluntario fue creado exitosamente.";

                    //TODO go to my profile link
                    lbl_mensaje.BackColor = System.Drawing.Color.LightGreen;
                    lbl_mensaje.ForeColor = System.Drawing.Color.DarkGreen;
                }
                else
                {
                    //not found
                    lbl_mensaje.Text = "El codigo de confirmación no pertenece a este Usuario, no se ha podido confirmar el usuario.";
                    lbl_mensaje.Visible = true;
                    lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                    lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                }

            }
            catch (Exception ex)
            {
                lbl_mensaje.Text = "Ha ocurrido un error: " + ex.Message.ToString();
                lbl_mensaje.Visible = true;
                lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;


            }
        }
    }
}