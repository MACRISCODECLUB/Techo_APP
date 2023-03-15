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
                }
            else
            {

            }

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
                //TODO Fix output error form.
                lbl_output_Form.Text = "Error al ingresar la actividad, " +
                    "revise la informacion ingresa y vuelva a intentar. Error: " +
                    ex.Message.ToString();
                lbl_output_Form.BackColor = System.Drawing.Color.Red;
                lbl_output_Form.ForeColor= System.Drawing.Color.DarkRed;
                lbl_output_Form.Visible = true;
            }
        }
    }
}