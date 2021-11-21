<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loggin.aspx.cs" Inherits="Project2_ALBUM.Loggin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Design.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-div">
            <div class="signup-label">
                <asp:Label CssClass="title" ID="Label1" runat="server" Text="Login"></asp:Label>
                <asp:Label ID="lblRespond" runat="server"></asp:Label>
            </div>            
            <br />
            <div class="inputs">
                <asp:Label CssClass="labels" ID="Label2" runat="server" Text="Username:"></asp:Label>
                <asp:TextBox CssClass="inputText" ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Required!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                <br />
                <asp:Label CssClass="labels" ID="Label3" runat="server" Text="Password:"></asp:Label>
                <asp:TextBox CssClass="inputText" ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Required!" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            </div>            
            <br />
            <br />
            <div class="btn-div">
                <asp:Button CssClass="btn-signup" ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
                <asp:Button ID="btnSign" runat="server" Text="Sign UP" />
                <br />
                <br />
               
            </div>            
            <br />
        </div>
    </form>
</body>
</html>
