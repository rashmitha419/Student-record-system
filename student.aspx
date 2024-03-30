
<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/studentMaster.master" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="Webpages_Default3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=PreviewImage.ClientID%>').prop('src', e.target.result)
                        .width(105)
                        .height(105);
                 };
                 reader.readAsDataURL(input.files[0]);
                 }
             }
    </script>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
   <h1 style="color:blue; background-color:aqua; text-align:center">STUDENT REGISTRATION FORM</h1>
   <div class="row" style="color:black; text-align:center">
        <div class="col-md-4" ></div>
       <div  class="col-md-2">
           <asp:Label ID="Label1" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="lregno" runat="server" Text="Enter student regno: "></asp:Label></div>
       <div class="col-md-2">
            <asp:TextBox ID="regnotxtbx" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" controlToValidate="regnotxtbx" ErrorMessage="required"></asp:RequiredFieldValidator>

        </div>
       </div>
       <br />
       <div class="row" style="color:black; text-align:center">
        <div class="col-md-4" ></div>
       <div class="col-md-2" >
           <asp:Label ID="Label2" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="lsname" runat="server" Text="Enter student name: "></asp:Label></div>
          
       <div class="col-md-2" >
            <asp:TextBox ID="snametxtbx" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" controlToValidate="snametxtbx" ErrorMessage="required"></asp:RequiredFieldValidator>
        </div>
           </div>
    <br />
    <div class="row" style="color:black; text-align:center">
        <div class="col-md-4" ></div>
        
       <div class="col-md-2" >
           <asp:Label ID="Label3" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="lcouse" runat="server" Text="Enter course: "></asp:Label></div>
       <div class="col-md-2" >
            <asp:TextBox ID="coursetxtbx" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" controlToValidate="coursetxtbx" ErrorMessage="required"></asp:RequiredFieldValidator>
         </div>
        </div>
       <br />

    <div class="row" style="color:black; text-align:center">
        <div class="col-md-4" ></div>
       <div class="col-md-2" >
           <asp:Label ID="ldeptm" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="ldept" runat="server" Text="Enter department: "></asp:Label></div>
         <div class="col-md-2" >
            <asp:TextBox ID="dpttxtbx" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" controlToValidate="dpttxtbx" ErrorMessage="required"></asp:RequiredFieldValidator>
         </div>
        </div>
       <br />


      <div class="row" style="color:black; text-align:center">
        <div class="col-md-4" ></div>
       <div class="col-md-2" >
           <asp:Label ID="l" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="lcntno" runat="server" Text="Enter contactNo: "></asp:Label></div>
         <div class="col-md-2" >
            <asp:TextBox ID="cntnotxtbx" runat="server"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" controlToValidate="cntnotxtbx" ErrorMessage="required"></asp:RequiredFieldValidator>
         <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender" runat="server"
                                    Enabled="True" FilterType="Numbers" FilterMode="ValidChars" ValidChars="/,." TargetControlID="cntnotxtbx">
                                </cc1:FilteredTextBoxExtender>
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         </div>
          
        </div>
       <br />     
       


    <div class="row" style="color:black; text-align:center">
        <div class="col-md-4" ></div>
       <div class="col-md-2" >
           <asp:Label ID="Label4" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="marksl" runat="server" Text="Enter marks: "></asp:Label></div>
        <div class="col-md-2">
            <asp:TextBox ID="markstxtbx" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" controlToValidate="markstxtbx" ErrorMessage="required"></asp:RequiredFieldValidator>

         </div>
        </div>
       <br />
    <div class="row" style="color:black; text-align:center">
        <div class="col-md-4" ></div>
       <div class="col-md-2" >
           <asp:Label ID="Label5" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            <asp:Label ID="addressl" runat="server" Text="Enter address: "></asp:Label></div>
        <div class="col-md-2">   
         <asp:TextBox ID="addresstxtbx"  runat="server"></asp:TextBox></div>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" controlToValidate="addresstxtbx" ErrorMessage="required"></asp:RequiredFieldValidator>

         </div>


     <div class="row">  <div class="col-md-4"></div>
                        <div class="col-md-2 aligntext ">
                            <asp:Label ID="Label9" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lblPhoto" runat="server" style="color:black;" Text="Upload Image:" Font-Bold="true"></asp:Label>
                            <br />
                            <asp:Label ID="lblPho" runat="server" Text="(Once you select photo, Please Wait for upload)" Font-Size="9.5pt" Font-Bold="true" CssClass="LabelStyle" ForeColor="blue"></asp:Label>
                            <br />
                            <asp:Label ID="lblP" runat="server" Text="(only .jpg, .png, .jpeg formats allowed)" Font-Size="9.5pt" Font-Bold="true" CssClass="LabelStyle" ForeColor="blue"></asp:Label>
                        </div>
         <br/>
                        <div class="col-md-4">
                            <asp:FileUpload ID="filephoto" onchange="ShowImagePreview(this);" runat="server"></asp:FileUpload>
                            <a id="A2" runat="server" visible="false" target="_blank"></a>
                            <br />
                            <asp:Image ID="PreviewImage" runat="server" Width="140px" ImageUrl="../ASPX_Image/OIP.jpeg" />
                               
                         
                            <asp:Label ID="lblPath" runat="server" CssClass="LabelStyles" ForeColor="black" Visible="true"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="filephoto"
                                Enabled="true" CssClass="LabelStyleRequired" ErrorMessage="Upload Photo"
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </div>
                    </div>

    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-2">
    <asp:Label ID="ErrorMessageLabel" style="color:red;" runat="server" Text=""></asp:Label>
      </div>  
    </div>





    <br />
    <div class="row" style="color:black; text-align:center">
        <div class="col-md-4"></div>
        <div class="col-md-5">
            <asp:Button ID="resetbtn" onClick="resetbtn_Click" CausesValidation="false" CssClass="btn-info" runat="server" Text="reset" />
            
        <asp:Button ID="submitbtn"  onClick="submitbtn_Click" CssClass="btn-primary" runat="server" Text="submit" />
    </div>
    </div>



</asp:Content>

