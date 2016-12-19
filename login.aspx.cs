﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        msg.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        msg.Visible = true;
        try{
                UserLogin ul = new UserLogin();
                DataTable dt = ul.CheckUsers(username.Text, password.Text);
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow rows in dt.Rows)
                    {
                        Session["username"] = username.Text;
                        Session["password"] = password.Text;
                        
                            Response.Redirect("franchiser.aspx");
                        
                    }
                }
                else
                {
                    msg.Text = "invalid username or password";
                    msg.ForeColor = Color.Red;
                }
           }
        catch (Exception ex)
        {
            ltrmsg.Text = ex.Message;

        }
    }

    
}