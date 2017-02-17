using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Drawing;
using System.Data.SqlClient;

public partial class viewapplication : System.Web.UI.Page
{
    dbConnection db = new dbConnection();

    protected void Page_Load(object sender, EventArgs e)
    {

      

        if (!Page.IsPostBack)
        {
            aid.Visible = false;
         
            if (Session["username"] != null)
            {
                string query = "select* from users where username ='" + Session["username"] + "'";
                db.cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
                db.openConnection();
                db.dr = db.cmd.ExecuteReader();
                while (db.dr.Read())
                {
                    string id = db.dr[0].ToString();
                
                }
                db.closeConnection();
            }

            if (Request.QueryString["id"] != null)
            {

                string data = "select * from application where uid='" + Request.QueryString["id"] + "'";
                SqlDataAdapter da = new SqlDataAdapter(data, db.con);
                DataSet ds = new DataSet();
                da.Fill(ds, "application");
                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    aid.Text = dr["id"].ToString();
                }
                else
                {
                    //no.Visible = true;
                    //no.Text = "no datas";
                }
            }

        }

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {

        Application app = new Application();

        app.deleteApplication(Convert.ToInt32(aid.Text));
        msg.Visible = true;
        msg.Text = "Data deleted";
        msg.ForeColor = Color.Green;

    }
}