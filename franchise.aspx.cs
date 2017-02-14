using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Drawing;
public partial class admin_Default : System.Web.UI.Page
{
    dbConnection db = new dbConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            no.Visible = false;
            fid.Visible = false;
            msg.Visible = false;
            if (Session["username"] != null)
            {
                string query = "select* from users where username ='" + Session["username"] + "'";
                db.cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
                db.openConnection();
                db.dr = db.cmd.ExecuteReader();
                while (db.dr.Read())
                {
                    int id = Convert.ToInt32(db.dr[0].ToString());
                    string data = "select * from franchise where uid='" + id + "'";
                    db.cmd = new System.Data.SqlClient.SqlCommand(data, db.con);
                }
                db.closeConnection();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            db.openConnection();
            db.dr = db.cmd.ExecuteReader();
            while (db.dr.Read())
            {
                Session["id"] = db.dr[0];
                fid.Text = db.dr["id"].ToString();
            }
            db.closeConnection();



        }
        //for delete 
        try
        {

            if (Request.QueryString["id"] != null)
            {

                string query = "DELETE FROM franchise WHERE id=" + Request.QueryString["id"];
                SqlCommand cmd = new SqlCommand(query, db.con);
                db.openConnection();
                cmd.ExecuteNonQuery();
                msg.Visible = true;
                msg.Text = "Record Deleted";
                msg.ForeColor = Color.Green;
                
            }


        }
        catch (SqlException ex)
        {
            if (ex.Errors.Count > 0 && ex.Errors[0].Number == 547)
            {
                ltrerror.Text = "this  item carries foregin key cannot delete";
               
            }
            else
            {
                ltrerror.Text = ex.Message;
            }
        }
    
    }

}