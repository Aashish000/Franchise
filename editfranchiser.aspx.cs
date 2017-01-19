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


public partial class editfranchiser : System.Web.UI.Page
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
                name.Text = dr["name"].ToString();
                email.Text = dr["email"].ToString();
                username.Text = dr["username"].ToString();
                address.Text = dr["address"].ToString();
                country.Text = dr["country"].ToString();
                state.Text = dr["state"].ToString();
                city.Text = dr["city"].ToString();
                contact.Text = dr["contact"].ToString();
                occupation.Text = dr["occupation"].ToString();

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
                               
                string query1 = "UPDATE users set name= '" + name.Text + "', email='" + email.Text + "', username='" + username.Text + "',password='" + newpassword.Text + "', confirm_password='" + confirm_password.Text + "',address='" + address.Text + "',country='" + country.Text + "',state='" + state.Text + "',city='" + city.Text + "',contact='" + contact.Text + "',occupation='" + occupation.Text + "'where username ='" + Session["username"] + "'";
                SqlCommand cmd = new SqlCommand(query1, db.con);
                db.openConnection();
                cmd.ExecuteNonQuery();
                db.closeConnection();
                msg.Visible = true;
                msg.Text = "Franchise Updated successfully";
                msg.ForeColor = Color.Green;

            }
    }
}