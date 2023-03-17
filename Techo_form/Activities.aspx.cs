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
            //TODO hacer las validaciones del caso.
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
                                                                , Convert.ToInt32(tb_capacityactiv.Text), udf.convertBooleansdeBit(ddl_adminconfirm.Text)));
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
