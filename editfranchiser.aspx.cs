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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            msg.Visible = false;
            if (Request.QueryString["id"] != null)
            {
                dbConnection db = new dbConnection();
                string data = "SELECT * FROM users WHERE id=" + Request.QueryString["id"];
                SqlDataAdapter da = new SqlDataAdapter(data, db.con);
                DataSet ds = new DataSet();
                da.Fill(ds, "users");
                DataTable dt = ds.Tables[0];
                DataRow dr = dt.Rows[0];
                name.Text = dr["name"].ToString();
                email.Text = dr["email"].ToString();
                username.Text = dr["username"].ToString();
                password.Text = dr["password"].ToString();
                confirm_password.Text = dr["confirm_password"].ToString();
                address.Text = dr["address"].ToString();
                country.Text = dr["country"].ToString();
                state.Text = dr["state"].ToString();
                city.Text = dr["city"].ToString();
                contact.Text = dr["contact"].ToString();
                occupation.Text = dr["occupation"].ToString();

            }
        }
        if (Session["username"] == null)
        {
            Response.Redirect("login.aspx");

        }
        else
        {

        }
    }


    protected void Button1_Click1(object sender, EventArgs e)
    {

        try
        {
            
                    AddUser editusers = new AddUser();
                    int id = Convert.ToInt16(Request.QueryString["id"]);
                    editusers.edituser(name.Text, email.Text, username.Text, password.Text, confirm_password.Text, address.Text, country.Text,state.Text,city.Text, int.Parse(contact.Text),occupation.Text, id);
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