using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techo_form
{
    public partial class Login : System.Web.UI.Page
    {

        code.udf udf = new code.udf();
        code.volunteer vol = new code.volunteer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_login_Click(object sender, EventArgs e)
        {
            switch (tb_Username.Text)
            {
                case "rhasbun@macrisschool.org": 
                    Session["profileId"] = 4;
                    Session["email"] = tb_Username.Text;
                    break;
                case "marcoestebanfigueroa@macrisschool.org":
                    Session["profileId"] = 4;
                    Session["email"] = tb_Username.Text;
                    break;
                case "ramonhasbun@gmail.com":
                    Session["profileId"] = 4;
                    Session["email"] = tb_Username.Text;
                    break;
                //case "ramonhasbun@gmail.com":
                //    Session["profileId"] = 4;
                //    break;
                case "marcoefigueroa042@gmail.com":
                    Session["profileId"] = 1;
                    Session["email"] = tb_Username.Text;
                    break;
                case "alfreddavidaguero@macrisschool.org":
                    Session["profileId"] = 1;
                    Session["email"] = tb_Username.Text;
                    break;
                default:
                    break;
                    
            }
            do_login(tb_Username.Text, tb_Password.Text);
            //Response.Redirect("default.aspx");
        }

        private void do_login(string username, string password)
        {
            //bool exists = false;
            findUser_username_password(username, password);

        }

        private void findUser_username_password(string username, string password)
        {
            DataTable dt = new DataTable();
            dt = udf.Get_DataSet_Query(vol.get_UserBy_username_password(username, password)).Tables[0];
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow r in dt.Rows)
                {
                    //session variables: clear
                    Session.Clear();
                    //session variables: create new session (email, idprofile, idpeople)
                    Session["email"] = username;
                    Session["idprofile"] = r["Id_Profile"].ToString();
                    Session["idpeople"] = Get_People_By_IdUser(r["Id_User"].ToString());
                    Session["profileId"] = r["Id_Profile"].ToString();
                    Response.Redirect("default.aspx");
                    //manage nav menu
                }
                //login response redirect to default
            }
            else
            {
                //error usuario o contraseña inválida
            }
        }

        private string Get_People_By_IdUser(string iduser)
        {
            string idpeople = "";

            DataTable dt = new DataTable();
            dt = udf.Get_DataSet_Query(vol.Get_People_By_Id_User(iduser)).Tables[0];
            foreach (DataRow r in dt.Rows)
            {
                idpeople = r["Id_People"].ToString();
            }
            return idpeople;
        }

    }
}