<%@ Page Title="" Language="C#" MasterPageFile="~/Authenticated/Master/ChildMaster.master" AutoEventWireup="true"
    CodeBehind="PropertyListingManagement.aspx.cs" Inherits="RealEstateWeb.PropertyListingManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="server">
    <div class="masterchildcontainer" >
        <div style="float: left; margin:3px 10px 10px 10px;">
            <asp:DropDownList ID="drpStatusFilter" runat="server" AutoPostBack="True" 
                CssClass="textClass mediumwidth" 
                onselectedindexchanged="drpStatusFilter_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div style="float:right; text-align:right; width:150px; margin:3px 10px 10px 0px;">
        <asp:Button ID="cmdAddProperty" CssClass="button" runat="server" 
            Text="Add Property" onclick="cmdAddProperty_Click" />
        </div>

        <div style="margin-bottom:10px; margin-left:10px; clear:both;">
        <asp:GridView ID="GrdPropertyList" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333"
            GridLines="None" AllowPaging="True" OnPageIndexChanging="GrdPropertyList_PageIndexChanging"
            OnRowDataBound="GrdPropertyList_RowDataBound" 
                onrowcommand="GrdPropertyList_RowCommand">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="PropertyId" HeaderText="Id" Visible="False" />

                <asp:TemplateField HeaderText="Edit" HeaderStyle-Width="50px" ItemStyle-Width="50px">
                    <ItemTemplate>
                        <asp:ImageButton ID="EditButton" runat="server" ImageUrl="~/images/Application/Icons/appbar_edit_rest_48428C8C.png" Width="40px" Height="35px"  CommandName="EditItem" CommandArgument='<%# Eval("PropertyId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                
                <asp:TemplateField HeaderText="Delete"  HeaderStyle-Width="50px" ItemStyle-Width="50px">
                    <ItemTemplate>
                        <asp:ImageButton ID="DeleteButton" runat="server" ImageUrl="~/images/Application/Icons/appbar_delete_rest_147A963B.png"  Width="40px" Height="35px" CommandName="DeleteItem" CommandArgument='<%# Eval("PropertyId") %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="MLS" HeaderStyle-Width="70px" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblMLS" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                
                <asp:TemplateField HeaderText="Status" HeaderStyle-Width="70px" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Street Address"  HeaderStyle-Width="365px" ItemStyle-Width="365px" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblStreetAddress" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Neighborhood"  HeaderStyle-Width="150px" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblLocation" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price"  HeaderStyle-Width="150px" ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="StatusId" HeaderText="StatusId" Visible="False" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        </div>
        
    </div>
</asp:Content>
