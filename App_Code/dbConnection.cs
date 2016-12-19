using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Text;

/// <summary>
/// Summary description for dbConnection
/// </summary>
public class dbConnection
{
    public SqlConnection con;
    public SqlDataAdapter da;
    public SqlDataReader dr;
    public DataSet ds;
    public DataTable dt;
    public SqlCommand cmd;
    public dbConnection()
    {
        con = new SqlConnection("data source=DESKTOP-K4NRC3C; uid=sa; pwd=aashish; database=franchise");

    }
    public void openConnection()
    {
        con.Open();
    }
    public void closeConnection()
    {
        con.Close();
    }
}