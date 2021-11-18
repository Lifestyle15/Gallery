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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Bokang\Documents\GitHub\new\Project2_ALBUM\App_Data\Album.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            Image1.ImageUrl = Request.QueryString["ImageURL"];
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            //SqlCommand cmm = new SqlCommand("DELETE FROM Gallery WHERE PictureName = '" "'", con);
            //con.Open();
            //cmm.ExecuteNonQuery();
            //con.Close();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CreateINFO.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Gallery.aspx");
        }
    }
}