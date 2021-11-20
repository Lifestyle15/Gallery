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
        <div style="height: 944px; width: 1183px">
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
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="157px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="272px" OnSelectionChanged="Calendar1_SelectionChanged">
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
            <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="PhotoID"   Height="47px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatDirection="Horizontal" Width="272px" OnItemCommand="DataList1_ItemCommand"  >  
               
                <EditItemTemplate>
                    <asp:Label ID="lblPhotoID" runat="server" Text='<%# Eval("PhotoID") %>' Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="lblTag" runat="server" Text='Tag:'></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtUpdateTags" runat="server" Text='<%# Eval("Tags") %>'></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Label ID="lblLocation" runat="server" Text='Location:'></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <asp:TextBox ID="txtUpdateLoca" runat="server" Text='<%# Eval("Geolocation") %>'></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Label ID="lblDate" runat="server" Text='Captured Date:'></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtUpdateDate" runat="server" Text='<%# Eval("Captured_Date") %>'></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lblCapuredBy" runat="server" Text='Captured By:'></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtUpdateBy" runat="server" Text='<%# Eval("Captured_By") %>'></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" CommandName="submit" Text="Submit" />
                    <asp:Button ID="Button2" runat="server" CommandName="cancel" Text="Cancel" />
                    <br />
                </EditItemTemplate>
                <ItemTemplate>
                    <a id="imageLink" href='<%# Eval("Photo_Name") %>' title='<%#Eval("Tags") %>'  rel ="lightbox[Brussels]" runat="server">
                        <asp:Image ID="Image1" ImageUrl='<%# Bind("Photo_Name") %>' runat="server" Width="138px" Height="125px" />
                    </a>

                    &nbsp;
                    
                    <br />
                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("PhotoID") %>' Visible="False"></asp:Label>
                    <br />

                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Photo_Name") %>'></asp:Label>

                    <br />
                    <asp:Button ID="btnDelete" runat="server"  Text="Delete" CommandName="delete" />

                    &nbsp;
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="update" />

                    &nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Link") %>' CommandName="Download" Text="Download"></asp:LinkButton>

                    <br />
                    
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WebForm1.aspx?ImageURL=((Image1)sender).ImageUrl" Text='<%# Eval("Photo_Name") %>'></asp:HyperLink>
                    
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Photo]"></asp:SqlDataSource>
            <br />
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />

            

            <asp:TextBox ID="txtSerach" runat="server" BorderStyle="Dotted" OnTextChanged="txtSerach_TextChanged"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label6" runat="server"></asp:Label>
            </div>
    </form>
</body>
</html>
