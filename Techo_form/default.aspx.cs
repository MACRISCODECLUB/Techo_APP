﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Techo_form
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string email = Session["email"].ToString();
                string idprofile = Session["idprofile"].ToString();
                string idpeople = Session["idpeople"].ToString();
            }
            catch (Exception ex)
            {

                Response.Redirect("Login.aspx");
            }
            
        }
    }
}