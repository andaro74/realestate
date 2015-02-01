<%@ Page Title="" Language="C#" MasterPageFile="~/Authenticated/Master/PropertyMaster.master" AutoEventWireup="true"
    CodeBehind="PictureListManagement.aspx.cs" Inherits="RealEstateWeb.PictureListManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="server">
    <div class="masterchildcontainer">
        <h1 id="lead">
            <span class="section"></span>Propety Pictures</h1>
        <div id="uploadContainer" class="picUpload">
            <p>
                <asp:Label ID="lblInstructionTitle" CssClass="label" runat="server">Instructions: </asp:Label>
                <asp:Label ID="lblInstructions" runat="server"></asp:Label>
            </p>
            <p>
                <asp:Label ID="ImageTitle" CssClass="label" runat="server" AssociatedControlID="ImageTitleText">Image Title:</asp:Label>
                <asp:TextBox ID="ImageTitleText" CssClass="textClass mediumwidth" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="ImageValue" CssClass="label" runat="server" AssociatedControlID="ImageValueFile">* Image:</asp:Label>
                <asp:FileUpload ID="ImageValueFile" runat="server" />
                <asp:RequiredFieldValidator ID="rfvFileUpload" runat="server" ErrorMessage="FileUpload is a required field"
                    Display="Dynamic" ControlToValidate="ImageValueFile" ForeColor="Red">Image is required</asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Button ID="Submit" CssClass="button" Style="margin-left: 160px" runat="server"
                    Text="Upload" OnClick="Submit_Click" />
            </p>
            <p style="text-align: center;">
                <asp:Label ID="lblSubmitResult" class="successmessage" runat="server" Text=""></asp:Label>
            </p>
        </div>
        <div class="picscontainer">
            <!--CONTENT MAIN COLUMN-->
            <asp:ListView ID="ListViewImages" runat="server" OnItemDataBound="ListViewImages_ItemDataBound"
                GroupItemCount="4">
                <LayoutTemplate>
                    <table cellpadding="2" runat="server" id="tblImages">
                        <tr runat="server" id="groupPlaceholder" />
                    </table>
                </LayoutTemplate>
                <GroupTemplate>
                    <tr runat="server" id="ImagesRow">
                        <td runat="server" id="itemPlaceholder" />
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td id="Td1" align="center" runat="server">
                        <div class="piccontainer">
                            <p style="text-align: left; margin-left: 10px;">
                                <asp:Literal ID="litNumber" runat="server"></asp:Literal>
                                <asp:Literal ID="litTitle" runat="server"></asp:Literal>
                            </p>
                            <p style="text-align: center;">
                                <asp:Image ID="PropertyImage" runat="server" Width="205px" Height="160px" />
                            </p>
                            <p>
                                <asp:CheckBox ID="chkIsMain" runat="server" Text="Is Main" TextAlign="Left" />
                                <asp:CheckBox ID="chkDelete" runat="server" Text="Delete" TextAlign="Left" />
                            </p>
                            <p>
                                <asp:CheckBox ID="chkShow" runat="server" Text="Gallery" TextAlign="Left" />
                                <asp:Label runat="server" ID="lblOrder" Text="Order"></asp:Label>
                                <asp:DropDownList ID="drpOrder" runat="server">
                                </asp:DropDownList>
                                <asp:HiddenField ID="hdnPictureId" runat="server" />
                            </p>
                        </div>
                    </td>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div style="float: left; clear: left; width: 90%;">
            <p style="text-align: center;">
                <asp:Label ID="lblSuccess" runat="server" Text="Label" CssClass="successmessage"></asp:Label>
            </p>
            <div style="float: left; margin-bottom: 3px; margin-top: 10px; margin-left: 10px;">
                <asp:Label ID="lblError" runat="server" Text="Label" ForeColor="Red"></asp:Label>
            </div>
        </div>
        <div style="float: right; clear: left; margin-bottom: 10px; margin-top: 10px; margin-right: 10px;">
            <asp:Button ID="cmdCancel" CssClass="button" runat="server" Text="Cancel" Style="margin-right: 10px"
                OnClick="cmdCancel_Click" CausesValidation="false" />
            <asp:Button ID="cmdSaveImagesChanges" CssClass="button" runat="server" Text="Save"
                OnClick="cmdSaveImagesChanges_Click" CausesValidation="false" />
        </div>
        <div style="clear: both;">
        </div>
    </div>
</asp:Content>
