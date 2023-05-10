using System;
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
            string Starts, string Ends, int capacityactiv, Boolean adminconfirm, int Id_Office, double Cost)
        {
            string q = "";

            q += "INSERT INTO ACTIVITIES(Activ_Name, Id_City, Id_Coordinator, Work_Hours, descripactiv, ";
            q += "Visibility, Status, Starts, Ends, capacityactiv, adminconfirm, Id_Office, Cost) VALUES('";
            q += Activ_Name + "', " + Id_City + ", " + Id_Coordinator + ", " + Work_Hours + ", '" + descripactiv + "', '" + Visibility + "', '"
            + Status + "', '" + Starts + "', '" + Ends + "', " + capacityactiv + ", '" + adminconfirm + "', " + Id_Office + ", " + Cost + ") ";
            q += "SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]";


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
            q += "SELECT * FROM USERS u ";
            q += "INNER JOIN PEOPLE p on p.Id_User = u.Id_User ";
            q += "WHERE u.Id_User = ";
            q += IdUser + " ORDER BY FirstName ASC, LastName ASC";

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
        
        internal string GetOfficebyId(string IdActivity)
        {
            string q = "";
            q += "SELECT Id_Office FROM ACTIVITIES ";
            q += "WHERE [Id_Activity] = ";
            q += IdActivity;

            return q;
        }

        internal string UpdateActivity(string Activ_Name, int Id_City, int Id_Coordinator,
            double Work_Hours, string descripactiv, Boolean Visibility, Boolean Status,
            string Starts, string Ends, int capacityactiv, Boolean adminconfirm, int Id_Office, double Cost, string IdActividad)
        {
            string q = "";
            q += "UPDATE [ACTIVITIES] ";
            q += "SET [Activ_Name] = '" + Activ_Name + "'";
            q += " ,[Id_City] = " + Id_City;
            q += " ,[Id_Coordinator] = " + Id_Coordinator;
            q += " ,[Work_Hours] = " + Work_Hours;
            q += " ,[descripactiv] = '" + descripactiv + "'";
            q += " ,[Visibility] = '" + Visibility + "'";
            q += " ,[Status] = '" + Status + "'";
            q += " ,[Starts] = '" + Starts + "'";
            q += " ,[Ends] = '" + Ends + "'";
            q += " ,[capacityactiv] = " + capacityactiv;
            q += " ,[adminconfirm] = '" + adminconfirm + "'";
            q += " ,[Id_Office] = " + Id_Office;
            q += " ,[Cost] = " + Cost;
            q += " WHERE [Id_Activity] = " + IdActividad;


            return q;
        }

        internal string Insert_Vol_into_Activ(int Id_Activity, int Id_People, double Total_Hours)
        {
            string q = "";
            q += "INSERT INTO VOLUNTEERS_IN_ACTIVITIES(Id_Activity, Id_People, Total_Hours) Values(";
            q += Id_Activity + ", " + Id_People + ", " + Total_Hours + ") ";

            return q;
        }
 
        internal string Insert_Vol_into_Roster(int Id_Activity, int Id_People)
        {
            string q = "";
            q += "INSERT INTO ROSTER(Id_Activity, Id_People) Values(";
            q += Id_Activity + ", " + Id_People + ") ";

            return q;
        }

        internal string Get_Activities_by_Date(DateTime StartFilter, DateTime EndFilter)
        {
            string q = "";
            q += "SELECT * FROM ACTIVITIES";
            q += " " + "WHERE [STARTS] BETWEEN";
            q += " " + "'" + StartFilter + "'" + " " + "AND" + " " + "'" + EndFilter + "'";
            return q;
        }
    }

        
}