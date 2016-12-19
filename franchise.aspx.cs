using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        msg.Visible = false;
        if (!Page.IsPostBack)
        {
            
           if (Request.QueryString["id"] != null)
            {
               dbConnection db = new dbConnection();
               string query = "DELETE FROM franchise WHERE id=" + Request.QueryString["id"];
                SqlCommand cmd = new SqlCommand(query, db.con);
                db.openConnection();
                cmd.ExecuteNonQuery();
            }
           
                int counter = 0;
                AddFranchise fran = new AddFranchise();
                int uid = Convert.ToInt32(Request.QueryString["id"]);
                DataTable dt = fran.selectFranchise(uid);
                StringBuilder html = new StringBuilder();
                html.Append("<table class='franchiseinfo'>");
                html.Append("<tr>");
                html.Append("<th class='th'>SN &nbsp</th>");
                html.Append("<th class='th'>Franchise Name &nbsp</th>");
                html.Append("<th class='th'>Description &nbsp</th>");
                html.Append("<th class='th'>Email &nbsp</th>");
                html.Append("<th class='th'>logo </th>");
                html.Append("<th class='th'>Established Date &nbsp</th>");
                html.Append("<th class='th'>Started Date &nbsp</th>");
                html.Append("<th class='th'>Concept &nbsp</th>");
                html.Append("<th class='th'>Investment Required &nbsp</th>");
                html.Append("<th class='th'>No of Units &nbsp</th>");
                html.Append("<th class='th'>UID</th>");

                html.Append("<th class='th'>Actions &nbsp</th>");

                html.Append("</tr>");

                foreach (DataRow rows in dt.Rows)
                {
                    html.Append("<br/><tr>");
                    html.Append("<td>" + (++counter) + "</td>");
                    html.Append("<td>" + rows["franchise_name"] + "</td>");
                    html.Append("<td>" + rows["description"] + "</td>");
                    html.Append("<td>" + rows["email"] + "</td>");
                    string logo = ("uploads/") + rows["logo"];
                    html.Append("<td><img src='" + logo + "' width='60' height='60' /></td>");
                    html.Append("<td>" + rows["established_date"] + "</td>");
                    html.Append("<td>" + rows["started_date"] + "</td>");
                    html.Append("<td>" + rows["concept"] + "</td>");
                    html.Append("<td>" + rows["investment_required"] + "</td>");
                    html.Append("<td>" + rows["no_of_units"] + "</td>");
                    html.Append("<td>" + rows["uid"] + "</td>");


                    html.Append("<td><a style='color:black' href='editfranchise.aspx?id=" + rows["id"] + "'>Edit|<a style='color:black' onClick='return confirm(\"Are you sure you want to delete this item ?\")' href='franchise.aspx?id=" + rows["id"] +  "'> Delete| </a><a style='color:black' href='application.aspx?id=" + rows["id"] + "'>Applications</a></td>");
                  
                    html.Append("</tr>");
                }
                html.Append("</table>");
                PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });
            }
        
        if (Session["username"] == null)
        {
            Response.Redirect("login.aspx");

        }
        else
        {

        }
    }
}