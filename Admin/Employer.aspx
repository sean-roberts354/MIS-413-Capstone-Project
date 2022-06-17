<%@ Page Title="Employers Modify" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Employer.aspx.cs" Inherits="Admin_Employer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <h1>
        <asp:Label ID="Label1" runat="server" Text="Employer Add/Modify"></asp:Label>

    </h1>
    <br />
    <p class ="center">
        <asp:Label ID="_message" runat="server" CssClass="failureNotification"
            Text=""></asp:Label>
    </p>
    <h3 class="center">
        <asp:Button ID="_employerAddModify" runat="server" Text="Add New Employer" OnClick="_addNew_Click" />
    </h3>
    <br />
    <br />
    <br />
    <asp:Panel ID="_pnlAddNew" runat="server" Visible="false">
    <table class ="tableCenter">
            <tr>
                <td class="tdr" style="height: 24px">
                    <asp:Label ID="Label2" runat="server" Text="Employer Name"></asp:Label></td>
                <td class="tdl" style="height: 24px">
                    <asp:TextBox ID="_employerName" runat="server"></asp:TextBox></td>
                <td class="tdl" style="height: 24px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="*Employer Name Required" ControlToValidate="_employerName" CssClass="failureNotification"></asp:RequiredFieldValidator></td>
            </tr>
           
            <tr>
                <td colspan="2" class="center"><br />
                    <asp:Button ID="_submit" runat="server" Text="Add Now" OnClick="_submit_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="_clear" runat="server" Text="Cancel" CausesValidation="False" OnClick="_clear_Click" />
                </td>

            </tr>
     </table>
        </asp:Panel>
    <br />
    <br />
    <asp:GridView ID="_employerGrid" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="employerID" DataSourceID="SqlDataEmployer" HorizontalAlign="Center" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="_employers_SelectedIndexChanged" OnRowDeleted="_employers_RowDeleted" OnRowUpdated="_employers_RowUpdated">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Employer Name" SortExpression="employerName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("employerName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="failureNotification" ErrorMessage="Employer Name Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("employerName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to delete this employer?')" Text="Delete" OnClick="LinkButton1_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
     </asp:GridView>
    <br />
     <asp:SqlDataSource ID="SqlDataEmployer" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" DeleteCommand="validEmployerDelete" DeleteCommandType="StoredProcedure" SelectCommand="validEmployerSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="validEmployerUpdate" UpdateCommandType="StoredProcedure">
         <DeleteParameters>
             <asp:Parameter Name="employerID" Type="Int32" />
         </DeleteParameters>
         <UpdateParameters>
             <asp:Parameter Name="employerID" Type="Int32" />
             <asp:Parameter Name="employerName" Type="String" />
         </UpdateParameters>
     </asp:SqlDataSource>

</asp:Content>

