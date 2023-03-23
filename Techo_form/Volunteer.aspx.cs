using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techo_form
{
    public partial class Volunteer : System.Web.UI.Page
    {
        Techo_form.code.udf udf = new code.udf();
        Techo_form.code.volunteer volunteer = new code.volunteer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_siguiente_Click(object sender, EventArgs e)
        {
            try
            {
                udf.Execute_Non_Query(volunteer.Insert_New_Volunteer(tb_FirstName.Text, tb_LastName.Text, tb_DOB.Text, Convert.ToInt32(rbl_Gender.SelectedValue),
                    tb_Cellphone.Text, tb_Email.Text, Convert.ToInt32(DDL_Country.SelectedValue), Convert.ToInt32(DDL_City.SelectedValue), Convert.ToInt32(DDL_State.SelectedValue), tb_RNP_Number.Text));
                //TODO SE CREO EL VOLUNTARIO EXITOSAMENTE
                lbl_mensaje.Text = "Muchas Gracias!, El voluntario fue creado exitosamente.";
                lbl_mensaje.Visible = true;
                lbl_mensaje.BackColor = System.Drawing.Color.LightGreen;
                lbl_mensaje.ForeColor = System.Drawing.Color.DarkGreen;
                //MANDAR CORREO ELECTRONICO AL VOLUNTARIO PARA QUE SE CONFIRME
            }
            catch (Exception ex) 
            {
                //MOSTRAR MENSAJE DE ERROR 
                lbl_mensaje.Text = "Ha ocurrido un error: " + ex.Message.ToString();
                lbl_mensaje.Visible = true;
                lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
            }
        }
    }
}