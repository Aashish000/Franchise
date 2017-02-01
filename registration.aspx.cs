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
        //if (photo.HasFile)
        //{
        //    string str = photo.FileName;
        //    string fileExtension = Path.GetExtension(str);
        //    if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
        //    {
        //        photo.PostedFile.SaveAs(Server.MapPath(".") + "//uploads//" + str);
        //        String path = "~//../uploads//" + str.ToString();
                AddUser register = new AddUser();
                int cont = Convert.ToInt32(contact.Text);

               

                register.createUser(name.Text, email.Text, username.Text, password.Text, txtconfirmpwd.Text, address.Text, country.Text, state.Text, city.Text, cont, occupation.Text,role.Text);
                msg.Visible = true;
                msg.Text = "new User added";
                msg.ForeColor = Color.Green;
            //}
            //else 
            //{
            //    msg.Visible = true;
            //    msg.Text = "uploaded file must be either in jpg, png or bmp format";
            //    msg.ForeColor = Color.Green;
            //}
        }
        //else
        //{

        //}

    }
