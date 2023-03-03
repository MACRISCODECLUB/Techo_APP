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
    }
}