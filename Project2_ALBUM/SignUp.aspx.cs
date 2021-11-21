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
    public partial class SignUp : System.Web.UI.Page
    {
        string encrypted;
        SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Bokang\Documents\GitHub\new\Project2_ALBUM\App_Data\Album.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            encryption();
            String name = TextBox1.Text;
            

            conn.Open();
            String str = "INSERT INTO Users VALUES ('" + name + "','" + encrypted + "') ";

            SqlCommand cmd = new SqlCommand(str, conn);

            cmd.ExecuteNonQuery();
            conn.Close();
            
            
            Response.Write("<script>alert('Account created successfully!')</script>");

            Response.Redirect("~/Loggin.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Loggin.aspx");
        }

        public void encryption()
        {
            string msg = string.Empty;
            byte[] encode = new byte[TextBox2.Text.ToString().Length];
            encode = Encoding.UTF8.GetBytes(TextBox2.Text);
            msg = Convert.ToBase64String(encode);
            encrypted = msg;
        }
    }
}