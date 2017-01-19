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
    protected void Page_Load(object sender, EventArgs e)
    {
        dbConnection db = new dbConnection();
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
                            db.openConnection();
                            db.dr = db.cmd.ExecuteReader();
                            while (db.dr.Read())
                            {

                                fid.Text = db.dr["id"].ToString();
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
    protected void btnDelete_Click(object sender, EventArgs e)
    {

        AddFranchise franchise = new AddFranchise();
        franchise.deleteFranchise(Convert.ToInt32(fid.Text));
        msg.Visible = true;
        msg.Text = "Data deleted";
        msg.ForeColor = Color.Green;

    }
    
   
}
