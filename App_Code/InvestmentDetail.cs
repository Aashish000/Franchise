using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for InvestmentDetail
/// </summary>
public class InvestmentDetail
{
    dbConnection db = new dbConnection();
    string query;
    SqlCommand cmd;

    public void addInvestment(int investment_required, int cash_required, int royalty, string training_assist, int fid, int uid)
    {
        query = "insert into investment_details values(@investment_required,@cash_required,@royalty,@training_assist,@fid,@uid)";
        cmd = new SqlCommand(query, db.con);
        cmd.Parameters.AddWithValue("@investment_required", investment_required);
        cmd.Parameters.AddWithValue("@cash_required", cash_required);
        cmd.Parameters.AddWithValue("@royalty", royalty);
        cmd.Parameters.AddWithValue("@training_assist", training_assist);
        cmd.Parameters.AddWithValue("@fid", fid);
        cmd.Parameters.AddWithValue("@uid", uid);

        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();
    }
    public void editInvestment(int investment_required, int cash_required, int royalty, string training_assist, int id)
    {

        query = "UPDATE investment_details SET investment_required= '" + investment_required + "', cash_required='" + cash_required + "', royalty='" + royalty + "', training_assist='" + training_assist + "' WHERE id=" + id;
        cmd = new SqlCommand(query, db.con);
        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();
    }
    public void deleteInvestment(int id)
    {
        string query = "delete from investment_details where id=" + id;
        cmd = new SqlCommand(query, db.con);
        cmd.Parameters.AddWithValue("@id", id);
        db.openConnection();
        cmd.ExecuteNonQuery();
        db.closeConnection();

    }
}