using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Security.Cryptography;

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
    public static string encrypt(string password)
    {
        UnicodeEncoding uEncode = new UnicodeEncoding();
        byte[] bytPassword = uEncode.GetBytes(password);
        SHA512Managed sha = new SHA512Managed();
        byte[] hash = sha.ComputeHash(bytPassword);
        return Convert.ToBase64String(hash);
    }
   
}