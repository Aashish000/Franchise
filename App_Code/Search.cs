using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Search
/// </summary>
public class Search
{
    dbConnection db = new dbConnection();

    public DataTable searchFranchise(string search)
    {
        string data = "SELECT * from franchise WHERE franchise_name LIKE '%" +search+ "%'";
        SqlDataAdapter da = new SqlDataAdapter(data, db.con);
        DataSet ds = new DataSet();
        da.Fill(ds,"search");
        return ds.Tables[0];

    }
}