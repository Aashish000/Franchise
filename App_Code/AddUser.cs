using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


/// <summary>
/// Summary description for AddUser
/// </summary>
public class AddUser
{
    dbConnection db = new dbConnection();
    string query;
    SqlCommand cmd;
    public void createUser( string name, string email, string username, string password, string confirm_password, string address, string country, string state, string city, int contact, string occupation, string role)
    {
        
        string query;
        SqlCommand cmd;
        query = "insert into users(name,email,username,password,confirm_password,address,country,state,city,contact,occupation,role) values(@name,@email,@username,@password,@confirm_password,@address,@country,@state,@city,@contact,@occupation,@role)";
        cmd = new SqlCommand(query, db.con);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@username", username);
        cmd.Parameters.AddWithValue("@password", password);
        cmd.Parameters.AddWithValue("@confirm_password", confirm_password);
        cmd.Parameters.AddWithValue("@address", address);
        cmd.Parameters.AddWithValue("@country", country);
        cmd.Parameters.AddWithValue("@state", state);
        cmd.Parameters.AddWithValue("@city", city);
        cmd.Parameters.AddWithValue("@contact", contact);
        cmd.Parameters.AddWithValue("@occupation", occupation);        
        //cmd.Parameters.AddWithValue("@photo", photo);
        cmd.Parameters.AddWithValue("@role", role);        

        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();
    }

    public void edituser(string name, string email, string username, string password, string confirm_password, string address, string country, string state, string city, int contact, string occupation,int id)
    {
        string query = "UPDATE users set name= '" + name + "', email='" + email + "', username='" + username + "',password='" + password + "', confirm_password='" + confirm_password + "',address='" + address + "',country='" + country + "',state='" + state + "',city='" + city + "',contact='" + contact + "',occupation='" + occupation + "'where id =" + id;
        SqlCommand  cmd = new SqlCommand(query, db.con);
        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();

    }
    public DataTable showUser()
    {
        string query = "select * from user_type";
        db.da = new SqlDataAdapter(query, db.con);
        db.ds = new DataSet();
        db.da.Fill(db.ds, "usertype");
        return db.ds.Tables[0];
    }

   

    
}