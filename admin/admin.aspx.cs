using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

public partial class admin_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        msg.Visible = false;
        dbConnection db = new dbConnection();
        if (Request.QueryString["id"] != null)
        {
            string query1 = "UPDATE admin set status= 'deactivate' where id ='" + Request.QueryString["id"] + "'";
            SqlCommand cmd = new SqlCommand(query1, db.con);
            db.openConnection();
            cmd.ExecuteNonQuery();
            db.closeConnection();
            msg.Visible = true;
            msg.Text = "account deactivated";
        }
        if (Request.QueryString["uid"] != null)
        {
            string query1 = "UPDATE admin set status = 'active' where id ='" + Request.QueryString["uid"] + "'";
            SqlCommand cmd = new SqlCommand(query1, db.con);
            db.openConnection();
            cmd.ExecuteNonQuery();
            db.closeConnection();
            msg.Visible = true;
            msg.Text = "account activated";
        }

    }
}