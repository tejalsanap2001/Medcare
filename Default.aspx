<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>--%>

    <div class="row">
        <div class="col-md-10">
            <h2>Introduction</h2>
            <p style="text-align:justify;">
                Hospitals provide medicines for the treatment to the patients based on the diagnosis. During the peak time of a disease, 
                some medicines are not available in the hospital. Based on patient’s historical and current data, 
                system can generate a report on what all medicines should be available in the hospital and in what quantity at particular time and location of the hospital. 
                Doctors and specialists availability needs to be managed as per the inflow of patients. </p>
                <p style="text-align:justify;">
                Many times patients do not find the required doctor during the peak of a disease or shortage of doctors in a hospital. Based on patient inflow for a particular ailment or disease, 
                historical data and current data, system could generate the requirement of number of doctors required in a hospital on daily basis and also during a peak of a disease. Many times, 
                doctors are not available when patients need them more, e.g. on weekends, holidays, evenings etc. However, 
                predictions made solely for the sake of making a prediction are a waste of time and money. In healthcare and other industries, 
                prediction is most useful when that knowledge can be transferred into action. The willingness to intervene is the key to harnessing the power of historical and real-time data. 
                    <p style="text-align:justify;">
                Importantly, to best gauge efficacy and value, both the predictor and the intervention must be integrated within the same system and workflow where the trend occurs. 
                Predictive Analysis of Medicines and Doctors Availability in Government Hospital is providing medicines to the customers as per their requirement by locating the nearest store. 
                It also assures availability of medicines and quantity of the medicines. It also gives a analytical report of availability of Doctors and Specialists nearest to their location.
                </p>
                    </p>
            
        </div>
        
    </div>
</asp:Content>
