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
                tb_First_Name.Text = Request.QueryString["idv"].ToString();
                get_volunteer_info_by_Id(Request.QueryString["idv"].ToString());
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
            }
        }

        protected void bt_Update_Click(object sender, EventArgs e)
        {
            //validacion de datos

            if (tb_First_Name.Text.Length < 2)
            {
                lbl_mensaje.Text = "Proporcione un nombre valido";
                lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                lbl_mensaje.Visible = true;
            }
            else
            {
                if (tb_Last_Name.Text.Length < 2)
                {
                    lbl_mensaje.Text = "Proporcione un apellido valido";
                    lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                    lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                    lbl_mensaje.Visible = true;
                }
                else
                {
                    if (tb_DOB.Text.Length < 1)
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
                                                if (tb_RNP.Text.Length < 1)
                                                {
                                                    lbl_mensaje.Text = "Proporcione un numero de RNP valido";
                                                    lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                                                    lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;
                                                    lbl_mensaje.Visible = true;
                                                }
                                                else
                                                {
                                                    try
                                                    {
                                                        udf.Execute_Non_Query(vol.update_volunteer(tb_First_Name.Text, tb_Last_Name.Text, tb_DOB.Text, Convert.ToInt32(rbl_Gender.SelectedValue),
                                                            tb_Cellphone.Text, tb_Email.Text, Convert.ToInt32(DDL_Country.SelectedValue), Convert.ToInt32(DDL_City.SelectedValue), Convert.ToInt32(DDL_State.SelectedValue),
                                                            tb_RNP.Text, Request.QueryString["idv"].ToString()));

                                                        lbl_mensaje.Text = "Muchas Gracias!, El voluntario fue actualizado exitosamente.";
                                                        lbl_mensaje.Visible = true;
                                                        lbl_mensaje.BackColor = System.Drawing.Color.LightGreen;
                                                        lbl_mensaje.ForeColor = System.Drawing.Color.DarkGreen;
                                                        //agregar un mensaje de voluntario actualizado exitosamente
                                                    }
                                                    catch (Exception ex)
                                                    {
                                                        lbl_mensaje.Text = "Ha ocurrido un error: " + ex.Message.ToString();
                                                        lbl_mensaje.Visible = true;
                                                        lbl_mensaje.BackColor = System.Drawing.Color.LightPink;
                                                        lbl_mensaje.ForeColor = System.Drawing.Color.DarkRed;

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
    }
}   
