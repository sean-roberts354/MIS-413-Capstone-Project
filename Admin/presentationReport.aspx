<%@ Page Title="Presentation Report" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="presentationReport.aspx.cs" Inherits="Admin_presentationReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
        <asp:Label ID="Label1" runat="server" Text="Presentations Report"></asp:Label>
    </h1>
    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="presentationID" DataSourceID="SqlDataPresentationReport" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="presentationID" HeaderText="Presentation ID" ReadOnly="True" InsertVisible="False" SortExpression="presentationID"></asp:BoundField>
            <asp:BoundField DataField="presentationTopic" HeaderText="Presentation Topic" SortExpression="presentationTopic"></asp:BoundField>
            <asp:BoundField DataField="presentationTime" HeaderText="Presentation Time" SortExpression="presentationTime"></asp:BoundField>
            <asp:BoundField DataField="room" HeaderText="Room" SortExpression="room"></asp:BoundField>
            <asp:BoundField DataField="studentID" HeaderText="Student Host ID" SortExpression="studentID"></asp:BoundField>
            <asp:BoundField DataField="studentHostFullName" HeaderText="Student Host" ReadOnly="True" SortExpression="studentHostFullName"></asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999"></EditRowStyle>

        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
    </asp:GridView>





    <asp:SqlDataSource runat="server" ID="SqlDataPresentationReport" ConnectionString='<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>' SelectCommand="presentationSelectReportData" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

