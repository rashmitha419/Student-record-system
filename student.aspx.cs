using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Webpages_Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void resetbtn_Click(object sender, EventArgs e)
    {
        regnotxtbx.Text = String.Empty;
        snametxtbx.Text = String.Empty;
        coursetxtbx.Text = String.Empty;
        markstxtbx.Text = String.Empty;
        addresstxtbx.Text = String.Empty;
        dpttxtbx.Text = String.Empty;
        cntnotxtbx.Text = String.Empty;

    }
    protected void submitbtn_Click(object sender, EventArgs e)
    {
        string stid = regnotxtbx.Text;
        string stname = snametxtbx.Text;
        string course = coursetxtbx.Text;
        string mark = markstxtbx.Text;
        string addrss = addresstxtbx.Text;
        string dept = dpttxtbx.Text;
        string cont = cntnotxtbx.Text;
        string strFPath = UploadImage();


        
        DataManager dm = new DataManager();

        if (RegistrationNumberExists(stid))
        {
            
            //ErrorMessageLabel.Text = "Registration number already exists. Please choose a different registration number.";
            ShowMessage("Registration number already exists");

            return;
        }



        dm.OpenSQLConnection();

        // Define the SQL query with parameters to prevent SQL injection
        string strquery = "INSERT INTO tbl_student (regno, sname, course, marks, address,department,contact_no,image) VALUES (@regno, @sname, @course, @marks, @address,@dept,@cont,@imagePath)";

       
        using (SqlCommand command = new SqlCommand(strquery, dm.myConn))
        {
            // Add parameters to the SqlCommand
            command.Parameters.AddWithValue("@regno", stid);
            command.Parameters.AddWithValue("@sname", stname);
            command.Parameters.AddWithValue("@course", course);
            command.Parameters.AddWithValue("@marks", mark);
            command.Parameters.AddWithValue("@address", addrss);
            command.Parameters.AddWithValue("@dept", dept);
            command.Parameters.AddWithValue("@cont", cont);
            command.Parameters.AddWithValue("@imagePath", strFPath);
            try
            {
                
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    ShowMessage("Registration is successful");
                    //Response.Redirect("signIn.aspx");
                }
                else
                {
  
                    //ErrorMessageLabel.Text = "Failed to insert data. Please try again.";
                    ShowMessage("Failed to insert data. Please try again");


                }
            }
            catch (Exception ex)
            {
              
                ErrorMessageLabel.Text = "An error occurred: " + ex.Message;
            }
            finally
            {
                
                dm.CloseConnection();
            }
        }
    }


    private bool RegistrationNumberExists(string regno)
    {
        
        DataManager dm = new DataManager();
        dm.OpenSQLConnection();

        string checkQuery = "SELECT COUNT(*) FROM tbl_student WHERE regno = @regno";

        
        using (SqlCommand checkCommand = new SqlCommand(checkQuery, dm.myConn))
        {
                      checkCommand.Parameters.AddWithValue("@regno", regno);
              int count = Convert.ToInt32(checkCommand.ExecuteScalar());
         
            return count > 0;
        }
    }



    #region UploadImage
    public string UploadImage()
    {
        try
        {
            string filename = System.IO.Path.GetFileName(filephoto.PostedFile.FileName);
            string randomno = DateTime.Now.Ticks.ToString();
            HttpPostedFile file = filephoto.PostedFile;
            if ((file != null) && (file.ContentLength > 0))
            {
                int iFileSize = file.ContentLength;
                if (iFileSize <= 2097152)
                {
                    string sImageFileExtension = filename.Substring(filename.LastIndexOf(".")).ToLower();
                    if (sImageFileExtension == ".gif" || sImageFileExtension == ".png" || sImageFileExtension == ".jpg" || sImageFileExtension == ".jpeg" || sImageFileExtension == ".bmp")
                    {
                        string newfilename = randomno + sImageFileExtension;

                        string strFPath = "~/RegPhoto/" + newfilename;
                        filephoto.PostedFile.SaveAs(Server.MapPath(strFPath));
                        lblPath.Text = strFPath;
                        return strFPath;
                    }
                    else
                    {
                        lblPath.Text = "Please Select Valid Photo";
                        return string.Empty;
                    }
                }
                else
                {
                    strFPath = CompressAndUploadPhoto(filephoto);
                    return strFPath;
                }
            }
            else
            {
                lblPath.Text = "Please Select Valid Photo";
                return string.Empty;
            }
        }
        catch (Exception ex)
        {
            ErrorMessageLabel.Text = "An error occurred: " + ex.Message;
            ex.Data.Clear();
            return string.Empty;
        }
    }
    #region CompressImage
    protected string CompressAndUploadPhoto(FileUpload FileUploadImg)
    {
        try
        {

            if (FileUploadImg.HasFile)
            {
                string filename = FileUploadImg.FileName;

                string directory = Server.MapPath("~/RegPhoto/");

                Bitmap originalBMP = new Bitmap(FileUploadImg.FileContent);

                int newWidth = 150;
                int newHeight = newWidth;

                double actualHeight = originalBMP.Height;
                double actualWidth = originalBMP.Width;
                double maxHeight = 600.0;
                double maxWidth = 800.0;
                double imgRatio = actualWidth / actualHeight;
                double maxRatio = maxWidth / maxHeight;
                double compressionQuality = 0.5;
                if (actualHeight > maxHeight || actualWidth > maxWidth)
                {
                    if (imgRatio < maxRatio)
                    {
                        imgRatio = maxHeight / actualHeight;
                        actualWidth = imgRatio * actualWidth;
                        actualHeight = maxHeight;
                    }
                    else if (imgRatio > maxRatio)
                    {
                        imgRatio = maxWidth / actualWidth;
                        actualHeight = imgRatio * actualHeight;
                        actualWidth = maxWidth;
                    }
                    else
                    {
                        actualHeight = maxHeight;
                        actualWidth = maxWidth;
                    }
                }

                newWidth = Convert.ToInt16(actualWidth);
                newHeight = Convert.ToInt16(actualHeight);
                Bitmap newBMP = new Bitmap(originalBMP, newWidth, newHeight);
                Graphics oGraphics = Graphics.FromImage(newBMP);
                oGraphics.SmoothingMode = SmoothingMode.AntiAlias; oGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

                oGraphics.DrawImage(originalBMP, 0, 0, newWidth, newHeight);

                Random rm = new Random();
                string randomno = rm.Next(11111, 99999).ToString();
                string sImageFileExtension = filename.Substring(filename.LastIndexOf(".")).ToLower();
                string newfilename = randomno + sImageFileExtension;
                string strPath = directory + randomno + sImageFileExtension;
                newBMP.Save(strPath);
                string strFPath = "~/RegPhoto/" + randomno + sImageFileExtension;
                originalBMP.Dispose();
                newBMP.Dispose();
                oGraphics.Dispose();
                return strFPath;
            }
            else
            {
                return string.Empty;
            }
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            Response.Redirect("../oops.aspx");
            return string.Empty;
        }
    }
    #endregion
    #endregion



    public SqlConnection connection { get; set; }




    public void ShowMessage(string msg)
    {
        String Message = "alert('" + msg + "');";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Message", Message, true);
    }

    private void ShowMessageAndRedirect(string msg, string url)
    {
        try
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("function Redirect()");
            sb.Append("{");
            sb.Append(" window.location.href='" + url + "'");
            sb.Append("}");
            sb.Append("alert('" + msg + "');");
            sb.Append("setTimeout('Redirect()',1000);");
            Response.Write("<script>" + sb + "</script>");
        }
        catch (Exception ex)
        {
            ex.Data.Clear();
            //Response.Redirect("oops.aspx");
        }
    }




    public string strFPath { get; set; }
}
