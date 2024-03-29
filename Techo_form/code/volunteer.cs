﻿using System;
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
            q += First_Name + "','" + Last_Name + "','" + DOB + "'," + Id_Gender + ",'" + Cellphone + "','" + Email + "'," +
                 Id_Country + "," + Id_City + "," + Id_State + ",'" + RNP_Number + "');";
            q += "SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]";


            return q;
        }

        internal string get_volunteer_info_by_Id(string Id_Vol)
        {
            string q = "";
            q += "Select * from PEOPLE where Id_People = " + Id_Vol;

            return q;
        }

        internal string get_user_info_by_iduser(string iduser)
        {
            string q = "";
            q += "Select * from USERS where Id_User = " + iduser;

            return q;
        }

        internal string get_gender_by_Id_Gender(string Id_Gender)
        {
            string q = "";
            q += "Select * from GENDER where Id_Gender =" + Id_Gender;

            return q;
        }

        internal string get_all_genders()
        {
            string q = "";
            q += "Select * from GENDER";

            return q;
        }

        internal string get_country_by_Id_Country(string Id_Country)
        {
            string q = "";
            q += "Select * from COUNTRIES where Id_Country = " + Id_Country;

            return q;
        }

        internal string get_city_by_Id_City(string Id_City)
        {
            string q = "";
            q += "Select * from CITIES where Id_City = " + Id_City;

            return q;
        }

        internal string get_UserBy_username_password(string username, string password)
        {
            string q = "";
            q += "Select * from USERS where username = '" + username + "' AND ";
            q += " password = '" + password + "'";

            return q;
        }

        internal string get_country_by_Id_State(string Id_State)
        {
            string q = "";
            q += "Select * from STATES where Id_State = " + Id_State;

            return q;
        }
        internal string update_volunteer(string First_Name, string Last_Name, string DOB,
            int Id_Gender, string Cellphone, string Email, int Id_Country, int Id_City, int Id_State,
            string RNP_Number, string Id_Vol)
        {
            string q = "";
            q += " UPDATE [PEOPLE] ";
            q += " SET[FirstName] = '" + First_Name + "'";
            q += ",[LastName] = '" + Last_Name + "'";
            q += ",[DOB] = '" + DOB + "'";
            q += ",[Id_Gender] = " + Id_Gender;
            q += ",[Cellphone] = '" + Cellphone + "'";
            q += ",[Email] = '" + Email + "'";
            q += ",[Id_Country] = " + Id_Country;
            q += ",[Id_City] = " + Id_City;
            q += ",[Id_State] = " + Id_State;
            q += ",[RNP_Number] = '" + RNP_Number + "'";
            q += " WHERE [Id_People] = " + Id_Vol;

            return q;
        }

        internal string Get_People_By_Id_User(string iduser)
        {
            string q = "";
            q += "Select * from PEOPLE where Id_User = " + iduser;

            return q;
        }

        internal string Insert_into_user(string username, string password, int Id_Profile, int Confirmation_Number)
        {
            string q = "";
            q += "INSERT INTO [USERS] ";
            q += " ([username] ";
            q += " ,[password] ";
            q += " ,[Id_Profile] ";
            q += ",[Confirmation_Number])";
            q += " VALUES ";
            q += " ( '" + username + "' , '" + password + "', " + Id_Profile + ", " + Confirmation_Number + "); ";
            q += "SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]";

            return q;
        }

        internal string Update_Id_People(int Id_User, int Id_People)
        {
            string q = "";
            q += " UPDATE[PEOPLE] ";
            q += "SET[Id_User] = " + Id_User;
            q += "WHERE Id_People = " + Id_People;

            return q;
        }

        internal string Compare_cn_and_e_with_db(string email, int conf_number)
        {
            string q = "";
            q += "SELECT * FROM USERS WHERE username = '" + email + "'";
            q += "and Confirmation_Number = " + conf_number;

            return q;
        }

        internal string Update_Verification_Users(string Verified, string email, int conf_number)
        {
            string q = "";
            q += "UPDATE [USERS] "; 
            q += "SET [Verified] = " + 1;
            q += "WHERE username = '" + email + "'";
            q += "and Confirmation_Number = " + conf_number;

            return q;
        }

        internal string Update_Profile_Users(string idprofile, string iduser)
        {
            string q = "";
            q += "UPDATE [USERS] ";
            q += "SET Id_Profile = " + idprofile;
            q += " WHERE Id_User = " + iduser;
            return q;
        }

        internal string Update_Volunteer_ER(string Nom_Cobertura_Med, string Num_Cobertura_Med, string Nom_Contacto_ER, string Tel_Contacto_ER,
            string Rel_Contacto_ER, int Id_Blood_Type, string Id_Vol)
        {
            string q = "";
            q += "UPDATE [PEOPLE]";
            q += "SET[Nom_Cobertura_Med] = '" + Nom_Cobertura_Med + "'";
            q += ",[Num_Cobertura_Med] = '" + Num_Cobertura_Med + "'";
            q += ",[Nom_Contacto_ER] = '" + Nom_Contacto_ER + "'";
            q += ",[Tel_Contacto__ER] = '" + Tel_Contacto_ER + "'";
            q += ",[Rel_Contacto_ER] = '" + Rel_Contacto_ER + "'";
            q += ",[Id_Blood_Type] = " + Id_Blood_Type;
            q += " WHERE [Id_People] = " + Id_Vol;

            return q;
        }

        internal string update_iduser_into_idpeople(string iduser, string idpeople)
        {
            string q = "";
            q += "UPDATE [PEOPLE]";
            q += " SET Id_User = " + iduser;
            q += " WHERE [Id_People] = " + idpeople;

            return q;
        }

        internal string get_volunteer_by_city(int City)
        {
            string q = "";
            q += "SELECT City_Name FROM CITIES";
            q += "WHERE Id_City = " + City;

            return q;
        }
    }
}