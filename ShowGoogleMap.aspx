<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="ShowGoogleMap.aspx.cs" Inherits="ShowGoogleMap" %>

<asp:Content ContentPlaceHolderID="head" runat="server" ID="headerholder">

    <script src="Scripts/myScript/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="Scripts/myScript/bootstrap.min.css">
    <link rel="stylesheet" href="Scripts/myScript/bootstrap-theme.min.css">
    <script src="Scripts/myScript/bootstrap.min.js"></script>

    <%--<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>--%>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk--%>
    <style type="text/css">
        html {
            height: 200%;
        }

        body {
            height: 200%;
            margin: 0;
            padding: 0;
        }

        #map_canvas {
            height: 200%;
        }
    </style>
    <script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6v5-2uaq_wusHDktM9ILcqIrlPtnZgEk&sensor=false">
    </script>
    <script type="text/javascript">
        function initialize() {
            //alert("OK");
            var lat = document.getElementById('MainContent_txtlat').value;
            var lon = document.getElementById('MainContent_txtlong').value;
            //alert(lat);
            var myLatlng = new google.maps.LatLng(lat, lon) // This is used to center the map to show our markers
            var mapOptions = {
                center: myLatlng,
                zoom: 15,
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                marker: true
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
            var marker = new google.maps.Marker({
                position: myLatlng
            });
            marker.setMap(map);
        }
    </script>


    <h2></h2>
    <div>
        <asp:HiddenField ID="hdn_lat" runat="server" />
        <asp:HiddenField ID="hdn_long" runat="server" />

        <%--    <asp:TextBox ID="txtLocation" runat="server" Text=""></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="FindCoordinates" />--%>
        <br />
        <br />

        <table>
            <tr>
                <td>Enter Latitude:</td>
                <td>
                    <input type="text" id="txtlat" value="" runat="server" />
                </td>
                <%--19.1038348--%>
            </tr>
            <tr>
                <td>Enter Longitude:</td>
                <td>
                    <input type="text" id="txtlong" value="" runat="server" />
                </td>
                <%--72.9134927--%>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" value="Submit" onclick="javascript: initialize()" />
                </td>
            </tr>
        </table>
        <div id="map_canvas" style="width: 500px; height: 400px"></div>


    </div>

</asp:Content>
