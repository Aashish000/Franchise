using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class admin_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        msg.Visible = false;
        dbConnection db = new dbConnection();
       
      



       

    }
}
//if request query string garne 
//string query ma query falne
//sqlcommand cmd ma query store garne
//db.openConnection();
//    cmd.ExecuteNonQuery();
//    msg.Visible = true;
//    msg.Text = "Record Deleted";
//    msg.ForeColor = Color.Green;
//    db.closeConnection();
//}