<%@ Page EnableEventValidation="false" Title="" Language="C#" MasterPageFile="~/Master/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="Listings.aspx.cs" Inherits="RealEstateWeb.Listings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-container-two-column">
        <p class="headerText">
            available properties
        </p>
        <!--CONTENT MAIN COLUMN-->
        <asp:ListView ID="ListViewProperties" runat="server" OnItemDataBound="ListViewProperties_ItemDataBound"
            OnPagePropertiesChanging="ListViewProperties_PagePropertiesChanging">
            <LayoutTemplate>
                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="main-picture-container">
                    <asp:HyperLink ID="lnkPicture" runat="server"><asp:Image ID="LitImgMainHouse" runat="server" class="main-picture" /></asp:HyperLink>
                    
                </div>
                <div class="basic-information">
                    <div id="price">
                        <asp:Literal ID="LitPrice" runat="server" />
                    </div>
                    <div id="location">
                        <asp:Literal ID="LitLocation" runat="server" />
                    </div>
                    <div id="bedroom">
                        <span>
                            <asp:Literal ID="LitBedrooms" runat="server" /></span> Bedrooms <span>
                                <asp:Literal ID="LitBathrooms" runat="server" /></span> Bath
                    </div>
                    <div id="mls">
                        <asp:HiddenField ID="HdnPropertyId" runat="server" />
                        <asp:HyperLink ID="hyperLinkMLS" runat="server">
                            <asp:Literal ID="LitMLSId" runat="server" /></asp:HyperLink>
                    </div>
                    <div id="propertydescription">
                        <asp:Literal ID="LitDescription" runat="server" />
                    </div>
                    <div id="viewdetails">
                        <asp:HyperLink ID="hyperLinkViewDetails" runat="server">View Details</asp:HyperLink>
                    </div>
                </div>
            </ItemTemplate>
            <ItemSeparatorTemplate>
            </ItemSeparatorTemplate>
        </asp:ListView>
        <div style="clear: both">
            <p class="footerText">
                <asp:DataPager ID="ListingsPager" PageSize="8" runat="server" PagedControlID="ListViewProperties"
                    OnPreRender="ListingsPager_PreRender">
                    <Fields>
                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowNextPageButton="False"
                            ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False"
                            ShowPreviousPageButton="False" />
                        <asp:TemplatePagerField>
                        </asp:TemplatePagerField>
                    </Fields>
                </asp:DataPager>
            </p>
        </div>
</asp:Content>
