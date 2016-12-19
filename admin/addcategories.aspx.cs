using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;

public partial class admin_addcategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        msg.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (image.HasFile)
        {
            string str = image.FileName;
            string fileExtension = Path.GetExtension(str);
            if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
            {
                image.PostedFile.SaveAs(Server.MapPath(".") + "//../uploads//" + str);
                String path = "~//../uploads//" + str.ToString();
                Categories cat = new Categories();
                cat.addCategories(name.Text,image.FileName);
                msg.Visible = true;
                msg.Text = "Categories Added successfully";
                msg.ForeColor = Color.Green;
            }
            else
            {
                msg.Visible = true;
                msg.Text = "uploaded file must be either in jpg, png or bmp format";
                msg.ForeColor = Color.Green;
            }
        }
        else
        {

        }
    }
}