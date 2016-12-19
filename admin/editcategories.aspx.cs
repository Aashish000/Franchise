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

public partial class admin_editcategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            msg.Visible = false;
            if (Request.QueryString["id"] != null)
            {
                dbConnection db = new dbConnection();
                string data = "SELECT * FROM categories WHERE id=" + Request.QueryString["id"];
                SqlDataAdapter da = new SqlDataAdapter(data, db.con);
                DataSet ds = new DataSet();
                da.Fill(ds, "categories");
                DataTable dt = ds.Tables[0];
                DataRow dr = dt.Rows[0];
                name.Text = dr["name"].ToString();
                lblimage.Text = dr["image"].ToString();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string ext = Path.GetExtension(image.FileName);
        Random rand = new Random();
        int randm = rand.Next(0, 9999999);
        

        //Get Filename from fileupload control
        string filename = Path.GetFileName(image.PostedFile.FileName);
        //Save images into Images folder
        image.SaveAs(Server.MapPath("../uploads/" + image));


        Categories editcat = new Categories();
        int id = Convert.ToInt32(Request.QueryString["id"]);
        editcat.editCategories(name.Text, image.FileName, id);
        msg.Visible = true;
        msg.Text = "Categories Edited with sucess";
        msg.ForeColor = Color.Green;
           
    }
}