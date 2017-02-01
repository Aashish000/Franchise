using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;


public partial class admin_editfranchise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        uid.Visible = false;
        user_id.Visible = false;
        dbConnection db = new dbConnection();
        if (!Page.IsPostBack)
        {
            msg.Visible = false;
            AddFranchise cat = new AddFranchise();
            db.dt = cat.showCategory();
            category.DataSource = db.dt;
            category.DataTextField = ("name");
            category.DataValueField = ("id");
            category.DataBind();
            if (Session["username"] != null)
            {
                string query = "select* from users where username ='" + Session["username"] + "'";
                db.cmd = new System.Data.SqlClient.SqlCommand(query, db.con);
                db.openConnection();
                db.dr = db.cmd.ExecuteReader();
                while (db.dr.Read())
                {
                    string id = db.dr[0].ToString();
                    user_id.Text = id;
                }
                db.closeConnection();
            }
                if (Request.QueryString["id"] != null)
                {
                     
                    string data = "select * from franchise where id='" + Request.QueryString["id"] + "'";
                    SqlDataAdapter da = new SqlDataAdapter(data, db.con);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "franchise");
                    DataTable dt = ds.Tables[0];
                    DataRow dr = dt.Rows[0];
                    franchise_name.Text = dr["franchise_name"].ToString();
                    description.Text = dr["description"].ToString();
                    email.Text = dr["email"].ToString();
                    established_date.Text = dr["established_date"].ToString();
                    started_date.Text = dr["started_date"].ToString();
                    concept.Text = dr["concept"].ToString();
                    investment_required.Text = dr["investment_required"].ToString();
                    no_of_units.Text = dr["no_of_units"].ToString();
                    category.Text = dr["catid"].ToString();
                    uid.Text = dr["uid"].ToString();
                    if (dr["logo"] != null)
                    {
                        lbllogo.Text = "<img id='id' src='uploads/" + dr["logo"] + "' width='100' height='100' />";
                        imagepath.Value = dr["logo"].ToString();
                    }

                    if (uid.Text != user_id.Text)
                    {
                        Response.Redirect("login.aspx");
                        msg.Visible = true;
                        msg.Text = "wrong login credentials";
                    }
                    else
                    {
                        
                    }

                }
                if (Session["username"] == null)
                {
                    Response.Redirect("login.aspx");

                }
                else
                {

                }
            }
        }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (logo.HasFile)
            {
                string str = logo.FileName;
                string fileExtension = Path.GetExtension(str);
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
                {
                    string imagename = "";
                    if (logo.FileName != "")
                    {
                        FileInfo fl = new FileInfo("~/uploads/" + imagepath.Value.ToString());
                        if (fl.Exists)
                            fl.Delete();

                        logo.PostedFile.SaveAs(Server.MapPath("~/uploads/" + logo.FileName));
                        imagename = logo.FileName;
                    }
                    else
                    {
                        imagename = imagepath.Value.ToString();
                    }

                    AddFranchise editfranchise = new AddFranchise();
                    int id = Convert.ToInt16(Request.QueryString["id"]);
                    editfranchise.editFranchise(franchise_name.Text, description.Text, email.Text, logo.FileName, established_date.Text, started_date.Text, concept.Text, int.Parse(investment_required.Text), int.Parse(no_of_units.Text), int.Parse(category.Text), id);
                    msg.Visible = true;
                    msg.Text = "Franchise Updated successfully";
                    msg.ForeColor = Color.Green;
                }

                else
                {
                    msg.Visible = true;
                    msg.Text = "uploaded file must be either in jpg, png or bmp format";
                    msg.ForeColor = Color.Green;
                }
            }
        }


        catch (Exception ex)
        {
            ltrmsg.Text = ex.Message;

        }
    }

}