<%@ Page Title="Student Hosts Report" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="StudentHostsReport.aspx.cs" Inherits="Admin_StudentHostsReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

<h1><asp:Label ID="Label1" runat="server" Text="Student Hosts Report"></asp:Label></h1>
<br />


    <asp:GridView ID="_people" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="personID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnSelectedIndexChanged="_people_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="First Name" SortExpression="firstName">
                <EditItemTemplate>
                    <asp:TextBox ID="fName" runat="server" Text='<%# Bind("firstName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="fName" CssClass="failureNotification" ErrorMessage="First name is required" Display="Dynamic"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("firstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="lastName">
                <EditItemTemplate>
                    <asp:TextBox ID="lName" runat="server" Text='<%# Bind("lastName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="lName" runat="server" CssClass="failureNotification" ErrorMessage="Last name is required" Display="Dynamic"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("lastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="email" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="email" CssClass="failureNotification" ErrorMessage="Email is required " Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="failureNotification" ErrorMessage="Not a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" Display="Dynamic"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                <EditItemTemplate>
                    <asp:TextBox ID="phone" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" CssClass="failureNotification" ErrorMessage="Phone number is required" ControlToValidate="phone"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="roleDesc" HeaderText="Role Desc" SortExpression="roleDesc" ReadOnly="True" />
            <asp:BoundField DataField="presentationTopic" HeaderText="Presentation Topic" ReadOnly="True" SortExpression="presentationTopic" />
            <asp:BoundField DataField="presentationTime" HeaderText="Time" ReadOnly="True" SortExpression="presentationTime" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="validPersonSelectAllStudentHost" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

