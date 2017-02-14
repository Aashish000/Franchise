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

         
                    string query1 = "UPDATE users set name= '" + name.Text + "', email='" + email.Text + "', address='" + address.Text + "',country='" + country.Text + "',state='" + state.Text + "',city='" + city.Text + "',contact='" + contact.Text + "',occupation='" + occupation.Text + "'where username ='" + Session["username"] + "'";
                    SqlCommand cmd = new SqlCommand(query1, db.con);
                    db.openConnection();
                    cmd.ExecuteNonQuery();
                    db.closeConnection();
                    msg.Visible = true;
                    msg.Text = "Franchise Updated successfully";
                    msg.ForeColor = Color.Green;
            
    }
}