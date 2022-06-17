<%@ Page Title="Presentation Add/Modify" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="presentation.aspx.cs" Inherits="Admin_presentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
        <asp:Label ID="Label1" runat="server" Text="Presentation - Add/Modify"></asp:Label>
    </h1>
    <br />

    <p class="center">
        <asp:Label ID="_message" runat="server" CssClass="failureNotification" Text=""></asp:Label>
    </p>
    <h3 class="center">
        <asp:Button ID="_addNew" runat="server" Text="Add new presentation" OnClick="_addNew_Click" />
    </h3>

    <br />

    <asp:Panel ID="_pnlAddNew" runat="server" Visible="false">
    <table class="tableCenter">

        <!-- StudentID -->
        <tr>
            <td class="tdr">
                <asp:Label ID="Label9" runat="server" Text="Student Host"></asp:Label></td>
            <td>
                <asp:DropDownList ID="_newStudentID" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataStudentHosts" DataTextField="studentHostFullName" DataValueField="personID">
                    <asp:ListItem Value="0">- Please Select -</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataStudentHosts" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="personSelectStudentHosts" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Student Host Required" ControlToValidate="_newStudentID" CssClass="failureNotification" InitialValue="0"></asp:RequiredFieldValidator></td>
        </tr>

        <!-- Presentation Topic -->
        <tr>
            <td class="tdr">
                <asp:Label ID="Label7" runat="server" Text="Presentation Topic"></asp:Label></td>
            <td>
                <asp:TextBox ID="_newPresentationTopic" runat="server"></asp:TextBox></td>
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Presentation Topic Required" ControlToValidate="_newPresentationTopic" CssClass="failureNotification"></asp:RequiredFieldValidator></td>
        </tr>

        <!-- Presentation Time -->
        <tr>
            <td class="tdr">
                <asp:Label ID="Label2" runat="server" Text="Presentation Time"></asp:Label></td>
            <td>
                <asp:TextBox ID="_newPresentationTime" runat="server"></asp:TextBox></td>
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Presentation Time Required" ControlToValidate="_newPresentationTime" CssClass="failureNotification" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="_newPresentationTime" CssClass="failureNotification" Display="Dynamic" ErrorMessage="*Improper Format (HH:MM)" ValidationExpression="^(([0-1]?[0-9])|([2][0-3])):([0-5]?[0-9])(:([0-5]?[0-9]))?$"></asp:RegularExpressionValidator>
            </td>
        </tr>

        <!-- Presentation Room -->
        <tr>
            <td class="tdr">
                <asp:Label ID="Label8" runat="server" Text="Room"></asp:Label></td>
            <td>
                <asp:DropDownList ID="_newPresentationRoom" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataValidRooms2" DataTextField="room" DataValueField="roomID">
                    <asp:ListItem Value="0">- Please Select -</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataValidRooms2" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="validRoomsSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>    
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Presentation Room Required" CssClass="failureNotification" ControlToValidate="_newPresentationRoom" InitialValue="0"></asp:RequiredFieldValidator>
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





    <!-- Grid View for presentations -->
    <asp:GridView ID="_presentationGridView" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="presentationID" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowDeleted="_presentationGridView_RowDeleted" OnRowUpdated="_presentationGridView_RowUpdated">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="presentationID" HeaderText="presentationID" ReadOnly="True" InsertVisible="False" SortExpression="presentationID" Visible="False"></asp:BoundField>
            <asp:BoundField DataField="studentID" HeaderText="studentID" SortExpression="studentID" Visible="False" />
            <asp:TemplateField HeaderText="Student Host" SortExpression="studentHostFullName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataStudentHosts" DataTextField="studentHostFullName" DataValueField="personID" SelectedValue ='<%# Bind("studentID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("studentHostFullName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Presentation Topic" SortExpression="presentationTopic">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("presentationTopic") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox1" CssClass="failureNotification" ErrorMessage="*Presentation Topic Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("presentationTopic") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Presentation Time" SortExpression="presentationTime">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("presentationTime") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox2" CssClass="failureNotification" Display="Dynamic" ErrorMessage="*Presentation Time Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="failureNotification" Display="Dynamic" ErrorMessage="*Improper Format (HH:MM)" ValidationExpression="^(([0-1]?[0-9])|([2][0-3])):([0-5]?[0-9])(:([0-5]?[0-9]))?$" ControlToValidate="TextBox2"></asp:RegularExpressionValidator>
                    
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("presentationTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Room" SortExpression="roomID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataValidRooms2" DataTextField="room" DataValueField="roomID" SelectedValue='<%# Bind("roomID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("room") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="room" HeaderText="room" SortExpression="room" Visible="False" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to delete this presentation?')" Text="Delete"></asp:LinkButton>
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



  










    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" DeleteCommand="presentationDelete" DeleteCommandType="StoredProcedure" SelectCommand="presentationSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="presentationUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="presentationID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="presentationID" Type="Int32" />
            <asp:Parameter Name="studentID" Type="Int32" />
            <asp:Parameter Name="presentationTopic" Type="String" />
            <asp:Parameter Name="presentationTime" Type="DateTime" />
            <asp:Parameter Name="roomID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>















</asp:Content>

