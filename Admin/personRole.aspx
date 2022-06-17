<%@ Page Title="Person Role" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="personRole.aspx.cs" Inherits="admin_personRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
        <asp:Label ID="Label1" runat="server" Text="Person Role Add / Delete"></asp:Label>
    </h1>
    <br/>

    <p class="center">
        <asp:Label ID="_message" runat="server" CssClass="failureNotification"
            Text=""></asp:Label>
    </p>

    <h3 class="center">
        <asp:Button ID="_addNew" runat="server" Text="Add New" OnClick="_addNew_Click" />
    </h3>
    <br />
    <br />
    <asp:Panel ID="_pnlAddNew" runat="server" Visible ="false">
        <table class="tableCenter">
            <tr>
                <td class="tdr">
                    <asp:Label ID="Label2" runat="server" Text="Person ID"></asp:Label></td>
                <td class="tdl">
                    <asp:DropDownList ID="_personID" runat="server" DataSourceID="personFullName" DataTextField="fullName" DataValueField="personID" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">-Please Select-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="personFullName" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="personFullName" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
                <td class="tdl">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Person ID Required" 
                        ControlToValidate="_personID" CssClass="failureNotification" InitialValue="0"></asp:RequiredFieldValidator></td>
            </tr>

            <tr>
                <td class="tdr">
                    <asp:Label ID="Label6" runat="server" Text="Person Role"></asp:Label></td>
                <td class="tdl">
                    <asp:DropDownList ID="_roleID" runat="server" DataSourceID="SqlDataRoles" DataTextField="roleDesc" DataValueField="roleID" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">-Please Select-</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataRoles" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="validRolesSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
                <td class="tdl">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Role Required" 
                        ControlToValidate="_roleID" CssClass="failureNotification" InitialValue="0"></asp:RequiredFieldValidator></td>
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



   

    <asp:GridView ID="_personRole" runat="server" AutoGenerateColumns="False" DataKeyNames="personID,roleID" DataSourceID="SqlDataPersonRoles" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowDeleted="_RowDeleted" OnRowUpdated="_RowUpdated">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="personID" HeaderText="personID" ReadOnly="True" SortExpression="personID" Visible="False"></asp:BoundField>
            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName"></asp:BoundField>
            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName"></asp:BoundField>
            <asp:BoundField DataField="roleID" HeaderText="roleID" ReadOnly="True" SortExpression="roleID" Visible="False"></asp:BoundField>
            <asp:BoundField DataField="roleDesc" HeaderText="Role" SortExpression="roleDesc"></asp:BoundField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClientClick="return confirm ('Are you sure you want to delete this person's role?')" Text="Delete"></asp:LinkButton>
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



    <asp:SqlDataSource runat="server" ID="SqlDataPersonRoles" ConnectionString='<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>' DeleteCommand="personRoleDelete" DeleteCommandType="StoredProcedure" SelectCommand="personRoleSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="personRoleUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="personID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="roleID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="personID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="roleID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

