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

namespace Project2_ALBUM
{
    public partial class Gallery : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Bokang\Documents\GitHub\new\Project2_ALBUM\App_Data\Album.mdf;Integrated Security=True");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                
            }
           
            if(!IsPostBack)
            {
                fillData();
            }
            if (!IsPostBack)
            {
                clearFields();
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
                string name = "";
                
                CloudinaryDotNet.Cloudinary cloudinary = new CloudinaryDotNet.Cloudinary(account);
                

                //string filename = Path.GetFileName(FileUpload1.FileName);
                var uploadParams = new ImageUploadParams()
                { 
                    File = new FileDescription(UploadImage(name)),
                    PublicId = "Olympic_flag",
                    //Folder = @"C:\Users\Bokang\Documents\GitHub\new\Project2_ALBUM\Images"
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
            string Location = txtLocation.Text;
            string date = txtDate.Text;
            string Captured = txtCaptured.Text;
            string fileName = Path.GetFileName(FileUpload1.FileName);
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


                    

                }

                
                SqlCommand cmd = new SqlCommand("INSERT INTO Photo Values('" + fileName + "','" + tags + "','" + Location + "','" + date + "', '" + Captured + "') ", con);
              
                cmd.ExecuteNonQuery();
                DataList1.DataBind();
                
            }
            catch (Exception ex)
            {
                Label6.Text = ("Error occured" + ex.Message);
            }
            finally
            {
                con.Close();
            }
            fillData();
        }

        public string  UploadImage(string name)
        {
            
            foreach (string strName in Directory.GetFiles(Server.MapPath("~/Images/")))
            {
                ImageButton imageButton = new ImageButton();
                FileInfo fileinfo = new FileInfo(strName);
                if (FileUpload1.FileName == "~/Images/" + fileinfo.Name)
                {
                    name = FileUpload1.FileName;
                    break;
                }

                    //ImageButton imageButton = new ImageButton();
                    //FileInfo fileinfo = new FileInfo(strName);
                    //imageButton.ImageUrl = "~/Images/" + fileinfo.Name;
                    //imageButton.Width = Unit.Pixel(100);
                    //imageButton.Height = Unit.Pixel(100);
                    //imageButton.Style.Add("padding", " 5px");
                    //imageButton.Click += new ImageClickEventHandler(imageButton_Click);
                    //DataList1.Controls.Add(imageButton);
                }
            return name;
        }

        void imageButton_Click(object sender, ImageClickEventArgs e)
        {
            
            
            Response.Redirect("~/WebForm1.aspx?ImageURL=" + ((ImageButton)sender).ImageUrl);

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Photo WHERE Captured_By LIKE'%' " + txtSerach.Text + " '%' OR Geolocation Like'%'" + txtSerach.Text + "'%'", con);
                SqlDataAdapter ad = new SqlDataAdapter();
                cmd.ExecuteNonQuery();
                DataSet ds = new DataSet();
                ad.Fill(ds);
                DataList1.DataSource = ds;
                DataList1.DataBind();

            }
            catch(Exception ex)
            {

                lbIndicator.Text="No match found"+ ex.Message;
            }
            
            con.Close();
            
        }

        protected void txtSerach_TextChanged(object sender, EventArgs e)
        {
            
            txtSerach.Text = "";
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            
            if (Calendar1.Visible)
            {
                Calendar1.Visible = false;
            }
            else {
                Calendar1.Visible = true;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToString("d");
            Calendar1.Visible = false;
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "update")
                {
                    DataList1.EditItemIndex = e.Item.ItemIndex;
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

                else if (e.CommandName == "cancel")
                {
                    DataList1.EditItemIndex = -1;
                    fillData();

                }

                else if (e.CommandName == "submit")
                {
                    int id = Convert.ToInt32((Label)e.Item.FindControl("lblID"));
                    
                    string tag = ((TextBox)e.Item.FindControl("txtUpdateTags")).Text;
                    string location = ((TextBox)e.Item.FindControl("txtUpdateLoca")).Text;
                    //string date = ((TextBox)e.Item.FindControl("txtUpdateDate")).Text;
                    string CapBy = ((TextBox)e.Item.FindControl("txtUpdateBy")).Text;

                    SqlCommand cmd = new SqlCommand("UPDATE Photo SET Tags='"+tag+"',Geolocation='"+location+"',Captured_By='"+CapBy+"'WHERE PhotoID='" + id + "'", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    fillData();
                    DataList1.EditItemIndex = -1;

                    

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
            //DataSourceID="SqlDataSource1"
            //OnDeleteCommand="DataList1_DeleteCommand"
            //OnClick="btnDelete_Click"
        }
        public void clearFields()
        {
            txtTags.Text = "";
            txtLocation.Text = "";
            txtDate.Text = "";
            txtCaptured.Text = "";
        }


    }
}