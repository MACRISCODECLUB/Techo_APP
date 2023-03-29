﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Techo_form.code
{
    public class activity
    {
        internal string Get_All_Activities()
        {
            string q = "";
            q += "SELECT * FROM ACTIVITIES";
            q += " ORDER BY Starts DESC";

            return q;
        }
        internal string Insert_New_Activity(string Activ_Name, int Id_City, int Id_Coordinator,
            double Work_Hours, string descripactiv, Boolean Visibility, Boolean Status,
            string Starts, string Ends, int capacityactiv, Boolean adminconfirm, int Id_Office)
        {
            string q = "";

            q += "INSERT INTO ACTIVITIES(Activ_Name, Id_City, Id_Coordinator, Work_Hours, descripactiv, ";
            q += "Visibility, Status, Starts, Ends, capacityactiv, adminconfirm, Id_Office) VALUES('";
            q += Activ_Name + "', " + Id_City + ", " + Id_Coordinator + ", " + Work_Hours + ", '" + descripactiv + "', '" + Visibility + "', '"
            + Status + "', '" + Starts + "', '" + Ends + "', " + capacityactiv + ", '" + adminconfirm + "', " + Id_Office + ") ";
            q += "SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]";

            //Mandar correos electronicos en la creacion de la actividad

            return q;
        }

        internal string GetActivitybyId(string idactividad)
        {
            string q = "";
            q += "SELECT *,CONVERT(varchar(10),Starts,111) AS StartF,";
            q += "CONVERT(varchar(10),Ends,111) AS EndF, Id_State FROM ACTIVITIES a ";
            q += "INNER JOIN CITIES c on c.Id_City = a.Id_City ";
            q += "WHERE [Id_Activity] = " + idactividad;

            return q;
        }

        internal string GetCitybyId(string IdCity)
        {
            string q = "";
            q += "SELECT * FROM CITIES";
            q += " WHERE [Id_City] = " + IdCity;

            return q;
        }

        internal string GetCoordinatorbyId(string IdUser)
        {
            string q = "";
            //TODO FINISH COORDINATOR LABEL
            q += "SELECT * FROM USERS u ";
            q += "INNER JOIN PEOPLE p on p.Id_User = u.Id_User ";
            q += "WHERE u.Id_User =  " + IdUser;
            q += "ORDER BY FirstName ASC, LastName ASC";

            return q;

        }

        internal string GetCountryById()
        {
            string q = "";
            q += "Select * FROM COUNTRIES";
            return q;
        }

        internal string GetStatebyId(string IdState)
        {
            string q = "";
            q += "Select * FROM STATES ";
            q += "WHERE [Id_State] =" + IdState;
            return q;
        }   
    }

        
}