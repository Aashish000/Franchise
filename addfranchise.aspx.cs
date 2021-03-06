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
public partial class admin_AddFranchise : System.Web.UI.Page
{
    dbConnection db = new dbConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        msg.Visible = false;
        userid.Visible = false;
        if (!IsPostBack)
        {
            description.Attributes.Add("maxlength", description.MaxLength.ToString());

            AddFranchise cat = new AddFranchise();
            db.dt = cat.showCategory();
            category.DataSource = db.dt;
            category.DataTextField = ("name");
            category.DataValueField = ("id");
            category.DataBind();


            if (Session["username"] != null)
            {
                if (Session["role"] == "franchiser")
                {
                    string query = "select* from users where username ='" + Session["username"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(query, db.con);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "user123");
                    DataTable dt = ds.Tables[0];
                    DataRow dr = dt.Rows[0];

                    userid.Text = dr["id"].ToString();
                }
            }

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string data = "select franchise_name from franchise where franchise_name='" + franchise_name.Text + "'";
        db.cmd = new SqlCommand(data, db.con);
        db.openConnection();
        db.dr = db.cmd.ExecuteReader();
        if (db.dr.Read())
        {

            msg.Visible = true;
            msg.Text = "username already exists";
            msg.ForeColor = Color.Red;
        }
        else
        {

            
            if (logo.HasFile)
            {
                string str = logo.FileName;
                string fileExtension = Path.GetExtension(str);
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    logo.PostedFile.SaveAs(Server.MapPath(".") + "//uploads//" + str);
                    String path = "~//uploads//" + str.ToString();
                    AddFranchise createfranchise = new AddFranchise();
                    int catid = Convert.ToInt32(category.Text);
                    createfranchise.addFranchises(franchise_name.Text, description.Text, email.Text, logo.FileName, established_date.Text, started_date.Text, concept.Text, int.Parse(investment_required.Text), int.Parse(no_of_units.Text), int.Parse(userid.Text), catid);
                    msg.Visible = true;
                    msg.Text = "Franchise Added successfully Please add investment details ";
                    msg.ForeColor = Color.Green;

                }
                else
                {
                    msg.Visible = true;
                    msg.Text = "uploaded file must be either in jpg, png or bmp format";
                    msg.ForeColor = Color.Green;
                }
            }
            else
            {

            }
        }

    }
   
}