using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;


public partial class admin_categories : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        dbConnection db = new dbConnection();

        if (!Page.IsPostBack)
        {
            msg.Visible = false;
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                string query1 = "select * from franchise where catid="+Request.QueryString["id"];
                db.da = new SqlDataAdapter(query1, db.con);
                db.ds = new DataSet();
                db.da.Fill(db.ds, "franchise");
                if (db.ds.Tables[0].Rows.Count > 0)
                {
                    msg.Visible = true;
                    msg.Text = "Cannot Delete";

                }
                else
                {
                    string query = "DELETE FROM categories WHERE id=" + Request.QueryString["id"];
                    SqlCommand cmd = new SqlCommand(query, db.con);
                    db.openConnection();
                    cmd.ExecuteNonQuery();
                    msg.Visible = true;
                    msg.Text = "Record Deleted";
                }

            }
            int counter = 0;
            Categories cat = new Categories();
            DataTable dt = cat.showCategories();
            StringBuilder html = new StringBuilder();
            html.Append("<table class='infotable'");
            html.Append("<tr>");
            html.Append("<th>S.No</th>");
            html.Append("<th>Category</th>");
            html.Append("<th>Image</th>");
            html.Append("<th class='th'>Actions &nbsp</th>");
            html.Append("</tr>");

            foreach (DataRow rows in dt.Rows)
            {
                html.Append("<tr>");
                html.Append("<td>" + (++counter) + "</td>");
                html.Append("<td>" + rows["name"] + "</td>");
                string image = ("../uploads/") + rows["image"];
                html.Append("<td><img src='" + image + "' width='60' height='60' /></td>");
                html.Append("<td><a style='color:black' href='editcategories.aspx?id=" + rows["id"] + "'>Edit| <a style='color:black' onClick='return confirm(\"Are you sure you want to delete this item ?\")' href='categories.aspx?id=" + rows["id"] + "'> Delete </a></td>");
                html.Append("</tr>");
            }
            html.Append("</table>");
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
        }
    }
}