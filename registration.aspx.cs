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
using System.Configuration;

public partial class registration: System.Web.UI.Page
{
    dbConnection db = new dbConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        msg.Visible = false;
       
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //string data = "select username from users where username='"+username.Text+"'";
        //db.cmd = new SqlCommand(data, db.con);
        //db.openConnection();
        //db.dr = db.cmd.ExecuteReader();
        //if (db.dr.Read())
        //{

        //    msg.Visible = true;
        //    msg.Text = "username already exists";
        //    msg.ForeColor = Color.Red;
        //}
        //else 
        //{

            try
            {
                AddUser register = new AddUser();
                int cont = Convert.ToInt32(contact.Text);
                register.createUser(name.Text, email.Text, username.Text, password.Text, txtconfirmpwd.Text, address.Text, country.Text, state.Text, city.Text, cont, occupation.Text, role.Text);
                msg.Visible = true;
                msg.Text = "new User added";
                msg.ForeColor = Color.Green;
            }
            catch (Exception ex)
            {
                msg.Text = ex.Message;
                msg.ForeColor = Color.Red;
            }
        //}
    }
       
}
