using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class directories : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void search_Click(object sender, EventArgs e)
    {
        dbConnection db1 = new dbConnection();
        if (searchlabel.Text == "")
        {
            Response.Redirect("index.aspx");
        }
        string search = searchlabel.Text;
        Search sc = new Search();
        db1.dt = sc.searchFranchise(search);
        if (db1.dt.Rows.Count > 0)
        {
            //Session["search"] = search;
            string value = search.ToString();
            //Response.Redirect("search.aspx");
            Response.Redirect("search.aspx?search=" + value);
            db1.closeConnection();
        }
        else
        {

            Response.Redirect("search.aspx");
        }
    }
}