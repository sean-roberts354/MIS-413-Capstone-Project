<%@ Page Title="Speaker Information Report" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="speakerInfoReport.aspx.cs" Inherits="admin_speakerInfoReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
        <asp:Label ID="Label1" runat="server" Text="Speaker Information Report"></asp:Label>
    </h1>
    <br/>

    <asp:GridView ID="_speakerReport" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="speakerReport" DataKeyNames="personID">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="personID" HeaderText="personID" ReadOnly="True" SortExpression="personID" Visible="False" />
            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="phone" HeaderText="Phone #" SortExpression="phone" />
            <asp:BoundField DataField="employerName" HeaderText="Employer Name" SortExpression="employerName" />
            <asp:BoundField DataField="jobTitle" HeaderText="Job Title" SortExpression="jobTitle" />
            <asp:CheckBoxField DataField="alumni" HeaderText="Alumni?" SortExpression="alumni" />
            <asp:CheckBoxField DataField="sponsorInterest" HeaderText="Sponsor Interest?" SortExpression="sponsorInterest" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="speakerReport" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="speakerInfoReportSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

