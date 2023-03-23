using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Techo_form.code
{
    public class udf
    {
        //Fields
        private SqlConnection str_Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CODECLUBConnectionString"].ToString());

        //METHODS
        public DataSet Get_DataSet_Query(string str_Query)
        {
            SqlDataAdapter dta_Table = new SqlDataAdapter();
            DataSet dts_Table = new DataSet();
            SqlCommand cmm_Configurable = new SqlCommand(str_Query, str_Conn);
            cmm_Configurable.CommandTimeout = 0;
            cmm_Configurable.CommandType = CommandType.Text;
            try
            {
                dta_Table.SelectCommand = cmm_Configurable;
                dta_Table.Fill(dts_Table);
            }
            catch (Exception)
            {

                throw;
            }
            str_Conn.Close();
            return dts_Table;
        }

        public void Execute_Non_Query(string str_Query)
        {
            SqlCommand cmm_Configurable = new SqlCommand(str_Query, str_Conn);
            cmm_Configurable.CommandTimeout = 60;
            str_Conn.Open();
            cmm_Configurable.ExecuteNonQuery();
            str_Conn.Close();
        }

        public string FormatDate(DateTime dtm_Fecha)
        {
            string myYear = dtm_Fecha.Year.ToString();
            string myMonth = dtm_Fecha.Month.ToString();
            string myDay = dtm_Fecha.Day.ToString();
            
            if (myMonth.Length == 1)
            {
                myMonth = "0" + myMonth;
            }

            if(myDay.Length == 1)
            {
                myDay = "0" + myDay;
            }

            return myYear + myMonth + myDay;
        }

        internal DateTime FormatDateToDate(string InitialDate)
        {
            return Convert.ToDateTime(InitialDate);
        }

        public bool convertBooleansdeBit(string booleano)
        {
            if(booleano == "1")
            {
                return true;
            }else
            {
                return false;
            }
        }

    }
}