<%@ Page Title="Rooms - Add/Modify" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="validRooms.aspx.cs" Inherits="Admin_validRooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
        <asp:Label ID="Label1" runat="server" Text="Presentation Rooms - Add/Modify"></asp:Label>
    </h1>
    <br />

    <p class="center">
        <asp:Label ID="_message" runat="server" CssClass="failureNotification" Text=""></asp:Label>
    </p>
    <h3 class="center">
        <asp:Button ID="_addNew" runat="server" Text="Add new presentation room" OnClick="_addNew_Click" />
    </h3>

    <br />

    <asp:Panel ID="_pnlAddNew" runat="server" Visible="false">
    <table class="tableCenter">

        <!-- Room -->
        <tr>
            <td class="tdr">
                <asp:Label ID="Label2" runat="server" Text="Building/Room"></asp:Label></td>
            <td>
                <asp:TextBox ID="_newRoom" runat="server"></asp:TextBox></td>
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Building/Room Required" ControlToValidate="_newRoom" CssClass="failureNotification"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="tdr">
                <asp:Label ID="Label3" runat="server" Text="Capacity"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="_newCapacity" runat="server"></asp:TextBox>
            </td>
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Room Capactiy Required" CssClass="failureNotification" EnableTheming="True" ControlToValidate="_newCapacity"></asp:RequiredFieldValidator>
            </td>
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

    <asp:GridView ID="_validRoomsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="roomID" DataSourceID="SqlDataValidRooms" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowDeleted="_validRoomsGridView_RowDeleted" OnRowUpdated="_validRoomsGridView_RowUpdated">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="roomID" HeaderText="roomID" ReadOnly="True" InsertVisible="False" SortExpression="roomID" Visible="False"></asp:BoundField>
            <asp:TemplateField HeaderText="Room" SortExpression="room">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("room") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" CssClass="failureNotification" ErrorMessage="*Building/Room Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("room") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Capacity" SortExpression="capacity">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("capacity") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" CssClass="failureNotification" ErrorMessage="*Room Capacity Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("capacity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to delete this room?')" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>




    <asp:SqlDataSource runat="server" ID="SqlDataValidRooms" ConnectionString='<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>' DeleteCommand="validRoomsDelete" DeleteCommandType="StoredProcedure" InsertCommand="validRoomsInsert" InsertCommandType="StoredProcedure" SelectCommand="validRoomsSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="validRoomsUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="roomID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="room" Type="String"></asp:Parameter>
            <asp:Parameter Name="capacity" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="roomID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="room" Type="String"></asp:Parameter>
            <asp:Parameter Name="capacity" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

