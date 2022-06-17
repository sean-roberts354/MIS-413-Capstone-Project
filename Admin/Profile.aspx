<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="user_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        <asp:Label ID="Label1" runat="server" Text="Person Add/Modify"></asp:Label>

    </h1>
    <br />
    <p class ="center">
        <asp:Label ID="_message" runat="server" CssClass="failureNotification"
            Text=""></asp:Label>
    </p>

    <asp:Panel ID="_pnlAddUser" runat="server" Visible="False">
    <h3 class="center">
        <asp:Label ID="_instruction" runat="server" Text="Add a New User"></asp:Label>
    </h3>
    <table class ="tableCenter">
            <tr>
                <td class="tdr">
                    <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label></td>
                <td class="tdl">
                    <asp:TextBox ID="_firstName" runat="server"></asp:TextBox></td>
                <td class="tdl">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ErrorMessage="*First Name Required" ControlToValidate="_firstName" CssClass="failureNotification"></asp:RequiredFieldValidator></td>
            </tr>
           <tr>
                <td class="tdr">
                    <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label></td>
                <td class="tdl">
                    <asp:TextBox ID="_lastName" runat="server"></asp:TextBox></td>
                <td class="tdl">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ErrorMessage="*Last Name Required" ControlToValidate="_lastName" CssClass="failureNotification"></asp:RequiredFieldValidator></td>
            </tr>
           <tr>
                <td class="tdr" style="height: 24px">
                    <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label></td>
                <td class="tdl" style="height: 24px">
                    <asp:TextBox ID="_email" runat="server"></asp:TextBox></td>
                <td class="tdl" style="height: 24px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ErrorMessage="*Email Required" ControlToValidate="_email" CssClass="failureNotification" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="failureNotification" Display="Dynamic" ErrorMessage="Invalid Email Format" ControlToValidate="_email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
           <tr>
                <td class="tdr">
                    <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label></td>
                <td class="tdl">
                    <asp:TextBox ID="_password" runat="server" TextMode="Password"></asp:TextBox></td>
                <td class="tdl">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ErrorMessage="*Password Required" ControlToValidate="_password" CssClass="failureNotification"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="tdr">
                    <asp:Label ID="Label7" runat="server" Text="Phone"></asp:Label></td>
                <td class="tdl">
                    <asp:TextBox ID="_phone" runat="server" ></asp:TextBox></td>
                <td class="tdl">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                        ErrorMessage="*Phone Number Required" ControlToValidate="_phone" CssClass="failureNotification"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="tdr">
                    <asp:Label ID="Label8" runat="server" Text="Employer"></asp:Label></td>
                <td class="tdl">
                    <asp:DropDownList ID="_employer" runat="server" DataSourceID="SqlEmployer" 
                        DataTextField="employerName" DataValueField="employerID" AppendDataBoundItems="True" >
                        <asp:ListItem Value="0">-Please Select -</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlEmployer" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="validEmployerSelectAll"  SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
                <td class="tdl">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                        ErrorMessage="*Employer Required" ControlToValidate="_Role" CssClass="failureNotification" InitialValue="0"></asp:RequiredFieldValidator></td>
            </tr>
           <tr>
                <td class="tdr">
                    <asp:Label ID="Label6" runat="server" Text="User Role"></asp:Label></td>
                <td class="tdl">
                    <asp:DropDownList ID="_Role" runat="server" DataSourceID="SqlRole" DataTextField="roleDesc" DataValueField="roleID" AppendDataBoundItems="True">
                        <asp:ListItem Value="0">-Please Select -</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlRole" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="validRolesSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
                <td class="tdl">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                        ErrorMessage="*Role Required" ControlToValidate="_Role" CssClass="failureNotification" InitialValue="0"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td colspan="2" class="center"><br />
                    <asp:Button ID="_submit" runat="server" Text="Submit" OnClick="_submit_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="_clear" runat="server" Text="Clear Data" CausesValidation="False" OnClick="_clear_Click" />
                </td>

            </tr>
     </table>
        </asp:Panel>
    <br />

     <h3 class="center"><asp:Button ID="_personAddModify" runat="server" Text="Add New Person" OnClick="_personAddModify_Click"  /></h3>

    <p class="center">
        <asp:Label ID="_results" runat="server" Text=""></asp:Label>
    </p>
    <br />
    <asp:GridView ID="_people" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="personID" DataSourceID="SqlDataPeople" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnSelectedIndexChanged="_people_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" OnClick="LinkButton1_Click2" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
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
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="DeletePersonButton" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClick="LinkButton1_Click" OnClientClick="return confirm('Are you sure you want to delete this person?')" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                <FooterStyle ForeColor="Red" />
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
    <br />
    <br />


    <asp:SqlDataSource ID="SqlDataPeople" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="validPersonSelectAll" SelectCommandType="StoredProcedure" DeleteCommand="validPersonDelete" DeleteCommandType="StoredProcedure" UpdateCommand="validPersonUpdate" UpdateCommandType="StoredProcedure" InsertCommand="validPersonInsert" InsertCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="personID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="pwd" Type="String" />
            <asp:Parameter Name="roleID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="personID" Type="Int32" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

