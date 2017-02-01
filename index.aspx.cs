using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    dbConnection db = new dbConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void search_Click(object sender, EventArgs e)
    {
        if (searchlabel.Text == "")
        {
            Response.Redirect("index.aspx");
        }
        string search = searchlabel.Text;
        Search sc = new Search();
        db.dt = sc.searchFranchise(search);
        if (db.dt.Rows.Count > 0)
        {
            //Session["search"] = search;
            string value = search.ToString();
            //Response.Redirect("search.aspx");
            Response.Redirect("search.aspx?search=" + value);
            db.closeConnection();
        }
        else
        {
           
            Response.Redirect("search.aspx");
        }
    }
}