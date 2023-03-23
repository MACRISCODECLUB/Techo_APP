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

        internal string Insert_New_Volunteer(string First_Name, string Last_Name, string DOB,
            int Id_Gender, string Cellphone, string Email, int Id_Country, int Id_City, int Id_State,
            string RNP_Number)
        {
                string q = "";

                q += "INSERT INTO PEOPLE( FirstName, LastName, DOB, Id_Gender, Cellphone, Email, " +
                     "Id_Country, Id_City, Id_State, RNP_Number) Values('";
                q += First_Name + "','" + Last_Name + "','" + DOB + "'," + Id_Gender + ",'" + Cellphone + "','" + Email + "',"+ 
                     Id_Country + "," + Id_City + "," + Id_State + ",'" + RNP_Number + "');";
                q += "SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]";


            return q;
        }

        
    }
}