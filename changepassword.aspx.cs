using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class changepassword : System.Web.UI.Page
{
     dbConnection db = new dbConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!Page.IsPostBack)
        {
            msg.Visible = false;
            if (Session["username"] != null)
            {

                string query = "select* from users where username ='" + Session["username"] + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, db.con);
                DataSet ds = new DataSet();
                da.Fill(ds, "users");
                DataTable dt = ds.Tables[0];
                DataRow dr = dt.Rows[0];
                username.Text = dr["username"].ToString();
           }
            else
            {
                Response.Redirect("login.aspx");

            }
        }
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {

        string query = "select * from users where username='" + username.Text + "'";
        //db.cmd = new SqlCommand(query, db.con);
        db.da = new SqlDataAdapter(query, db.con);
        db.ds = new DataSet();
        db.da.Fill(db.ds, "users");
        //db.dt = db.ds.Tables[0];

        string password = db.ds.Tables[0].Rows[0][4].ToString();
        if (oldpassword.Text != password)
        {
            msg.Visible = true;
            msg.Text = "incorrect old password";
            msg.ForeColor = Color.Red;
        }

        else if (newpassword.Text != confirm_password.Text)
        {
            msg.Visible = true;
            msg.Text = "password doesnt match";
            msg.ForeColor = Color.Red;


        }
        else
        {

            string query1 = "UPDATE users set username= '" + username.Text + "', password='" + newpassword.Text + "'where username ='" + Session["username"] + "'";
            SqlCommand cmd = new SqlCommand(query1, db.con);
            db.openConnection();
            cmd.ExecuteNonQuery();
            db.closeConnection();
            msg.Visible = true;
            msg.Text = "Password Updated successfully";
            msg.ForeColor = Color.Green;

        }
    }
}