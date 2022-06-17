<%@ Page Title="Shirt Size Modify" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="validShirtSize.aspx.cs" Inherits="Admin_validShirtSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
        <asp:Label ID="Label1" runat="server" Text="Shirt Size - Add/Modify"></asp:Label>
    </h1>
    <br />

    <p class="center">
        <asp:Label ID="_message" runat="server" CssClass="failureNotification" Text=""></asp:Label>
    </p>
    <h3 class="center">
        <asp:Button ID="_addNew" runat="server" Text="Add new shirt size" OnClick="_addNew_Click" />
    </h3>

    <br />

    <asp:Panel ID="_pnlAddNew" runat="server" Visible="false">
    <table class="tableCenter">

        <!-- Shirt Size -->
        <tr>
            <td class="tdr">
                <asp:Label ID="Label2" runat="server" Text="Shirt Size"></asp:Label></td>
            <td>
                <asp:TextBox ID="_newShirtSize" runat="server"></asp:TextBox></td>
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Shirt Size Required" ControlToValidate="_newShirtSize" CssClass="failureNotification"></asp:RequiredFieldValidator></td>
        </tr>             

        <!-- Buttons -->
        <tr>
            <td colspan="2" class="center">
                <br />
                <asp:Button ID="_addNow" runat="server" Text="Add Now" OnClick="_addNow_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="_cancel" runat="server" Text="Cancel" CausesValidation="False" OnClick="_cancel_Click" />
            </td>
        </tr>
    </table>
    </asp:Panel>

    <br /> <br /> <br /> 

    <asp:GridView ID="_shirtSize" runat="server" HorizontalAlign="Center" AutoGenerateColumns="False" DataKeyNames="shirtSizeID" DataSourceID="SqlDataValidShirtSize" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleted="_shirtSize_RowDeleted" OnRowUpdated="_shirtSize_RowUpdated">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:CommandField ShowEditButton="True"></asp:CommandField>
            <asp:BoundField DataField="shirtSizeID" HeaderText="shirtSizeID" ReadOnly="True" InsertVisible="False" SortExpression="shirtSizeID" Visible="False"></asp:BoundField>
            <asp:TemplateField HeaderText="Shirt Size" SortExpression="shirtSize">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("shirtSize") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="failureNotification" ErrorMessage="RequiredFieldValidator">*Shirt Size Required</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("shirtSize") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to delete this size option?')" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
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

    <asp:SqlDataSource runat="server" ID="SqlDataValidShirtSize" ConnectionString='<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>' DeleteCommand="validShirtSizeDelete" DeleteCommandType="StoredProcedure" SelectCommand="validShirtSizeSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="validShirtSizeUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="shirtSizeID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="shirtSizeID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="shirtSize" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

