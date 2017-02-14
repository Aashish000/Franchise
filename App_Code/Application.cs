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

    public void applyFranchise(string name, string  email, string country, string city, string address, string occupation, string education_qualification, int fid, int uid )
    {
        query = "insert into application(name,email,country,city,address,occupation,education_qualification,fid,uid) values(@name,@email,@country,@city,@address,@occupation,@education_qualification,@fid,@uid)";
        cmd = new SqlCommand(query, db.con);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@country", country);
        cmd.Parameters.AddWithValue("@city", city);
        cmd.Parameters.AddWithValue("@address", address);
        cmd.Parameters.AddWithValue("@occupation", occupation);
        cmd.Parameters.AddWithValue("@education_qualification", education_qualification);
        cmd.Parameters.AddWithValue("@fid", fid);
        cmd.Parameters.AddWithValue("@uid", uid);

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
    public void deleteApplication(int id)
    {
        string query = "delete from application where id=" + id;
        cmd = new SqlCommand(query, db.con);
        cmd.Parameters.AddWithValue("@id", id);
        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();

    }
    public DataTable showApplication()
    {
        string query = "select * from application";
        db.da = new SqlDataAdapter(query, db.con);
        db.ds = new DataSet();
        db.da.Fill(db.ds, "application");
        return db.ds.Tables[0];
    }
  
}