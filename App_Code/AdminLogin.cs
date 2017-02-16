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
    public void createAdmin(string username, string password, string role)
    {

        string query;
        SqlCommand cmd;
        query = "insert into admin(username,password,role) values(@username,@password,@role)";
        cmd = new SqlCommand(query, db.con);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@password", password);
        cmd.Parameters.AddWithValue("@role", role);

        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();
    }
    public DataTable CheckAdmin(string username, string password )
    {

        string query = "select * from admin where username='" + username + "' and password='" + password + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, db.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "users");
        return ds.Tables[0];
    }
   

}