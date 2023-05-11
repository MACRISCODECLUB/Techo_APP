using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Techo_form.App_Start;
using Techo_form.code;

namespace Techo_form.Account
{
    public partial class register : System.Web.UI.Page
    {
        code.udf udf = new udf();
        code.volunteer vol = new volunteer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_Voluntarios_People.DataBind();
                ddl_Perfiles.DataBind();
                Set_Perfil_By_Voluntario(ddl_Voluntarios_People.SelectedValue.ToString());
            }

            
        }

        private void Set_Perfil_By_Voluntario(string iduser)
        {
            string idperfilvoluntario = Get_IdPerfil_Voluntario(iduser);
            ddl_Perfiles.SelectedValue = idperfilvoluntario;

        }

        private string Get_IdPerfil_Voluntario(string iduser)
        {
            DataTable dt = new DataTable();
            string idperfil = "";
            dt = udf.Get_DataSet_Query(vol.get_user_info_by_iduser(iduser)).Tables[0];
            foreach (DataRow r in dt.Rows)
            {
                idperfil = r["Id_Profile"].ToString();
            }
            return idperfil;
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            
        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            //update idprofile in user
            udf.Execute_Non_Query(vol.Update_Profile_Users(
                ddl_Perfiles.SelectedValue.ToString()
                , ddl_Voluntarios_People.SelectedValue.ToString()));
        }

        protected void ddl_Voluntarios_People_SelectedIndexChanged(object sender, EventArgs e)
        {
            Set_Perfil_By_Voluntario(ddl_Voluntarios_People.SelectedValue.ToString());
        }
    }
}