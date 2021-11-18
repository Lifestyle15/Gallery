using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace Project2_ALBUM
{
    public partial class CreateINFO : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=album.database.windows.net;Initial Catalog=Album;Persist Security Info=True;User ID=admin101;Password=***********");
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
            //string date = TextBox2.Text;
            //string model = TextBox3.Text;
            //int size = int.Parse(TextBox4.Text);
            //try
            //{
            //    con.Open();
            //    SqlCommand cmm = new SqlCommand("INSERT INTO Gallery(Date, Model, Size) VALUES('" + date + "', '" + model + "', '" + size + "')", con);

            //    cmm.ExecuteNonQuery();
            //    con.Close();
            //    Response.Write("Data saved!");
            //}
            //catch (SqlException error)
            //{
            //    Response.Write(error.Message);
            //}

            Response.Redirect("~/WebForm1.aspx");       
        }
    }
}