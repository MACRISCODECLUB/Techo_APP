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

            //create function to generate password
            string password = generate_password();
            //create function to create confirmation number
            int conf_number = generate_conf_number();
            //TODO insert into users password and confirmation number
            
            //TODO update Id_User in people table where Id_People
            //TODO add this information to sent email
            
        }

        private void do_insertintouser(string password, int conf_number)
        {
            try
            {
                udf.Execute_Non_Query(volunteer.Insert_into_user(tb_Email.Text, password, 4, conf_number));
            }
            catch (Exception)
            {

            throw;
            }
            //TODO add to session variables, the password and conf number
        }

        private int generate_conf_number()
        {
            int conf_number = 0;
            conf_number = udf.RandomNumber(0, 1000);
            Session["cn"] = conf_number; 
            return conf_number;
        }

        private string generate_password()
        {
            string password = "";
            password = udf.RandomPassword(6);
            Session["pwd"] = password;
            return password;
            
        }

        private void do_insertvolunteer()
        {
            try
            {
                Session["idp"] = udf.Execute_Scalar(volunteer.Insert_New_Volunteer(tb_FirstName.Text, tb_LastName.Text, tb_DOB.Text, Convert.ToInt32(rbl_Gender.SelectedValue),
                    tb_Cellphone.Text, tb_Email.Text, Convert.ToInt32(DDL_Country.SelectedValue), Convert.ToInt32(DDL_City.SelectedValue), Convert.ToInt32(DDL_State.SelectedValue), tb_RNP_Number.Text)).ToString();

                lbl_mensaje.Text = "Muchas Gracias!, El voluntario fue creado exitosamente.";
                lbl_mensaje.Visible = true;
                lbl_mensaje.BackColor = System.Drawing.Color.LightGreen;
                lbl_mensaje.ForeColor = System.Drawing.Color.DarkGreen;

                do_insertintouser(generate_password(), generate_conf_number());
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
            Body += "<td style = \"border-radius: 2px; align-content: center;\" bgcolor = \"#415698\">";
            Body += "<a href = \"http://localhost:50761/Volunteer_Created.aspx?cn=" + Session["cn"] + "&e=" + tb_Email.Text + "\" ";
            Body += "target = \"_blank\" ";
            Body += "style = \"padding: 8px 12px; border: 1px solid #415698;border-radius: 2px;font-family: Helvetica, Arial, sans-serif;font-size: 14px; color: #ffffff;text-decoration: none;font-weight:bold;display: inline-block;\"> ";
            Body += "Confirmar cuenta";
            Body += "</a>";
            Body += "<h2>Contraseña:<h2/>";
            Body += "<br/>" + Convert.ToString(Session["pwd"]);

            return Body;
        }
    }
}