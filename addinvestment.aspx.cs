using System;
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
public partial class addinvestment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        uid.Visible = false;
        user_id.Visible = false;
        dbConnection db = new dbConnection();
        if (!Page.IsPostBack)
        {
            msg.Visible = false;
            franchise_id.Visible = false;
            franchiseid.Visible = false;
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
            if (Request.QueryString["id"] != null)
            {

                string data = "SELECT * FROM franchise where id=" + Request.QueryString["id"];
                SqlDataAdapter da = new SqlDataAdapter(data, db.con);
                DataSet ds = new DataSet();
                da.Fill(ds, "franchise123");
                DataTable dt = ds.Tables[0];
                DataRow dr = dt.Rows[0];

                franchiseid.Text = dr["id"].ToString();
                uid.Text = dr["uid"].ToString();

            }
            if (uid.Text != user_id.Text)
            {
                Response.Redirect("login.aspx");
                msg.Visible = true;
                msg.Text = "wrong login credentials";
            }
            else
            {

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        InvestmentDetail app = new InvestmentDetail();

        app.addInvestment(int.Parse(investment_required.Text), int.Parse(cash_required.Text), int.Parse(royalty.Text), training_assist.Text,int.Parse(franchiseid.Text),int.Parse(uid.Text));
        msg.Visible = true;
        msg.Text = "Investment Detail added Submitted successfully";
        msg.ForeColor = Color.Green;
    }
}