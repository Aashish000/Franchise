﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

public partial class applyfranchise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //userid.Visible = false;

        dbConnection db = new dbConnection();
        if (!Page.IsPostBack)
        {
            msg.Visible = false;
            franchise_id.Visible = false;
            franchiseid.Visible = false;
            userid.Visible = false;
            if (Session["username"] != null)
            {
                if (Session["role"] == "investor")
                {
                    string query = "select* from users where username ='" + Session["username"] + "'";
                            db.cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
                            db.openConnection();
                            db.dr = db.cmd.ExecuteReader();
                            while (db.dr.Read())
                            {
                                //int id = Convert.ToInt32(db.dr[0].ToString());
                                userid.Text = db.dr["id"].ToString();

                            }
                            db.closeConnection();
                }
            }

            if (Request.QueryString["id"] != null)
            {

                string data = "SELECT * FROM franchise where id=" + Request.QueryString["id"];
                SqlDataAdapter da = new SqlDataAdapter(data, db.con);
                DataSet ds = new DataSet();
                da.Fill(ds, "franchise123");
                DataTable dt = ds.Tables[0];
                DataRow dr = dt.Rows[0];

                franchiseid.Text = dr["id"].ToString();
                
            }
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Application app = new Application();

        app.applyFranchise(name.Text, email.Text, country.Text, city.Text, address.Text, occupation.Text, education_qualification.Text, int.Parse(franchiseid.Text), int.Parse(userid.Text));
        msg.Visible = true;
        msg.Text = "Application Submitted successfully";
        msg.ForeColor = Color.Green;
    }
}