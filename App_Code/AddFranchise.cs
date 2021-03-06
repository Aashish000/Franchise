﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for AddFranchise
/// </summary>
public class AddFranchise
{
    dbConnection db = new dbConnection();
    string query;
    SqlCommand cmd;

      public string franname;
      public AddFranchise()
      { 
      }

    public AddFranchise(int id)
    {
        string data = "select * from franchise where id=" + id;
        SqlDataAdapter da = new SqlDataAdapter(data, db.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "franchise");
        DataTable dt = ds.Tables[0];
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];
            franname = dr["franchise_name"].ToString();
        
        }
    }


    public void addFranchises(string franchise_name, string description, string email, string logo, string established_date, string started_date, string concept, int investment_required, int no_of_units, int uid, int catid)
    {
        
        query = "insert into franchise values(@franchise_name,@description,@email,@logo,@established_date,@started_date,@concept,@investment_required,@no_of_units,@uid,@catid)";
        cmd = new SqlCommand(query, db.con);
        cmd.Parameters.AddWithValue("@franchise_name", franchise_name);
        cmd.Parameters.AddWithValue("@description", description);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@logo", logo);
        cmd.Parameters.AddWithValue("@established_date", established_date);
        cmd.Parameters.AddWithValue("@started_date", started_date);
        cmd.Parameters.AddWithValue("@concept", concept);
        cmd.Parameters.AddWithValue("@investment_required", investment_required);
        cmd.Parameters.AddWithValue("@no_of_units", no_of_units);
        cmd.Parameters.AddWithValue("@uid", uid);
        cmd.Parameters.AddWithValue("@catid", catid);


        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();
    }

    public void editFranchise(string franchise_name, string description, string email, string logo, string established_date, string started_date, string concept, int investment_required, int no_of_units, int catid, int id)
    {

        query = "UPDATE franchise SET franchise_name= '" + franchise_name + "', description='" + description + "', email='" + email + "', logo='" + logo + "', established_date='" + established_date + "', started_date='" + started_date + "', concept='" + concept + "', investment_required='" + investment_required + "', no_of_units='" + no_of_units + "', catid='" + catid + "' WHERE id=" + id;
        cmd = new SqlCommand(query, db.con);
        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();
    }
        public DataTable selectFranchise(int uid)
    {
        
        string query = "select * from franchise where uid='"+uid+"'";
        SqlDataAdapter da = new SqlDataAdapter(query, db.con);
        DataSet ds = new DataSet();
        da.Fill(ds, "franchise");
        return ds.Tables[0];
    }

   public void deleteFranchise(int id)
   {
      string query = "delete from franchise where id=" + id;
      cmd = new SqlCommand(query, db.con);
      cmd.Parameters.AddWithValue("@id", id);
      db.openConnection();
      cmd.ExecuteNonQuery();
      db.closeConnection();

        }
    public DataTable showCategory()
    {
        string query = "select * from categories";
        db.da = new SqlDataAdapter(query, db.con);
        db.ds = new DataSet();
        db.da.Fill(db.ds, "category");
        return db.ds.Tables[0];
    }
}