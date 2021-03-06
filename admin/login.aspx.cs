﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

public partial class admin_login : System.Web.UI.Page
{
    dbConnection db = new dbConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        msg.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        msg.Visible = true;
        try
        {
            AdminLogin al = new AdminLogin();
            db.dt = al.CheckAdmin(username.Text, password.Text);

            if (db.dt.Rows.Count > 0)
            {
               
                    Session["usernames"] = username.Text;
                    Session["password"] = password.Text;
                    Session["roles"] = db.dt.Rows[0]["role"].ToString();
                    Response.Redirect("index.aspx");
                
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