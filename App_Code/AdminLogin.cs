using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for AdminLogin
/// </summary>
public class AdminLogin
{
    dbConnection db = new dbConnection();
    SqlCommand cmd;

    public DataTable CheckAdmin(string username, string password )
    {
       
        string query = "select * from admin where username='"+username+"' and password='"+password+"'";
        SqlDataAdapter da = new SqlDataAdapter(query, db.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        return ds.Tables[0];
    }

}