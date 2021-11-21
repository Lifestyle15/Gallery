<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Project2_ALBUM.Gallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
    <script type="text/javascript" src="js/prototype.js"></script>
    <script type="text/javascript" src="js/scriptaculous.js?load=effects"></script>
    <script type="text/javascript" src="js/lightbox.js"></script>
        <title></title>
    <link rel="stylesheet" href="Gallery.css">
</head>
<body>
    <form id="form1" runat="server" class="main-form">
        <div style="height: 944px; width: 1183px" class="main-div">

            <%--div for top nav--%>
            <div class="top-nav">
                <asp:Label ID="lblDetails" runat="server"></asp:Label>
                <br />
                <asp:Button ID="btnLog" runat="server" OnClick="btnLog_Click" Text="Log Out" />    
            </div>

            <%--main content--%>
            <div class="main-content">

                <%--left side--%>
                <div class="'left-side">
                    <asp:Label ID="Label1" runat="server" Text="Choose  Image:"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
            
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Discription:"></asp:Label>
                    <asp:TextBox ID="txtTags" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btnUpload" runat="server" OnClick="Button1_Click" Text="Upload" />
                </div>
                
                <%--right side--%>
                <div class="'right-side">
                    <asp:Label ID="lbIndicator" runat="server" Visible="False"></asp:Label>
                    <asp:DataList CssClass="datalist" ID="DataList1" runat="server" CellPadding="4" DataKeyField="PhotoID"   Height="47px"  RepeatDirection="Horizontal" Width="325px" OnItemCommand="DataList1_ItemCommand" style="margin-top: 0px"  >  
               
                        <EditItemTemplate>
                            <asp:Label ID="lblID" runat="server" Text='<%# Eval("PhotoID") %>' Visible="False"></asp:Label>
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
                            <asp:Button ID="Button1" runat="server" CommandName="update" Text="Update" />
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
                            <asp:Button ID="btnUpdate" runat="server" Text="Edit" CommandName="edit" Width="56px" />

                            &nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Photo_Name") %>' CommandName="Download" Text="Download"></asp:LinkButton>

                            <br />
                    
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Photo]"></asp:SqlDataSource>
                    <br />
                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />

            

                    <asp:TextBox ID="txtSerach" runat="server" BorderStyle="Dotted" ></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server"></asp:Label>
                </div>
                
            </div>            
        </div>
    </form>
</body>
</html>
