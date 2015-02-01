<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="SoldProperties.aspx.cs" Inherits="RealEstateWeb.SoldProperties" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-container-two-column">
        <p class="headerText">
            sold properties
        </p>
        <asp:ListView ID="ListViewImages" runat="server" OnItemDataBound="ListViewImages_ItemDataBound"
            OnPagePropertiesChanging="ListViewImages_PagePropertiesChanging" GroupItemCount="4">
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
                        <p>
                            <asp:Literal ID="litLocation" runat="server"></asp:Literal>
                        </p>
                        <p>
                            <asp:Image ID="PropertyImage" runat="server" />
                        </p>
                    </div>
                </td>
            </ItemTemplate>
        </asp:ListView>
        
        <p class="footerText">
            <asp:DataPager ID="ListingsPager" PageSize="12" runat="server" PagedControlID="ListViewImages"
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
