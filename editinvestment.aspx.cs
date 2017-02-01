using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;

public partial class editinvestment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        uid.Visible = false;
        user_id.Visible = false;
        dbConnection db = new dbConnection();
        if (!Page.IsPostBack)
        {
            msg.Visible = false;
          
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

                string data = "select * from investment_details where id='" + Request.QueryString["id"] + "'";
                SqlDataAdapter da = new SqlDataAdapter(data, db.con);
                DataSet ds = new DataSet();
                da.Fill(ds, "franchise");
                DataTable dt = ds.Tables[0];
                DataRow dr = dt.Rows[0];
                investment_required.Text = dr["investment_required"].ToString();
                cash_required.Text = dr["cash_required"].ToString();
                royalty.Text = dr["royalty"].ToString();
                training_assist.Text = dr["training_assist"].ToString();
             
            }
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");

            }
            else
            {

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
                    InvestmentDetail editinvestment = new InvestmentDetail();
                    int id = Convert.ToInt16(Request.QueryString["id"]);
                    editinvestment.editInvestment(int.Parse(investment_required.Text), int.Parse(cash_required.Text), int.Parse(royalty.Text),training_assist.Text, id);
                    msg.Visible = true;
                    msg.Text = "Franchise Updated successfully";
                    msg.ForeColor = Color.Green;
                

               
       }
       
        catch (Exception ex)
        {
            ltrmsg.Text = ex.Message;

        }
    }
}