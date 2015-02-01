<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="PropertyDetails.aspx.cs" Inherits="RealEstateWeb.PropertyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="Scripts/galleria/galleria-1.2.2.min.js"></script>
    <div id="content-container-two-column">
        <p class="headerText">
            <asp:Literal ID="LitPropertyHeaderDescription" runat="server"></asp:Literal>
        </p>
        <!-- -->
        <div id="property-detail-container">
            <div class="main-picture-container">
                <div id="galleria"/>
                </div>
            </div>
            <div class="container-details" >
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">General</a></li>
                        <li><a href="#tabs-2">Description</a></li>
                    </ul>
                    <div id="tabs-1">
                        <div class="container-general" >
                            <div class="property-id-wrap">
                                <asp:HiddenField ID="HdnPropertyId" runat="server" />
                                <asp:HiddenField ID="HdnPicturesURL" runat="server" />
                            </div>
                            
                            <p>
                            <asp:Label ID="lblAddress" runat="server" Text="Address:" CssClass="labelSmall"></asp:Label>
                            <asp:Literal ID="LitLocation" runat="server" />
                            </p>
                            <p>
                            <asp:Label ID="lblPrice" runat="server" Text="Price:" CssClass="labelSmall"></asp:Label>
                            <asp:Literal ID="LitPrice" runat="server" />
                            </p>

                            <p>
                            <asp:Label ID="lblBedrooms" runat="server" Text="Bedrooms:" CssClass="labelSmall"></asp:Label>
                            <asp:Literal ID="LitBedrooms" runat="server" />
                            </p>

                            <p>
                            <asp:Label ID="lblBathrooms" runat="server" Text="Bathrooms:" CssClass="labelSmall"></asp:Label>
                            <asp:Literal ID="LitBathrooms" runat="server" />
                            </p>

                            <p>
                            <asp:Label ID="lblMLSNumber" runat="server" Text="MLS Number:" CssClass="labelSmall"></asp:Label>
                            <asp:Literal ID="LitMLSId" runat="server" />
                            </p>

                            <p>
                            <asp:Label ID="lblStatus" runat="server" Text="Status:" CssClass="labelSmall"></asp:Label>
                            <asp:Literal ID="LitStatus" runat="server" />
                            </p>
                            
                            

                           
                        </div>
                        <div>
                                    <input type="button" name="cmdVirtualTour" value="More Pictures" class="button" onclick="ShowMorePictures();" />
                                    <input type="button" name="boBack" value="Go Back" class="button" onclick="javascript:history.back(); return false;" />
                                
                        </div>
                    </div>
                    <div id="tabs-2">
                    <div class="container-description">
                    <p>
                        <asp:Literal ID="LitDescription" runat="server" />
                        </p>
                        </div>
                        </div>
                </div>
            </div>
        </div>
        <div style="clear: both" />
    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            // Tabs
            $('#tabs').tabs();

            //Galleria.loadTheme('Scripts/galleria.twelve/twelve/galleria.twelve.min.js');
            Galleria.loadTheme('Scripts/galleria/themes/classic/galleria.classic.min.js');
            
            //debugger;
            var propertyid = $('.property-id-wrap input[type=hidden]').val();
            var urlstr = "PropertyDetails.aspx/GetPictures";
            $.ajax(
            {
                type: "POST",
                url: urlstr,
                data: "{'propertyid':'" + propertyid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                fail: OnError
            });

            function OnSuccess(data, status) {
                var resultdata = data.d;
                $('#galleria').galleria
                    ({
                        lightbox: true,
                        data_source: resultdata,
                        height: 300,
                        width: 500,
                        autoplay:5000
                    });
            }

            function OnError(request, status, error) {
                alert(error);
            }

        });
    </script>
</asp:Content>
