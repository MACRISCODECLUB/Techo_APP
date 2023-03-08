using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Techo_form.code
{
    public class volunteer
    {
        internal string Get_All_Volunteer()
        {
            string q = "";
            q += "SELECT * FROM VOLUNTEER";
            q += " ORDER BY Starts DESC";

            return q;
        }

        internal string Insert_New_Volunteer(int Id_People, string First_Name, string Last_Name, string DOB,
            int Id_Gender, string Cellpone, string Email, string Address, int Id_Country, int Id_City, int Id_State,
            int Id_User, string RNP_Number, string Nom_Cobertura_Med, string Num_Cobertura_Med, string Nom_Contacto_ER,
            string Tel_Contacto_ER, string Rel_Contacto_ER, int Id_Blood_Type)
        {
                string q = "";

                q += "INSERT INTO VOLUNTEER";
                q += "";

                return q;
        }
    }
}