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
            if (!IsPostBack)
            {
                TC_Details.ActiveTabIndex = 0;
                tb_First_Name.Text = Session["idpeople"].ToString();
                get_volunteer_info_by_Id(Session["idpeople"].ToString());
            }

        }

        private void get_volunteer_info_by_Id(string Id_Vol)
        {
            DataTable Dt_Vol = new DataTable();
            Dt_Vol = udf.Get_DataSet_Query(vol.get_volunteer_info_by_Id(Id_Vol)).Tables[0];
            DataTable Dt_Genders = new DataTable();
            DataTable Dt_Countries = new DataTable();
            DataTable Dt_Cities = new DataTable();
            DataTable Dt_States = new DataTable();

            foreach (DataRow r in Dt_Vol.Rows)
            {
                tb_First_Name.Text = r["FirstName"].ToString();
                tb_Last_Name.Text = r["LastName"].ToString();
                tb_DOB.Text = Convert.ToDateTime(r["DOB"].ToString()).ToString("yyyy/MM/dd");
                rbl_Gender.SelectedValue = r["Id_Gender"].ToString();
                //Dt_Genders = udf.Get_DataSet_Query(vol.get_gender_by_Id_Gender(rbl_Gender.Text)).Tables[0];
                //foreach(DataRow g in Dt_Genders.Rows)
                //{
                //    rbl_Gender.Text = g["Gender"].ToString();
                //}
                tb_Cellphone.Text = r["Cellphone"].ToString();
                tb_Email.Text = r["Email"].ToString();
                DDL_Country.DataBind();
                DDL_Country.SelectedValue = r["Id_Country"].ToString();
                DDL_State.DataBind();
                //Dt_Countries = udf.Get_DataSet_Query(vol.get_country_by_Id_Country(DDL_Country.Text)).Tables[0];
                //foreach(DataRow c in Dt_Countries.Rows)
                //{
                //    DDL_Country.Text = c["Country_Name"].ToString();
                //}
                //Dt_Cities = udf.Get_DataSet_Query(vol.get_city_by_Id_City(DDL_City.Text)).Tables[0];
                //foreach(DataRow ct in Dt_Cities.Rows)
                //{
                //    DDL_City.Text = ct["City_Name"].ToString();
                //}
                //string Id_State = r["Id_State"].ToString();
                DDL_State.SelectedValue = r["Id_State"].ToString();
                DDL_City.DataBind();
                //string Id_City = r["Id_City"].ToString();
                DDL_City.SelectedValue = r["Id_City"].ToString();
                //Dt_States = udf.Get_DataSet_Query(vol.get_country_by_Id_State(DDL_State.Text)).Tables[0];
                //foreach(DataRow s in Dt_States.Rows)
                //{
                //    DDL_State.Text = s["State_Name"].ToString();
                //}
                tb_RNP.Text = r["RNP_Number"].ToString();
                tb_Nom_Cobertura_Med.Text = r["Nom_Cobertura_Med"].ToString();
                tb_Num_Cobertura_Med.Text = r["Num_Cobertura_Med"].ToString();
                tb_Nom_Contacto_ER.Text = r["Nom_Contacto_ER"].ToString();
                tb_Tel_Contacto_ER.Text = r["Tel_Contacto__ER"].ToString();
                tb_Rel_Contacto_ER.Text = r["Rel_Contacto_ER"].ToString();
                DDL_Blood_Type.DataBind();
                DDL_Blood_Type.SelectedValue = r["Id_Blood_Type"].ToString();
            }
        }

        protected void bt_Update_Informacion_General_Click(object sender, EventArgs e)
        {
            //validacion de datos

            if (tb_First_Name.Text.Length < 2)
            {
                lbl_error.Text = "Proporcione un nombre valido";
                lbl_error.BackColor = System.Drawing.Color.LightPink;
                lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                lbl_error.Visible = true;
            }
            else
            {
                if (tb_Last_Name.Text.Length < 2)
                {
                    lbl_error.Text = "Proporcione un apellido valido";
                    lbl_error.BackColor = System.Drawing.Color.LightPink;
                    lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                    lbl_error.Visible = true;
                }
                else
                {
                    if (tb_DOB.Text.Length < 1)
                    {
                        lbl_error.Text = "Proporcione una fecha de nacimiento valida";
                        lbl_error.BackColor = System.Drawing.Color.LightPink;
                        lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                        lbl_error.Visible = true;
                    }
                    else
                    {
                        if (udf.FormatDateToDate(tb_DOB.Text) > DateTime.Now)
                        {
                            lbl_error.Text = "Proporcione una fecha de nacimiento valida";
                            lbl_error.BackColor = System.Drawing.Color.LightPink;
                            lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                            lbl_error.Visible = true;
                        }
                        else
                        {
                            if (tb_Cellphone.Text.Length < 1)
                            {
                                lbl_error.Text = "Proporcione un numero de telefono valido";
                                lbl_error.BackColor = System.Drawing.Color.LightPink;
                                lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                                lbl_error.Visible = true;
                            }
                            else
                            {
                                if (tb_Email.Text.Length < 1)
                                {
                                    lbl_error.Text = "Proporcione un email valido";
                                    lbl_error.BackColor = System.Drawing.Color.LightPink;
                                    lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                                    lbl_error.Visible = true;
                                }
                                else
                                {
                                    if (Convert.ToInt32(DDL_Country.SelectedValue) < 0)
                                    {
                                        lbl_error.Text = "Seleccione un País";
                                        lbl_error.BackColor = System.Drawing.Color.LightPink;
                                        lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                                        lbl_error.Visible = true;
                                    }
                                    else
                                    {
                                        if (Convert.ToInt32(DDL_City.SelectedValue) < 0)
                                        {
                                            lbl_error.Text = "Seleccione una Ciudad";
                                            lbl_error.BackColor = System.Drawing.Color.LightPink;
                                            lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                                            lbl_error.Visible = true;
                                        }
                                        else
                                        {
                                            if (Convert.ToInt32(DDL_State.SelectedValue) < 0)
                                            {
                                                lbl_error.Text = "Seleccione un Estado";
                                                lbl_error.BackColor = System.Drawing.Color.LightPink;
                                                lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                                                lbl_error.Visible = true;
                                            }
                                            else
                                            {
                                                if (tb_RNP.Text.Length < 1)
                                                {
                                                    lbl_error.Text = "Proporcione un numero de RNP valido";
                                                    lbl_error.BackColor = System.Drawing.Color.LightPink;
                                                    lbl_error.ForeColor = System.Drawing.Color.DarkRed;
                                                    lbl_error.Visible = true;
                                                }
                                                else
                                                {
                                                    try
                                                    {
                                                        udf.Get_DataSet_Query(vol.update_volunteer(tb_First_Name.Text, tb_Last_Name.Text, tb_DOB.Text, Convert.ToInt32(rbl_Gender.SelectedValue),
                                                            tb_Cellphone.Text, tb_Email.Text, Convert.ToInt32(DDL_Country.SelectedValue), Convert.ToInt32(DDL_City.SelectedValue), Convert.ToInt32(DDL_State.SelectedValue),
                                                            tb_RNP.Text, Session["idpeople"].ToString()));

                                                        lbl_error.Text = "Muchas Gracias!, El voluntario fue actualizado exitosamente.";
                                                        lbl_error.Visible = true;
                                                        lbl_error.BackColor = System.Drawing.Color.LightGreen;
                                                        lbl_error.ForeColor = System.Drawing.Color.DarkGreen;
                                                        //agregar un mensaje de voluntario actualizado exitosamente
                                                    }
                                                    catch (Exception ex)
                                                    {
                                                        lbl_error.Text = "Ha ocurrido un error: " + ex.Message.ToString();
                                                        lbl_error.Visible = true;
                                                        lbl_error.BackColor = System.Drawing.Color.LightPink;
                                                        lbl_error.ForeColor = System.Drawing.Color.DarkRed;

                                                        throw;
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

            
        }

        protected void bt_Update_Ficha_Medica_Click(object sender, EventArgs e)
        {
            if (tb_Nom_Cobertura_Med.Text.Length < 2)
            {
                lbl_error_ficha.Text = "Proporcione un Nombre de Cobertura Medica valido";
                lbl_error_ficha.BackColor = System.Drawing.Color.LightPink;
                lbl_error_ficha.ForeColor = System.Drawing.Color.DarkRed;
                lbl_error_ficha.Visible = true;
            }
            else
            {
                if (tb_Num_Cobertura_Med.Text.Length < 2)
                {
                    lbl_error_ficha.Text = "Proporcione un Numero de Cobertura Medica valido";
                    lbl_error_ficha.BackColor = System.Drawing.Color.LightPink;
                    lbl_error_ficha.ForeColor = System.Drawing.Color.DarkRed;
                    lbl_error_ficha.Visible = true;
                }
                else
                {
                    if (tb_Nom_Contacto_ER.Text.Length < 2)
                    {
                        lbl_error_ficha.Text = "Proporcione un Nombre de Contacto de Emergencia valido";
                        lbl_error_ficha.BackColor = System.Drawing.Color.LightPink;
                        lbl_error_ficha.ForeColor = System.Drawing.Color.DarkRed;
                        lbl_error_ficha.Visible = true;
                    }
                    else
                    {
                        if (tb_Tel_Contacto_ER.Text.Length < 2)
                        {
                            lbl_error_ficha.Text = "Proporcione un Numero de Contacto de Emergencia valido";
                            lbl_error_ficha.BackColor = System.Drawing.Color.LightPink;
                            lbl_error_ficha.ForeColor = System.Drawing.Color.DarkRed;
                            lbl_error_ficha.Visible = true;
                        }
                        else
                        {
                            if (tb_Rel_Contacto_ER.Text.Length < 2)
                            {
                                lbl_error_ficha.Text = "Proporcione la Relacion del Contacto de Emergencia";
                                lbl_error_ficha.BackColor = System.Drawing.Color.LightPink;
                                lbl_error_ficha.ForeColor = System.Drawing.Color.DarkRed;
                                lbl_error_ficha.Visible = true;
                            }
                            else
                            {
                                if (Convert.ToInt32(DDL_Blood_Type.SelectedValue) < 0)
                                {
                                    lbl_error_ficha.Text = "Proporcione un Tipo de Sangre valido";
                                    lbl_error_ficha.BackColor = System.Drawing.Color.LightPink;
                                    lbl_error_ficha.ForeColor = System.Drawing.Color.DarkRed;
                                    lbl_error_ficha.Visible = true;
                                }
                                else
                                {
                                    try
                                    {
                                        udf.Execute_Non_Query(vol.Update_Volunteer_ER(tb_Nom_Cobertura_Med.Text, tb_Num_Cobertura_Med.Text, tb_Nom_Contacto_ER.Text, tb_Tel_Contacto_ER.Text,
                                            tb_Rel_Contacto_ER.Text, Convert.ToInt32(DDL_Blood_Type.SelectedValue), Session["idpeople"].ToString()));
                                        lbl_error_ficha.Text = "Muchas Gracias!, El voluntario fue actualizado exitósamente.";
                                        lbl_error_ficha.Visible = true;
                                        lbl_error_ficha.BackColor = System.Drawing.Color.LightGreen;
                                        lbl_error_ficha.ForeColor = System.Drawing.Color.DarkGreen;
                                    }
                                    catch (Exception ex)
                                    {
                                        lbl_error_ficha.Text = "Ha ocurrido un error: " + ex.Message.ToString();
                                        lbl_error_ficha.Visible = true;
                                        lbl_error_ficha.BackColor = System.Drawing.Color.LightPink;
                                        lbl_error_ficha.ForeColor = System.Drawing.Color.DarkRed;

                                        throw;
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
