<%@ Page Title="" Language="C#" MasterPageFile="~/Authenticated/Master/PropertyMaster.master" AutoEventWireup="true"
    CodeBehind="PropertyDetailManagement.aspx.cs" Inherits="RealEstateWeb.PropertyDetailManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ChildContent1" runat="server">
<script type="text/javascript" src="../Scripts/jquery.numeric.js"></script>
<script language="javascript" type="text/javascript">
    $(function () {
           $('#ContentPlaceHolder1_ChildContent1_txtPrice').numeric();
    });
       
    </script>
    <div class="masterchildcontainer" >
        <div id="main">
            <h1 id="lead">
                <span class="section"></span>General Information</h1>
            <div id="subForm">
                <p>
                    <label for="txtMLSId" class="label">
                       * MLS Number:</label>
                    <asp:TextBox ID="txtMLSId" runat="server"  CssClass="textClass smallwidth"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMLS" runat="server" ErrorMessage="MLS is a required field" Display="Dynamic" ControlToValidate="txtMLSId" ForeColor="Red">Required</asp:RequiredFieldValidator>
                </p>
                <p>
                    <label for="drpBathrooms" class="label">
                        Bathrooms:</label>
                    <asp:DropDownList ID="drpBathrooms" runat="server" CssClass="textClass extrasmallwidth">
                    </asp:DropDownList>
                </p>
                <p>
                    <label for="drpBedrooms" class="label">
                        Bedrooms:</label>
                    <asp:DropDownList ID="drpBedrooms" runat="server" CssClass="textClass extrasmallwidth">
                    </asp:DropDownList>
                </p>
                <p>
                    <label for="txtPrice" class="label">
                        * Price:</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="textClass smallwidth"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ErrorMessage="Price is a required field" Display="Dynamic" ControlToValidate="txtPrice" ForeColor="Red">Required</asp:RequiredFieldValidator>
                </p>
                <p>
                    <span class="label">Status:</span>
                    <asp:RadioButton ID="rdActive" runat="server" GroupName="StatusGroup" Text="On Sale" CssClass="textClass extrasmallwidth" />
                    <asp:RadioButton ID="rdInactive" runat="server" GroupName="StatusGroup" Text="Sold" CssClass="textClass extrasmallwidth" />
                    <asp:RadioButton ID="rdHold" runat="server" GroupName="StatusGroup" Text="On Hold" CssClass="textClass extrasmallwidth" />
                </p>
                <p>
                    <label for="txtStreetAddress" class="label">
                        * Address:</label>
                    <asp:TextBox ID="txtStreetAddress" runat="server" CssClass="textClass largewidth"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is a required field" Display="Dynamic" ControlToValidate="txtStreetAddress" ForeColor="Red">Required</asp:RequiredFieldValidator>
                </p>
                <p>
                    <label for="drpCountry" class="label">Country:</label>
                    <asp:DropDownList ID="drpCountry" runat="server" CssClass="textClass mediumwidth"></asp:DropDownList>
                </p>
                
                <p>
                    <label for="drpState" class="label">
                        State/Province:</label>
                   <asp:DropDownList ID="drpState" runat="server" CssClass="textClass mediumwidth"></asp:DropDownList>
                    
                </p>

                <p>
                    <label for="txtCity" class="label">
                        * City/Town:</label>
                    <asp:TextBox ID="txtCity" runat="server"  CssClass="textClass mediumwidth"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City is a required field" Display="Dynamic" ControlToValidate="txtCity" ForeColor="Red">Required</asp:RequiredFieldValidator>
                </p>
                <p>
                    <label for="zip" class="label">
                        Zip:</label>
                    <asp:TextBox ID="txtZip" runat="server"  CssClass="textClass smallwidth"></asp:TextBox>
                </p>
                <p>
                    <label for="neighborhood" class="label">
                        * Neighborhood:</label>
                    <asp:TextBox ID="txtNeighborhood" runat="server"  CssClass="textClass largewidth"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNeighborhood" runat="server" ErrorMessage="Neighborhood is a required field" Display="Dynamic" ControlToValidate="txtNeighborhood" ForeColor="Red">Required</asp:RequiredFieldValidator>
                </p>
                <p>
                    <label for="mlslink" class="label">
                        * MLS Link:</label>
                    <asp:TextBox ID="txtMLSUrl" runat="server" CssClass="textClass largewidth"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMLSUrl" runat="server" ErrorMessage="MLS Link is a required field" Display="Dynamic" ControlToValidate="txtMLSUrl" ForeColor="Red">Required</asp:RequiredFieldValidator>
                </p>
                <p>
                    <label for="virtualtourlink" class="label">
                        Virtual Tour Link:</label>
                    <asp:TextBox ID="txtVirtualTour" runat="server" CssClass="textClass largewidth"></asp:TextBox>
                </p>
                <p>
                    <label for="comments" class="label">
                        * Description:
                    </label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="textClass multilinewidth" TextMode="MultiLine"
                        MaxLength="1000"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="Description is a required field" Display="Dynamic" ControlToValidate="txtDescription" ForeColor="Red">Required</asp:RequiredFieldValidator>
                </p>
                <p style="text-align:center;">
                    <asp:Label ID="lblSuccess" class="successmessage" runat="server" Text=""></asp:Label>
                </p>
                <p>
                    <asp:Button ID="cmdSaveProperty" CssClass="button" runat="server" Text="Save" Style="margin-left: 160px" OnClick="cmdSaveProperty_Click" />
                    <asp:Button ID="cmdCancel" CssClass="button" runat="server" Text="Cancel" Style="margin-left: 3px" onclick="cmdCancel_Click"  causesvalidation="false"/>
                </p>
            </div>
        </div>
        <div style="clear: both;"></div>
    </div>
    <!-- end main -->
</asp:Content>
