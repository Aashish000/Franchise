using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for UserLogin
/// </summary>
public class UserLogin
{
    dbConnection db = new dbConnection();
    SqlCommand cmd; 

    public DataTable CheckUsers(string username, string password, string role)
    {
        string query = "select * from users where username='"+username+"' and password='"+password+"' and role='"+role+"' and status='active'";
        SqlDataAdapter da = new SqlDataAdapter(query, db.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "franchiers");
        return ds.Tables[0];
    }
    public DataTable selectUsers()
    {
        string query = "select * from users";
        SqlDataAdapter da = new SqlDataAdapter(query, db.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        return ds.Tables[0];
    }

   
}