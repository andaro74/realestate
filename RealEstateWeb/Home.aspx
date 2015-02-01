<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="RealEstateWeb.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="Scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.galleryview-1.1.js"></script>
    <script type="text/javascript" src="Scripts/jquery.timers-1.1.2.js"></script>
    <script type="text/javascript" src="Scripts/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="Scripts/quotator/quotator.js"></script>
    <script type="text/javascript">
    
        jQuery(document).ready(function () {
            jQuery('#photos').galleryView({
                panel_width: 760,
                panel_height: 300,
                transition_speed: 350,
                transition_interval: 8000,
                nav_theme: 'light',
                border: '3px solid black',
                pause_on_hover: true,
                overlay_height: 40
            });

            $("#quotes").quotator({
                speed: 15000,
                json: "Scripts/quotator/quotator_quotes.js"
            });
        });
    </script>
   
    <div id="poster-photo-container">
        <div id="photos" class="galleryview">
            <div class="panel">
                <img src="images/Application/GalleryView/005liv2Large.jpg" alt="" />
                <div class="panel-overlay">
                    <p style="color:White">&quot;The perfect place for you&quot;</p>
                </div>
            </div>
            <div class="panel">
                <img src="images/Application/GalleryView/008din1Large.jpg" alt="" />
                <div class="panel-overlay">
                    <p style="color:White">&quot;Start creating wondeful memories&quot;</p>
                </div>
            </div>
            <div class="panel">
                <img src="images/Application/GalleryView/013kit3Large.jpg" alt="" />
                <div class="panel-overlay">
                    <p style="color:White">&quot;Enjoy time for doing what you love&quot;</p>
                </div>
            </div>
            <div class="panel">
                <img src="images/Application/GalleryView/026master3Large.jpg" alt="" />
                <div class="panel-overlay">
                    <p style="color:White">&quot;A beautiful property is waiting for you&quot;</p>
                </div>
            </div>
        </div>
        <div id="feature-area-home">
            <img src="images/Application/MonicaRetouched.jpg" alt="" />
        </div>
    </div>
    <!--

CONTENT CONTAINER

-->
    <div id="content-container-two-column">
        <!--CONTENT MAIN COLUMN-->
        <div id="content-main-two-column">
            <h2>
                Welcome</h2>
            <p style='padding: 5px,5px, 5px, 5px'>
                Buying or selling a house is one of the most important decisions of your life. My promise is to have your house ready for selling. I will explain you every step of our marketing plan, we
                will work together to ensure maximum exposure of your home. We want to sell your house soon at the highest possible price.
            </p>
            <div id="three-column-container">
                <div id="three-column-side1">
                    <h3 class="three-column-container-titles">
                        Buyers</h3>
                    <br />
                    <p style="width: 190px">
                        I will show you a variety of homes that you can choose from, because the most important
                        thing to me is that my clients are satisfied with their investment; knowing that they bought the best
                        property according to their needs and budget.</p>
                </div>
                <div id="three-column-side2">
                    <h3 class="three-column-container-titles">
                        Contact Me</h3>
                    <br />
                    <p style="width: 190px">
                        I know there are several questions to be answered when a client wants to buy or
                        sell a property. Let me help you to answer these questions and start looking the
                        right buyer or property for you.</p>
                </div>
                <div id="three-column-middle">
                    <h3 class="three-column-container-titles">
                        Sellers</h3>
                    <br />
                    <p style="width: 190px">
                         While most agents promise to sell your house fast for the best price.
                         I strive to provide my clients the most outstanding service from the moment we sign the agreement until
                        you are certain that you are happy with your new home.</p>
                </div>
            </div>
        </div>
        <!--

CONTENT SIDE COLUMN

-->
        <div id="content-side-two-column" >
            
            <div id="quotes">
            </div>
         
          </div>
        <div class="clear">
        
        </div>
    </div>
</asp:Content>
