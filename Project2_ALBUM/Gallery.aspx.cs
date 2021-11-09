using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Project2_ALBUM
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UploadImage();
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string name = FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/" + name));

            }

            Response.Redirect("Gallery.aspx");
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
                Panel1.Controls.Add(imageButton);
            }
        }

        void imageButton_Click(object sender, ImageClickEventArgs e)
        {
            //ImageButton imageButton = new ImageButton();
            ////imageButton.
            //String name = imageButton_Click;
            
            Response.Redirect("~/WebForm1.aspx?ImageURL=" + ((ImageButton)sender).ImageUrl);

        }

       
    }
}