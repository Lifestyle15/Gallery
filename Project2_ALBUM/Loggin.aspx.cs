using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Project2_ALBUM
{
    public partial class Loggin : System.Web.UI.Page
    {
        
        
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Bokang\Documents\GitHub\new\Project2_ALBUM\App_Data\Album.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            lblRespond.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();
            con.Open();
            
            string query = "SELECT COUNT(1) FROM Users WHERE username=@username   AND userPassword=@password ";
            SqlCommand cmd = new SqlCommand(query,con);
            cmd.Parameters.AddWithValue("@username",TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@password",TextBox2.Text.Trim());
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            
            //cmd.ExecuteNonQuery();
            if (count == 1)
            {
                Session["username"] = TextBox1.Text.Trim();
                Response.Redirect("~/Gallery.aspx");
            }
            else
            {
                lblRespond.Visible = true;
                lblRespond.Text = "Incorrect user name or password(or you did not sign up)";
            }

            con.Close();
        }

        protected void btnSign_Click(object sender, EventArgs e)
        {
            Response.Redirect("Loggin.aspx");
        }
    }
}