<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="RealEstateWeb.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="Scripts/jquery.maskedinput-1.2.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {

            $("#ContentPlaceHolder1_txtMailPhone").mask("(999) 999-9999");
        });
        
    </script>
    <div id="content-container-three-column">
        <!--

  CONTENT SIDE 1 COLUMN

  -->
        <div id="content-side1-three-column">
            <span>&nbsp;</span>
        </div>
        <!--

  CENTER COLUMN

  -->
        <div id="content-main-three-column">
            <div id="subForm">
                <h1>
                    <asp:Literal ID="LitAgentName" runat="server"></asp:Literal></h1>
                <h3>
                    <asp:Literal ID="LitAgencyName" runat="server"></asp:Literal></h3>
                <p>
                    <asp:Literal ID="LitAddressLine1" runat="server"></asp:Literal>
                    <asp:Literal ID="LitProvinceState" runat="server"></asp:Literal>
                </p>
                <p>
                    Cellphone:
                    <asp:Literal ID="LitPhoneCel" runat="server"></asp:Literal>
                </p>
                <p>
                    Office:
                    <asp:Literal ID="LitPhone1" runat="server"></asp:Literal>
                </p>
                <p>
                    Fax:
                    <asp:Literal ID="LitFax" runat="server"></asp:Literal>
                </p>
                <hr />
                <h3>
                    Contact Form
                </h3>
                <p>
                    <asp:Label ID="lblMailName" runat="server" Text="* Name:" CssClass="labelSmall"></asp:Label>
                    <asp:TextBox ID="txtMailName" runat="server" CssClass="textClass mediumwidth"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtMailName"
                        ErrorMessage="* Required" CssClass="errorMessage" Display="Dynamic" SetFocusOnError="true">* Required</asp:RequiredFieldValidator>
                </p>
                <p>
                    <asp:Label ID="lblEMail" runat="server" Text="* Email:" CssClass="labelSmall"></asp:Label>
                    <asp:TextBox ID="txtMailEmail" runat="server" CssClass="textClass smallwidth"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtMailEmail"
                      CssClass="errorMessage"  Display="Dynamic" ErrorMessage="* Email is required" SetFocusOnError="true">* Required</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtMailEmail"
                        ErrorMessage="Enter a valid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        CssClass="errorMessage" Display="Dynamic">* Invalid e-mail</asp:RegularExpressionValidator>
                </p>
                <p>
                    <asp:Label ID="lblMailPhone" runat="server" Text="Phone:" CssClass="labelSmall"></asp:Label>
                    <asp:TextBox ID="txtMailPhone" runat="server" CssClass="textClass smallwidth"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtMailPhone"
                        ErrorMessage="Enter a valid phone number" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                        CssClass="errorMessage" Display="Dynamic">* Required</asp:RegularExpressionValidator>
                </p>
                <p>
                    <asp:Label ID="lblMailSubject" runat="server" Text="Subject:" CssClass="labelSmall"></asp:Label>
                    <asp:DropDownList ID="drpMailIssue" runat="server" CssClass="textClass mediumwidth">
                        <asp:ListItem Value="FreeHomeEvaluation">Free Home Evaluation</asp:ListItem>
                        <asp:ListItem Value="Buyingproperty">Buying a property</asp:ListItem>
                        <asp:ListItem Value="SellingProperty">Selling a Property</asp:ListItem>
                        <asp:ListItem Value="General_Question">General Question</asp:ListItem>
                        <asp:ListItem>Comment or Suggestion</asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    <asp:Label ID="lblContactby" runat="server" Text="Contact me:" CssClass="labelSmall"></asp:Label>
                    <asp:RadioButton ID="rdContact1" runat="server" GroupName="MailOption" Text="Email" />&nbsp;
                    <asp:RadioButton ID="rdContact2" runat="server" GroupName="MailOption" Text="Telephone" />
                </p>
                <p>
                    <asp:Label ID="lblMailComment" runat="server" Text="* Comment:" CssClass="labelSmall"></asp:Label>
                </p>
                <p>
                    <asp:TextBox ID="txtMailComment" runat="server" TextMode="MultiLine" CssClass="textMultilineClass"></asp:TextBox>
                </p>
                <p>
                    <asp:RequiredFieldValidator ID="rfvComments" runat="server" ControlToValidate="txtMailComment"
                        ErrorMessage="Comment is required" CssClass="errorMessage" Display="Dynamic">* Required</asp:RequiredFieldValidator>
                </p>
                <p style="text-align: center">
                    <asp:Label ID="lblResultMail" runat="server" Text="Label"></asp:Label>
                </p>
                <p>
                    <asp:Button ID="cmdSendMail" CssClass="button" runat="server" OnClick="cmdSendMail_Click"
                        Text="Send Mail" OnClientClick="javascript:$get('ContentPlaceHolder1_lblResultMail').innerText='';" />
                </p>
            </div>
        </div>
        <div id="content-side2-three-column">
            &nbsp;</div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
