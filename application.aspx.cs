using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

public partial class application : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {

                int counter = 0;
                Application app = new Application();
                int fid = Convert.ToInt32(Request.QueryString["id"]);
                DataTable dt = app.selectApplication(fid);
                StringBuilder html = new StringBuilder();
                html.Append("<table class='franchiseinfo'>");
                html.Append("<tr>");
                html.Append("<th class='th'>SN &nbsp</th>");
                html.Append("<th class='th'> Name &nbsp</th>");
                html.Append("<th class='th'>Email &nbsp</th>");
                html.Append("<th class='th'>Country &nbsp</th>");
                html.Append("<th class='th'>City </th>");
                html.Append("<th class='th'>Address &nbsp</th>");
                html.Append("<th class='th'>Occupation &nbsp</th>");
                html.Append("<th class='th'>Education Qualification &nbsp</th>");
                html.Append("<th class='th'>Franchise ID &nbsp</th>");


                html.Append("</tr>");

                foreach (DataRow rows in dt.Rows)
                {
                    html.Append("<br/><tr>");
                    html.Append("<td>" + (++counter) + "</td>");
                    html.Append("<td>" + rows["name"] + "</td>");
                    html.Append("<td>" + rows["email"] + "</td>");
                    html.Append("<td>" + rows["country"] + "</td>");
                    html.Append("<td>" + rows["city"] + "</td>");
                    html.Append("<td>" + rows["address"] + "</td>");
                    html.Append("<td>" + rows["occupation"] + "</td>");
                    html.Append("<td>" + rows["education_qualification"] + "</td>");
                    html.Append("<td>" + rows["fid"] + "</td>");
                    html.Append("<td><a style='color:black' onClick='return confirm(\"Are you sure you want to delete this item ?\")' href='franchise.aspx?id=" + rows["id"] + "'> Delete </a></td>");

                    html.Append("</tr>");
                }
                html.Append("</table>");
                PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
            }

        }
    }
}