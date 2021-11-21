using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using CloudinaryDotNet.Actions;
using CloudinaryDotNet;
//OnSelectedIndexChanged="DataList1_SelectedIndexChanged"
namespace Project2_ALBUM
{
    public partial class Gallery : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Bokang\Documents\GitHub\new\Project2_ALBUM\App_Data\Album.mdf;Integrated Security=True");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
                Response.Redirect("Loggin.aspx");
            lblDetails.Text = "Username: " + Session["username"];

            if(!IsPostBack)
            {
                fillData();
            }
            
        }
        //"djkuep2mt"
        protected void Cloud(string ruta)
        {
            Account account = new Account(
                  "xghx2bgm",
                  "911472718362882",
                  "3Gm1mNagyUTrg-NxYK7EcdBtDvQ");

            try
            {
                CloudinaryDotNet.Cloudinary cloudinary = new CloudinaryDotNet.Cloudinary(account);

                var uploadParams = new ImageUploadParams()
                { 
                    File = new FileDescription("~/Images/ " + FileUpload1.FileName),
                    
                };
                var uploadResult = cloudinary.Upload(uploadParams);

                Response.Write("<script>alert('Image uploaded successfully')!</script>");

                ruta = uploadResult.SecureUrl.ToString();
                Response.Redirect(ruta);

            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
            }


        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string tags = txtTags.Text;
            
            string fileName = (FileUpload1.FileName);
            string fileExtension = Path.GetExtension(fileName);

            try
            {
                con.Open();
                if (FileUpload1.HasFile)
                {
                    if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".png" ||
                    fileExtension.ToLower() == ".gif")
                    {
                        FileUpload1.SaveAs(Request.MapPath("~/Images/" + FileUpload1.FileName));
                        string ruta = " ";
                        Cloud(ruta);
                    }
                    else
                    {
                        lbIndicator.Visible = true;
                        lbIndicator.Text = "Only images can be uploaded (e.g jpg, gif, bmp, png)";
                        lbIndicator.ForeColor = System.Drawing.Color.Blue;

                    }
                }//"~/Images/"
                SqlCommand cmd = new SqlCommand("INSERT INTO Photo(Photo_Name,Tags) Values('"+ "~/Images/" + fileName+"','"+tags+ "') ", con);
              
                cmd.ExecuteNonQuery();
                DataList1.DataBind();
                con.Close();
                
            }
            catch (Exception ex)
            {
                Label6.Text = ("Error occured " + ex.Message);
            }
            
            fillData();
            clearFields();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter($"SELECT * FROM Photo WHERE Captured_By LIKE %'{txtSerach.Text}'%", con);
                DataSet ds = new DataSet();
                //SqlCommand cmd = new SqlCommand($"SELECT * FROM Photo WHERE Captured_By LIKE '{txtSerach.Text}'", con);
       
                //da.SelectCommand = cmd;
                da.Fill(ds, "Photo");
               
                DataList1.DataSource = ds;
                DataList1.DataBind();
                DataList1.DataMember = "Photo";

                con.Close();
            }
            catch(Exception ex)
            {
                lbIndicator.Text="No match found"+ ex.Message;
            }
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "edit")
                {
                    DataList1.EditItemIndex = e.Item.ItemIndex;
                    fillData();

                }
                else if (e.CommandName == "cancel")
                {
                    DataList1.EditItemIndex = -1;
                    fillData();

                }
                else if (e.CommandName == "delete")
                {
                    string id;
                    id = ((Label)e.Item.FindControl("lblID")).Text;
                    SqlCommand cmd = new SqlCommand("delete from Photo where PhotoID ='" + id + "'", con);
                    con.Open();
                    cmd.ExecuteNonQuery();

                    con.Close();
                    fillData();

                }
                else if (e.CommandName == "update")
                {
                    string id = ((Label)e.Item.FindControl("lblID")).Text;
                    
                    string tag = ((TextBox)e.Item.FindControl("txtUpdateTags")).Text;
                    string location = ((TextBox)e.Item.FindControl("txtUpdateLoca")).Text;
                    string date = ((TextBox)e.Item.FindControl("txtUpdateDate")).Text;
                    string CapBy = ((TextBox)e.Item.FindControl("txtUpdateBy")).Text;

                    SqlCommand cmd = new SqlCommand("UPDATE Photo SET Tags='"+tag+"',Geolocation='"+ location+ "',Captured_Date='" + date + "',Captured_By='" + CapBy+"'WHERE PhotoID='" + id + "'", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    DataList1.EditItemIndex = -1;
                    fillData();
                   
                }
               
                else if (e.CommandName == "Download")
                {
                    Response.Clear();
                    Response.ContentType = "application/octect-stream";
                    Response.AppendHeader("content-disposition", "filename="+ e.CommandArgument);
                    Response.TransmitFile(Server.MapPath("~/Images") + e.CommandArgument);
                    Response.End();
                }

                
            }
            catch (Exception ex)
            {
                Label6.Text = ex.Message;
            }

            
        }
        private void fillData()
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * FROM Photo", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            
        }
        public void clearFields()
        {
            txtTags.Text = "";
           
        }

        protected void btnLog_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Loggin.aspx");
        }

    }
}