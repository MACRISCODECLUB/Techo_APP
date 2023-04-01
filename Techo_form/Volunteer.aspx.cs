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
        Techo_form.email email = new email();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_siguiente_Click(object sender, EventArgs e)
        {

            //Validaciones
            if (tb_FirstName.Text.Length < 2)
            {
                lbl_mensaje.Text = "Proporcione un nombre valido";
                lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                lbl_mensaje.Visible = true;
            }
            else
            {
                if(tb_LastName.Text.Length < 2)
                {
                    lbl_mensaje.Text = "Proporcione un apellido valido";
                    lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                    lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                    lbl_mensaje.Visible = true;
                }
                else
                {
                    if(tb_DOB.Text.Length < 1)
                    {
                        lbl_mensaje.Text = "Proporcione una fecha de nacimiento valida";
                        lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                        lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                        lbl_mensaje.Visible = true;
                    }
                    else 
                    {
                        if (udf.FormatDateToDate(tb_DOB.Text) > DateTime.Now)
                        {
                            lbl_mensaje.Text = "Proporcione una fecha de nacimiento valida";
                            lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                            lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                            lbl_mensaje.Visible = true;
                        }
                        else
                        {
                            if (tb_Cellphone.Text.Length < 1)
                            {
                                lbl_mensaje.Text = "Proporcione un numero de telefono valido";
                                lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                                lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                                lbl_mensaje.Visible = true;
                            }
                            else
                            {
                                if (tb_Email.Text.Length < 1)
                                {
                                    lbl_mensaje.Text = "Proporcione un email valido";
                                    lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                                    lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                                    lbl_mensaje.Visible = true;
                                }
                                else
                                {
                                    if (Convert.ToInt32(DDL_Country.SelectedValue) < 0)
                                    {
                                        lbl_mensaje.Text = "Seleccione un País";
                                        lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                                        lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                                        lbl_mensaje.Visible = true;
                                    }
                                    else
                                    {
                                        if (Convert.ToInt32(DDL_City.SelectedValue) < 0)
                                        {
                                            lbl_mensaje.Text = "Seleccione una Ciudad";
                                            lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                                            lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                                            lbl_mensaje.Visible = true;
                                        }
                                        else
                                        {
                                            if (Convert.ToInt32(DDL_State.SelectedValue) < 0)
                                            {
                                                lbl_mensaje.Text = "Seleccione un Estado";
                                                lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                                                lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                                                lbl_mensaje.Visible = true;
                                            }
                                            else
                                            {
                                                if (tb_RNP_Number.Text.Length < 1)
                                                {
                                                    lbl_mensaje.Text = "Proporcione un numero de RNP valido";
                                                    lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                                                    lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                                                    lbl_mensaje.Visible = true;
                                                }
                                                else
                                                {
                                                    do_insertvolunteer();
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            
        }

        private void do_insertvolunteer()
        {
            try
            {
                udf.Execute_Non_Query(volunteer.Insert_New_Volunteer(tb_FirstName.Text, tb_LastName.Text, tb_DOB.Text, Convert.ToInt32(rbl_Gender.SelectedValue),
                    tb_Cellphone.Text, tb_Email.Text, Convert.ToInt32(DDL_Country.SelectedValue), Convert.ToInt32(DDL_City.SelectedValue), Convert.ToInt32(DDL_State.SelectedValue), tb_RNP_Number.Text));

                lbl_mensaje.Text = "Muchas Gracias!, El voluntario fue creado exitosamente.";
                lbl_mensaje.Visible = true;
                lbl_mensaje.BackColor = System.Drawing.Color.LightGreen;
                lbl_mensaje.ForeColor = System.Drawing.Color.DarkGreen;
                //MANDAR CORREO ELECTRONICO AL VOLUNTARIO PARA QUE SE CONFIRME
                email.SendEmail(tb_Email.Text, "Nuevo voluntario", getBodyVolunteer());
            }
            catch (Exception ex)
            {
                lbl_mensaje.Text = "Ha ocurrido un error: " + ex.Message.ToString();
                lbl_mensaje.Visible = true;
                lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
            }
        }

        private string getBodyVolunteer()
        {
            string Body = "";
            Body += "<h1> Muchas gracias por unirte a Techo! </h1> <br /> <hr />";
            Body += "Para confirmar tu correo electronico y activar tu cuenta debes dar click en el link inferior";

            return Body;
        }
    }
}