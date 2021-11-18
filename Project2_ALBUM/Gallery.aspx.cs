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
        //public const string Name = "nfbghcqc";
        //public const string API_key = "492595515579926";
       
        //public const string Secret = "Q-A6o2WUbMTmrA_cP7dSXEbLhlI";

        

       // Cloudinary cloudinary = new Cloudinary(account);
        //public static Cloudinary cloudinary;
        protected void Page_Load(object sender, EventArgs e)
        {
            ///UploadImage();
            txtSerach.Text = "Search by id";

            if (!IsPostBack)
            {
                Calendar1.Visible = false;
            }
           
        }
        //"drej5l6zw"
        protected void Cloud(string ruta)
        {
            Account account = new Account(
                "dhmfhgsmb",
                "595375292135675",
                "LF-fqVOvLjKnk8ZRW7TWFDZMqzA");

            Cloudinary cloudinary = new Cloudinary(account);
            // cloudinary = new Cloudinary(account); 

            //MemoryStream ms = new MemoryStream();
            //ms = new MemoryStream(FileUpload1.FileBytes);
            try
            {
                //CloudinaryDotNet.Cloudinary cloudinary = new CloudinaryDotNet.Cloudinary(account);

                string filename = FileUpload1.FileName;
                var uploadParams = new ImageUploadParams()
                {
                    File = new FileDescription(@"C:\Users\Bokang\Documents\GitHub\new\Project2_ALBUM\Images\ " + filename),
                    PublicId = "Calender"
                };
                var uploadResult = cloudinary.Upload(uploadParams);




                Console.WriteLine("Image uploaded successfully!");

                
                ruta = uploadResult.SecureUrl.ToString();
                Response.Redirect(ruta);

            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
            }


            //protected void Cloud(string ruta)
            //{
            //    Account account = new Account(
            //        Name,
            //        API_key,
            //        Secret
            //        );
            //   // cloudinary = new Cloudinary(account); 

            //    MemoryStream ms = new MemoryStream();
            //    ms = new MemoryStream(FileUpload1.FileBytes);
            //    try
            //    {
            //        CloudinaryDotNet.Cloudinary cloud = new CloudinaryDotNet.Cloudinary(account);


            //        var uploadParams = new ImageUploadParams()
            //        {
            //            File = new FileDescription(FileUpload1.FileName, ms),


            //        };

            //        var uploadResult = cloud.Upload(uploadParams);
            //        Console.WriteLine("Image uploaded successfully!");

            //        //ruta = uploadResult.SecureUri.ToString();
            //        //Response.Redirect(ruta);

            //    }
            //    catch (Exception ex)
            //    {
            //        Console.Write(ex.ToString());
            //    }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string tags = txtTags.Text;
            string Location = txtLocation.Text;
            string date = txtDate.Text;
            string Captured = txtCaptured.Text;
            string fileName = FileUpload1.FileName;
            string fileExtension = Path.GetExtension(fileName);
            con.Open();
            if (FileUpload1.HasFile)
            {
                if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".bmp" || fileExtension.ToLower() == ".png" ||
                fileExtension.ToLower() == ".gif")
                {
                    FileUpload1.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Images/" + fileName);

                   
                    
                    

                }
                else
                {
                    lbIndicator.Visible = true;
                    lbIndicator.Text = "Only images can be uploaded (e.g jpg, gif, bmp, png)";
                    lbIndicator.ForeColor = System.Drawing.Color.Blue;

                }


                //long size = FileUpload1.FileContent.Length;

            }

            //ivzqisrv
            // SqlCommand cmd = new SqlCommand("INSERT INTO Photo Values('" + fileName + "','" + tags + "','" + Location + "','" + date + "', '" + Captured + "') ",con);

            string ruta = " "; //Console.ReadLine();
            Cloud(ruta);
            // cmd.ExecuteNonQuery();
            con.Close();

            

        }

        private void UploadImage()
        {
            foreach (string strName in Directory.GetFiles(Server.MapPath("~/Images/")))
            {
                ImageButton imageButton = new ImageButton();
                FileInfo fileinfo = new FileInfo(strName);
                imageButton.ImageUrl = "~/Images/" + fileinfo.Name;
                imageButton.Width = Unit.Pixel(100);
                imageButton.Height = Unit.Pixel(100);
                imageButton.Style.Add("padding", " 5px");
                imageButton.Click += new ImageClickEventHandler(imageButton_Click);
                DataList1.Controls.Add(imageButton);
            }
        }

        void imageButton_Click(object sender, ImageClickEventArgs e)
        {
            
            
            Response.Redirect("~/WebForm1.aspx?ImageURL=" + ((ImageButton)sender).ImageUrl);

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Photo WHERE Captured_By LIKE '%" + txtSerach.Text + "%' OR Geolocation Like '%" + txtSerach.Text + "%'  ", con);
            //SqlDataAdapter ad = new SqlDataAdapter("SELECT * FROM Photo WHERE Captured_By LIKE '%" + txtSerach.Text + "%' OR Geolocation Like '%" + txtSerach.Text + "%'  ", con);
            //String query = "SELECT COUNT(1) FROM Users WHERE Captured_By !='" + txtSerach.Text + "', AND Geolocation='" + txtSerach.Text + "'";
            

            cmd.ExecuteNonQuery();
            //DataSet ds = new DataSet();
            //ad.Fill(ds);
            
            //Panel1.DataBind();
            
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
    }
}