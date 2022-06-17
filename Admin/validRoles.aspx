<%@ Page Title="valid Roles modify" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="validRoles.aspx.cs" Inherits="admin_validRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
        <asp:Label ID="Label1" runat="server" Text="Role Add / Modify"></asp:Label>
    </h1>
    <br/>

    <p class="center">
        <asp:Label ID="_message" runat="server" CssClass="failureNotification"
            Text=""></asp:Label>
    </p>

    <h3 class="center">
        <asp:Button ID="_addNew" runat="server" Text="Add New Role" OnClick="_addNew_Click" />
    </h3>
    <br />
    <br />
    <asp:Panel ID="_pnlAddNew" runat="server" Visible ="false">
        <table class="tableCenter">
            <tr>
                <td class="tdr">
                    <asp:Label ID="Label2" runat="server" Text="Role Description"></asp:Label></td>
                <td class="tdl">
                    <asp:TextBox ID="_roleDesc" runat="server"></asp:TextBox></td>
                <td class="tdl">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Role Description Required" 
                        ControlToValidate="_roleDesc" CssClass="failureNotification"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2" class="center"><br />
                    <asp:Button ID="_submit" runat="server" Text="Add Now" OnClick="_submit_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="_clear" runat="server" Text="Clear Data" CausesValidation="False" OnClick="_clear_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <br />
    <br />
    <asp:GridView ID="_roles" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="roleID" DataSourceID="SqlDatavalidRoles" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowDeleted="_roles_RowDeleted" OnRowUpdated="_roles_RowUpdated">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Role" SortExpression="roleDesc">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("roleDesc") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="failureNotification" ErrorMessage="*Valid Role Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("roleDesc") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to delete this role?')" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
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

    <asp:SqlDataSource ID="SqlDatavalidRoles" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" DeleteCommand="validRolesDelete" DeleteCommandType="StoredProcedure" SelectCommand="validRolesSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="validRolesUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="roleID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="roleID" Type="Int32" />
            <asp:Parameter Name="roleDesc" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

