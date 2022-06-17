<%@ Page Title="validMajor Modify" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="validMajor.aspx.cs" Inherits="admin_validMajor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        <asp:Label ID="Label1" runat="server" Text="Major Add / Modify"></asp:Label>
    </h1>
    <br/>

    <p class="center">
        <asp:Label ID="_message" runat="server" CssClass="failureNotification"
            Text=""></asp:Label>
    </p>

    <h3 class="center">
        <asp:Button ID="_addNew" runat="server" Text="Add New Major" OnClick="_addNew_Click" />
    </h3>
    <br />
    <br />
    <asp:Panel ID="_pnlAddNew" runat="server" Visible ="false">
        <table class="tableCenter">
            <tr>
                <td class="tdr">
                    <asp:Label ID="Label2" runat="server" Text="Major Name"></asp:Label></td>
                <td class="tdl">
                    <asp:TextBox ID="_majorName" runat="server"></asp:TextBox></td>
                <td class="tdl">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Major Name Required" 
                        ControlToValidate="_majorName" CssClass="failureNotification"></asp:RequiredFieldValidator></td>
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
    <asp:GridView ID="_majors" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="majorID" DataSourceID="SqlDatavalidMajor" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowDeleted="_majors_RowDeleted" OnRowUpdated="_majors_RowUpdated">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Major" SortExpression="majorName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("majorName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="failureNotification" ErrorMessage="*Valid Major Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("majorName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to delete this major?')" Text="Delete"></asp:LinkButton>
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

    <asp:SqlDataSource ID="SqlDatavalidMajor" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" DeleteCommand="validMajorDelete" DeleteCommandType="StoredProcedure" SelectCommand="validMajorSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="validMajorUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="majorID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="majorID" Type="Int32" />
            <asp:Parameter Name="majorName" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

