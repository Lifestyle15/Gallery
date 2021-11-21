<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Project2_ALBUM.SignUp" %>

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
                <asp:Label CssClass="title" ID="Label1" runat="server" Text="Sign Up"></asp:Label>
                <asp:Label ID="Label6" runat="server"></asp:Label>
            </div>            
            <br />
            <br />
            <div class="inputs">
                <asp:Label CssClass="labels" ID="Label2" runat="server" Text="Username:"></asp:Label>
                <asp:TextBox CssClass="inputText" ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Required!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label CssClass="labels" ID="Label3" runat="server" Text="Password:"></asp:Label>
                <asp:TextBox CssClass="inputText" ID="TextBox2" runat="server" TextMode="Password" ToolTip="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Required!" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label CssClass="labels" ID="Label4" runat="server" Text="Confirm Password:"></asp:Label>
                <asp:TextBox CssClass="inputText" ID="TextBox3" runat="server" TextMode="Password" ToolTip="Confirm password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Password do not match!" ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
            </div>
            <br />
            <br />
            <br />        
            <div class="btn-div">
                <asp:Button CssClass="btn-signup" ID="btnSignUp" runat="server" OnClick="btnSignUp_Click" Text="Sign Up" />
            </div>            
            <br />
        </div>
    </form>
</body>
</html>
