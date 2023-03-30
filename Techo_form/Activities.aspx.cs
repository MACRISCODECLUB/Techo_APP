using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace Techo_form
{
    public partial class actividades : System.Web.UI.Page
    {
        Techo_form.code.udf udf = new code.udf();
        Techo_form.code.activity activity = new code.activity();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    Get_Actividad_Info(Request.QueryString["I"].ToString());
                }
                catch (Exception ex)
                {

                 
                }
                
            } 
        }

        private void Get_Actividad_Info(string Idactividad)
        {
            DataTable dt_Coordinators = new DataTable();
            DataTable dt_Actividad = new DataTable();
            DataTable dt_City = new DataTable();
            DataTable dt_Country = new DataTable();
            DataTable dt_State = new DataTable();
            DataTable dt_office = new DataTable();
            dt_Actividad = udf.Get_DataSet_Query(activity.GetActivitybyId(Idactividad)).Tables[0];
            string Id_City = "";
            dt_Coordinators = udf.Get_DataSet_Query(activity.GetCoordinatorbyId(Idactividad)).Tables[0];
            string Id_State = "";
            string Id_Coordinator = "";
            dt_Country = udf.Get_DataSet_Query(activity.GetCountryById()).Tables[0];

            dt_office = udf.Get_DataSet_Query(activity.GetOfficebyId(Idactividad)).Tables[0];
            foreach (DataRow o in dt_office.Rows)
            {
                ddl_officeactiv.DataBind();
                //ddl_officeactiv.ClearSelection();
                string val = o["Id_Office"].ToString();
                ddl_officeactiv.SelectedValue = val;
                //ddl_officeactiv.Items.FindByText(val).Selected = true;
            }

            Boolean Visibility;
            string VisibilityValue;
            Boolean Status;
            string StatusValue;
            string StartDate = "";
            string EndDate = "";
            string Capacity = "";
            Boolean AdminConfirm = false;
            string AdminConfirmValue;

            foreach (DataRow r in dt_Actividad.Rows)
            {
                tb_nameactiv.Text = r["Activ_Name"].ToString();
                tb_Workhours.Text = r["Work_Hours"].ToString();
                Id_City = r["Id_City"].ToString();
                dt_City = udf.Get_DataSet_Query(activity.GetCitybyId(Id_City)).Tables[0];
                Id_State = r["Id_State"].ToString();
                dt_State = udf.Get_DataSet_Query(activity.GetStatebyId(Id_State)).Tables[0];
                Id_Coordinator = r["Id_Coordinator"].ToString();
                dt_Coordinators = udf.Get_DataSet_Query(activity.GetCoordinatorbyId(Id_Coordinator)).Tables[0];
                Visibility = Convert.ToBoolean(r["Visibility"].ToString());
                Status = Convert.ToBoolean(r["Status"].ToString());
                StartDate = Convert.ToString(r["StartF"]);
                EndDate = Convert.ToString(r["EndF"]);
                Capacity = Convert.ToString(r["capacityactiv"]);
                
                tb_startdate.Text = StartDate;
                tb_enddate.Text = EndDate;
                DescriptionActiv.Text = (r["descripactiv"]).ToString();
                tb_capacityactiv.Text = Capacity;

                //Todo get booleans with functions
                //Visibility function, convert boolean to string
                if (Visibility == true)
                {
                    VisibilityValue = "1";
                }
                else
                {
                    VisibilityValue = "2";
                }

                //Status function, convert boolean to string
                if (Status == true)
                {
                    StatusValue = "1";
                }
                else
                {
                    StatusValue = "2";
                }

                //Admin confirm function, Convert boolean to Yes or No
                if (AdminConfirm == true)
                {
                    AdminConfirmValue = "0";
                }
                else
                {
                    AdminConfirmValue = "1";
                }
                ddl_adminconfirm.DataBind();
                ddl_adminconfirm.Items.FindByValue((AdminConfirmValue).ToString()).Selected = true;
                ddl_status.DataBind();
                ddl_status.Items.FindByValue(StatusValue).Selected = true;
                ddl_visibility.DataBind();
                ddl_visibility.Items.FindByValue(VisibilityValue).Selected = true;


                foreach (DataRow c in dt_Country.Rows)
                {
                    ddl_CountryActiv.DataBind();
                    ddl_CountryActiv.Items.FindByValue(c["Id_Country"].ToString()).Selected = true;                    

                   
                }

                foreach (DataRow s in dt_State.Rows)
                {
                    ddl_StateActiv.DataBind();
                    ddl_StateActiv.Items.FindByValue(s["Id_State"].ToString()).Selected = true;


                }

                foreach (DataRow t in dt_City.Rows)
                {
                    ddl_Cityactiv.DataBind();
                    ddl_Cityactiv.Items.FindByValue(t["Id_City"].ToString()).Selected = true;


                }

                foreach (DataRow CORD in dt_Coordinators.Rows)
                {
                    ddl_Coordinatoractiv.DataBind();
                    ddl_Coordinatoractiv.Items.FindByValue(CORD["Id_People"].ToString()).Selected = true;
                    
                }

                

            }
        }

        protected void ddl_CategoryActiv_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_ActivityType.DataBind();
        }

        protected void ddl_CountryActiv_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_StateActiv.Items.Clear();
            ddl_StateActiv.DataBind();
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            //Data validation start
            if (udf.FormatDateToDate(tb_startdate.Text) < DateTime.Now)
                {
                lbl_output_Form.Text = "Fecha de Inicio invalida, de momento no es posible viajar en el tiempo";
                lbl_output_Form.BackColor = System.Drawing.Color.LightPink;
                lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                lbl_output_Form.Visible = true;
                }
            else
            {
                //Check if End Date is less than current time, and if the end date is set before the start date
                if (udf.FormatDateToDate(tb_enddate.Text) < DateTime.Now && udf.FormatDateToDate(tb_enddate.Text) < udf.FormatDateToDate(tb_startdate.Text))
                {
                lbl_output_Form.Text = "Fecha de Finalizacion invalida.";
                lbl_output_Form.BackColor = System.Drawing.Color.LightPink;
                lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                lbl_output_Form.Visible = true;
                }
                else
                {
                    if (tb_nameactiv.Text.Length < 4)
                    {
                    lbl_output_Form.Text = "Las actividades requieren de al menos 4 caracteres en su nombre.";
                    lbl_output_Form.BackColor = System.Drawing.Color.LightPink;
                    lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                    lbl_output_Form.Visible = true;
                    }
                    else
                    {
                        if (Convert.ToDouble(tb_Workhours.Text) <= 0.00)
                        {
                            lbl_output_Form.Text = "No se puede ingresar 0, o menos horas de trabajo.";
                            lbl_output_Form.BackColor = System.Drawing.Color.LightPink;
                            lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                            lbl_output_Form.Visible = true;
                        }
                        else
                        {
                            if ((this.DescriptionActiv.Text.Length > 0) && (this.DescriptionActiv.Text.Length < 5))
                            {
                            lbl_output_Form.Text = "La descripcion de las actividades requieren al menos 5 caracteres.";
                            lbl_output_Form.BackColor = System.Drawing.Color.LightPink;
                            lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                            lbl_output_Form.Visible = true;
                            }
                            else
                            {
                                if(Convert.ToInt32(ddl_ActivityType.SelectedValue) == -1)
                                {
                                lbl_output_Form.Text = "Escoja un tipo de actividad, si la actividad que usted gusta ingresar contacte a soporte tecnico o ponga Otros.";
                                lbl_output_Form.BackColor = System.Drawing.Color.LightPink;
                                lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                                lbl_output_Form.Visible = true;
                                }
                                else
                                {
                                    if(Convert.ToInt32(ddl_CountryActiv.SelectedValue) == -1)
                                    {
                                    lbl_output_Form.Text = "Escoga un pais valido para la actividad";
                                    lbl_output_Form.BackColor = System.Drawing.Color.LightPink;
                                    lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                                    lbl_output_Form.Visible = true;
                                    }
                                    else
                                    {
                                        if(Convert.ToInt32(ddl_status.SelectedValue) == -1)
                                        {
                                        lbl_output_Form.Text = "Escoga el estado de la actividad.";
                                        lbl_output_Form.BackColor = System.Drawing.Color.LightPink;
                                        lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                                        lbl_output_Form.Visible = true;
                                        }
                                        else
                                        {
                                            if(Convert.ToInt32(ddl_status.SelectedValue) == -1)
                                            {
                                            lbl_output_Form.Text = "Escoga la visibilidad la actividad.";
                                            lbl_output_Form.BackColor = System.Drawing.Color.LightPink;
                                            lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                                            lbl_output_Form.Visible = true;
                                            }
                                            else
                                            {
                                                if(Convert.ToDouble(tb_capacityactiv.Text) <= 0)
                                                {
                                                lbl_output_Form.Text = "Los cupos de la actividad no pueden ser iguales o menores que 0. Valor Predeterminado = Sin Limite";
                                                lbl_output_Form.BackColor = System.Drawing.Color.LightPink;
                                                lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                                                lbl_output_Form.Visible = true;    
                                                }
                                                else
                                                {
                                                    if (!(int.TryParse(tb_capacityactiv.Text, out int value)))
                                                    {
                                                        lbl_output_Form.Text = "No se aceptan decimales en los cupos de la actividad";
                                                        lbl_output_Form.BackColor = System.Drawing.Color.LightPink;
                                                        lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                                                        lbl_output_Form.Visible = true;
                                                    }

                                                    else
                                                    {
                                                        try
                                                        {
                                                            udf.Execute_Non_Query(activity.Insert_New_Activity(tb_nameactiv.Text, Convert.ToInt32(ddl_Cityactiv.SelectedItem.Value)
                                                                , Convert.ToInt32(ddl_Coordinatoractiv.Text), Convert.ToDouble(tb_Workhours.Text), DescriptionActiv.Text
                                                                , udf.convertBooleansdeBit(ddl_visibility.Text), udf.convertBooleansdeBit(ddl_status.Text), udf.FormatDate(udf.FormatDateToDate(tb_startdate.Text)), udf.FormatDate(udf.FormatDateToDate(tb_enddate.Text))
                                                                , Convert.ToInt32(tb_capacityactiv.Text), udf.convertBooleansdeBit(ddl_adminconfirm.Text), Convert.ToInt32(ddl_officeactiv.SelectedItem.Value)));
                                                            lbl_output_Form.Text = "La actividad fue creada satisfactoriamente";
                                                            lbl_output_Form.BackColor = System.Drawing.Color.LightGreen;
                                                            lbl_output_Form.ForeColor = System.Drawing.Color.DarkGreen;
                                                            lbl_output_Form.Visible = true;
                                                        }
                                                        catch (Exception ex)
                                                        {
                                                            lbl_output_Form.Text = "Error al ingresar la actividad, " +
                                                                "revise la informacion ingresa y vuelva a intentar. Error: " +
                                                                ex.Message.ToString();
                                                            lbl_output_Form.BackColor = System.Drawing.Color.Red;
                                                            lbl_output_Form.ForeColor = System.Drawing.Color.DarkRed;
                                                            lbl_output_Form.Visible = true;
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
    }
