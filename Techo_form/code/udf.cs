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
            SqlCommand cmm_Configarable = new SqlCommand(str_Query, str_Conn);
            cmm_Configarable.CommandTimeout = 0;
            cmm_Configarable.CommandType = CommandType.Text;
            try
            {
                dta_Table.SelectCommand = cmm_Configarable;
                dta_Table.Fill(dts_Table);
            }
            catch (Exception)
            {

                throw;
            }
            str_Conn.Close();
            return dts_Table;
        }

        public void Execue_Non_Query(string str_Query)
        {
            SqlCommand cmm_Configurable = new SqlCommand(str_Query, str_Conn);
            cmm_Configurable.CommandTimeout = 60;
            str_Conn.Open();
            cmm_Configurable.ExecuteNonQuery();
            str_Conn.Close();
        }
    }
}