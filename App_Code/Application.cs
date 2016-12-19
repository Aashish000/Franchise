using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for Application
/// </summary>
public class Application
{
    dbConnection db = new dbConnection();
    string query;
    SqlCommand cmd;

    public void applyFranchise(string name, string  email, string country, string city, string address, string occupation, string education_qualification, int fid )
    {
        query = "insert into application values(@name,@email,@country,@city,@address,@occupation,@education_qualification,@fid)";
        cmd = new SqlCommand(query, db.con);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@country", country);
        cmd.Parameters.AddWithValue("@city", city);
        cmd.Parameters.AddWithValue("@address", address);
        cmd.Parameters.AddWithValue("@occupation", occupation);
        cmd.Parameters.AddWithValue("@education_qualification", education_qualification);
        cmd.Parameters.AddWithValue("@fid", fid);
        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();
    }
    public DataTable selectApplication(int fid)
    {

        string query = "select * from application where fid='" + fid + "'";
        SqlDataAdapter da = new SqlDataAdapter(query, db.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "franchise");
        return ds.Tables[0];
    }
  
}