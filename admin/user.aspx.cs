using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class admin_user : System.Web.UI.Page
{
    dbConnection db = new dbConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        msg.Visible = false;
        if (Request.QueryString["id"] != null)
        {
            string query1 = "UPDATE users set status= 'deactivate' where id ='" + Request.QueryString["id"] + "'";
            SqlCommand cmd = new SqlCommand(query1, db.con);
            db.openConnection();
            cmd.ExecuteNonQuery();
            db.closeConnection();
            msg.Visible = true;
            msg.Text = "account deactivated";
        }
        if (Request.QueryString["uid"] != null)
        {
            string query1 = "UPDATE users set status = 'active' where id ='" + Request.QueryString["uid"] + "'";
            SqlCommand cmd = new SqlCommand(query1, db.con);
            db.openConnection();
            cmd.ExecuteNonQuery();
            db.closeConnection();
            msg.Visible = true;
            msg.Text = "account activated";
        }
    }
}