<%@ Page Title="Speaker Info - Add/Modify" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="speakerInfo.aspx.cs" Inherits="Admin_speakerInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
        <asp:Label ID="Label1" runat="server" Text="Speakers - Add/Modify"></asp:Label>
    </h1>
    <br />

    <p class="center">
        <asp:Label ID="_message" runat="server" CssClass="failureNotification" Text=""></asp:Label>
    </p>
    <h3 class="center">
        <asp:Button ID="_addNew" runat="server" Text="Add new speaker" OnClick="_addNew_Click" />
    </h3>

    <br />

    <asp:Panel ID="_pnlAddNew" runat="server" Visible="false">
    <table class="tableCenter">

        <!-- Speaker ID -->
        <tr>
            <td class="tdr">
                <asp:Label ID="Label2" runat="server" Text="Speaker ID"></asp:Label></td>
            <td>
                <asp:DropDownList ID="_newSpeakerID" runat="server" DataSourceID="SqlDataPersonFullName" DataTextField="fullName" DataValueField="personID" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">- Please Select -</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource runat="server" ID="SqlDataPersonFullName" ConnectionString='<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>' SelectCommand="personSelectFullName" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Speaker Required" ControlToValidate="_newSpeakerID" CssClass="failureNotification" InitialValue="0"></asp:RequiredFieldValidator></td>
        </tr>

        <!-- Job Title -->
        <tr>
            <td class="tdr">
                <asp:Label ID="Label3" runat="server" Text="Job Title"></asp:Label></td>
            <td>
                <asp:TextBox ID="_newJobTitle" runat="server"></asp:TextBox></td>
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Job Title Required" ControlToValidate="_newJobTitle" CssClass="failureNotification"></asp:RequiredFieldValidator></td>
        </tr>

        <!-- Alumni? -->
        <tr>
            <td class="tdr">
                <asp:Label ID="Label4" runat="server" Text="Alumni?"></asp:Label></td>
            <td>
                <asp:CheckBox ID="_newAlumni" runat="server" /></td>            
        </tr>

        <!-- Sponsor Interest? -->
        <tr>
            <td class="tdr">
                <asp:Label ID="Label5" runat="server" Text="Sponsor Interest?"></asp:Label></td>
            <td>
                <asp:CheckBox ID="_newSponsorInterest" runat="server" /></td>
        </tr>
        
        <tr>
            <td class="tdr">
                <asp:Label ID="Label13" runat="server" Text="Shirt Size"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="_newShirtSize" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataValidShirtSize" DataTextField="shirtSize" DataValueField="shirtSizeID">
                    <asp:ListItem Value="0">- Please Select -</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataValidShirtSize" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="validShirtSizeSelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Please Select Shirt Size" ControlToValidate="_newShirtSize" CssClass="failureNotification" InitialValue="0"></asp:RequiredFieldValidator>
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

    <br />

    <!-- SpeakerInfo grid view -->
    <asp:GridView ID="_speakerInfoGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="personID" DataSourceID="SqlDataSpeakerInfo" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowDeleted="_speakerInfoGridView_RowDeleted" OnRowUpdated="_speakerInfoGridView_RowUpdated">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowEditButton="True"></asp:CommandField>
            <asp:BoundField DataField="personID" HeaderText="personID" ReadOnly="True" SortExpression="personID" Visible="False"></asp:BoundField>
            <asp:TemplateField HeaderText="First Name" SortExpression="firstName">
                <EditItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("firstName") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("firstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="lastName">
                <EditItemTemplate>
                    <asp:Label ID="Label15" runat="server" Text='<%# Eval("lastName") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("lastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-mail" SortExpression="email">
                <EditItemTemplate>
                    <asp:Label ID="Label16" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone #" SortExpression="phone">
                <EditItemTemplate>
                    <asp:Label ID="Label17" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Job Title" SortExpression="jobTitle">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("jobTitle") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" CssClass="failureNotification" ErrorMessage="*Job Title Required"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("jobTitle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="alumni" HeaderText="Alumni?" SortExpression="alumni"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="sponsorInterest" HeaderText="Sponsor Interest?" SortExpression="sponsorInterest"></asp:CheckBoxField>
            <asp:TemplateField HeaderText="Shirt Size ID" SortExpression="speakerShirtSizeID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataValidShirtSize" DataTextField="shirtSize" DataValueField="shirtSizeID" SelectedValue='<%# Bind("speakerShirtSizeID") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("shirtSize") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="shirtSize" HeaderText="shirtSize" SortExpression="shirtSize" Visible="False"></asp:BoundField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to delete this speaker?')" Text="Delete"></asp:LinkButton>
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

    <asp:SqlDataSource runat="server" ID="SqlDataSpeakerInfo" ConnectionString='<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>' DeleteCommand="speakerInfoDelete" DeleteCommandType="StoredProcedure" InsertCommand="speakerInfoInsert" InsertCommandType="StoredProcedure" SelectCommand="speakerInfoSelectAll" SelectCommandType="StoredProcedure" UpdateCommand="speakerInfoUpdate" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="personID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="personID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="speakerShirtSizeID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="jobTitle" Type="String"></asp:Parameter>
            <asp:Parameter Name="alumni" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="sponsorInterest" Type="Boolean"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="personID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="speakerShirtSizeID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="jobTitle" Type="String"></asp:Parameter>
            <asp:Parameter Name="alumni" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="sponsorInterest" Type="Boolean"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

