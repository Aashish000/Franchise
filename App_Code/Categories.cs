using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


/// <summary>
/// Summary description for Categories
/// </summary>
public class Categories
{
    dbConnection db = new dbConnection();
    string query;
    SqlCommand cmd;
    public string catname;

    public Categories()
    { 
    
    }
    public Categories(int id)
    {
        string data = "select * from categories where id=" + id;
        SqlDataAdapter da = new SqlDataAdapter(data, db.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "franchise");
        DataTable dt = ds.Tables[0];
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];
            catname = dr["name"].ToString();

        }
    }

    public void addCategories(string name, string image)
    {
        query = "insert into categories values(@name,@image)";
        cmd = new SqlCommand(query, db.con);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@image", image);       
        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();
    }
    public void editCategories(string name, string image, int id)
    {
        query = "UPDATE categories SET name= '" + name + "', image='" + image + "' WHERE id=" + id;
        cmd = new SqlCommand(query, db.con);
        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();
    }

    public DataTable showCategories()
    {

        string query = "select * from categories";
        SqlDataAdapter da = new SqlDataAdapter(query, db.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "categories");
        return ds.Tables[0];
    }

    
}