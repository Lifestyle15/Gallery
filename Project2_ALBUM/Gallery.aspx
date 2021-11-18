<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Project2_ALBUM.Gallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
    <script type="text/javascript" src="js/prototype.js"></script>
    <script type="text/javascript" src="js/scriptaculous.js?load=effects"></script>
    <script type="text/javascript" src="js/lightbox.js"></script>
        <title></title>
    <style type="text/css">
        .style1 {
            width:100%
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 724px; width: 1183px">
            &nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Choose  Image:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload1" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Tags:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtTags" runat="server"></asp:TextBox>
            <br />
            <br />
&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Location:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
            <br />
&nbsp;
            <br />
&nbsp;
            <asp:Label ID="Label4" runat="server" Text="Date Captured:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
&nbsp;&nbsp;
            
            <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImageButton1_Click" Height ="50px" Width="50" ImageUrl="~/Calender/calender.jpg" />
            
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px" OnSelectionChanged="Calendar1_SelectionChanged">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
            <br />
            <br />
&nbsp;
            <asp:Label ID="Label5" runat="server" Text="Captured By:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtCaptured" runat="server"></asp:TextBox>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnUpload" runat="server" OnClick="Button1_Click" Text="Upload" />
            <br />
            <br />
            <asp:Label ID="lbIndicator" runat="server" Visible="False"></asp:Label>
            &nbsp;
            <asp:DataList ID="DataList1" runat="server" DataKeyField="PhotoID" DataSourceID="SqlDataSource1" Height="47px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatDirection="Horizontal" Width="272px">
                <ItemTemplate>
                    <a id="imageLink" href='<%# Eval("Photo_Name") %>' title='<%#Eval("Tags" ) %>'  rel ="lightbox[Brussels]" runat="server">
                        <asp:Image ID="Image1" ImageUrl='<%# Bind("Photo_Name") %>' runat="server" Width="112" Height="84" />
                    </a>

                    <br />

                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Photo]"></asp:SqlDataSource>
            <br />
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
            <asp:TextBox ID="txtSerach" runat="server" BorderStyle="None" OnTextChanged="txtSerach_TextChanged"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSearch0" runat="server" OnClick="btnSearch_Click" Text="Search" />
            </div>
    </form>
</body>
</html>
