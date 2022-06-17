<%@ Page Title="Project Overview" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/careerdaybanner.jpg" AlternateText="Career Day Banner" />
        <h1>Career Day Speaker</h1>
        <p class="lead">Register to become a speaker at our annual career day or become a host for one of our many speakers.</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Key Deliverables</h2>
            <ul>
                <li>Build an interface to allow employees in the IS/IT industry to register to become a speaker at our annual Career Day event</li>
                <li>Build an interface to allow UNCW students to become hosts for our speakers to help guide and introduce them</li>
                <li>Store information about our speakers and student hosts to help UNCW faculty coordinate the event and perform tasks such as matching a student host to a speaker</li>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Key Users</h2>
            <ul>
                <li>Current and future speakers at Career Day</li>
                <li>Current and future UCNW student hosts</li>
                <li>UNCW Faculty Event coordinators</li>
            </ul>
        </div>
        <div class="col-md-4">
            <h2>Team Members</h2>
            <ul>
                <li>Sean Roberts</li>
                <li>Duy Nguyen</li>
                <li>Curtis Lewis</li>
            </ul>
        </div>
    </div>
</asp:Content>
