﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Drawing;
using System.Data.SqlClient;

public partial class investmentdetail : System.Web.UI.Page
{
    dbConnection db = new dbConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            aid.Visible = false;
            no.Visible = false;
            user_id.Visible = false;
            uid.Visible = false;
            if (Session["username"] != null)
            {
                string query = "select* from users where username ='" + Session["username"] + "'";
                db.cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
                db.openConnection();
                db.dr = db.cmd.ExecuteReader();
                while (db.dr.Read())
                {
                    string id = db.dr[0].ToString();
                    user_id.Text = id;
                }
                db.closeConnection();
            }
            

        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {

            string data = "select * from investment_details where fid='" + Request.QueryString["id"] + "'";
            SqlDataAdapter da = new SqlDataAdapter(data, db.con);
            DataSet ds = new DataSet();
            da.Fill(ds, "application");
            DataTable dt = ds.Tables[0];
            DataRow dr = dt.Rows[0];
            aid.Text = dr["id"].ToString();

        }
        InvestmentDetail app = new InvestmentDetail();

        app.deleteInvestment(Convert.ToInt32(aid.Text));
        msg.Visible = true;
        msg.Text = "Data deleted";
        msg.ForeColor = Color.Green;

    }
}