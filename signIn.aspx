<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/signIn.master" AutoEventWireup="true" CodeFile="signIn.aspx.cs" Inherits="Webpages_signIn" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid" style="border:5px solid black; width:800px; height:400px;">
        <br />
        <br />
        
        <div class="row">
            <div class="col-md-4"></div>
             <div class="col-md-2" style="color:black">
                 <asp:Label ID="Label2" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
             <asp:Label ID="lemail" runat="server" Text="E-mail:"></asp:Label></div>
                   <div class="col-md-5">
                   <asp:TextBox ID="mailtxtbx" cssClass="form-control" runat="server"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid e-mail"  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" controlToValidate="mailtxtbx"></asp:RegularExpressionValidator>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="enter email" controlToValidate="mailtxtbx" ></asp:RequiredFieldValidator>

                   </div>
            </div>
        
      </br>

             <div class="row" >
            <div class="col-md-4"></div>
             <div class="col-md-2" style="color:black">
                 <asp:Label ID="ldeptm" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
             <asp:Label ID="lpassword" runat="server" Text="password:"></asp:Label></div>
                 <div class="col-md-5">
              <asp:TextBox ID="pwtxt" cssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="enter password" controlToValidate="pwtxt" ></asp:RequiredFieldValidator>
                </div>
             </div>
<br/>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <div class="row">
        <div class="col-md-4"></div>
            <div class="col-md-2" style="color:black;">
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="red" Font-Bold="true"></asp:Label>
            enter the captcha:</div>
            <div class="col-md-6" style="color:blue;">
                
                <asp:Label ID="labelstpspam" runat="server" Text=""></asp:Label>
               
                <asp:TextBox ID="Textstopspam"  runat="server"></asp:TextBox>

                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" OnClick="LinkButton2_Click">
                <i style="font-size:21px;" class="fa fa-refresh"></i></asp:LinkButton>
            </div>
            </div>

</ContentTemplate>
</asp:UpdatePanel>

        <br />
        <br />

        <div class="row" style="text-align:center;">
            <div class="col-md-4" ></div>
            <div class="col-md-6" >

                <asp:Button ID="resetbtn" cssClass="btn-primary" CausesValidation="false" OnClick="resetbtn_Click" runat="server" Text="Reset" />
            <asp:Button ID="signInbtn" cssClass="btn-primary" OnClick="signInbtn_Click" runat="server" Text="SIGNIN" />

                 

                <asp:Label ID="lable" cssClass="alert-danger" runat="server" Text=""></asp:Label>

            </div>
            </div>
<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4">
    <asp:LinkButton ID="LinkButton1" runat="server">forget password?</asp:LinkButton>
    </div>
 </div>
   
</div>
    </br>
</asp:Content>

