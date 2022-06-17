<%@ Page Title="Presentation Speakers - Add/Remove" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="speakerPresentation.aspx.cs" Inherits="Admin_speakerPresentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
        <asp:Label ID="Label1" runat="server" Text="Add/Remove Speakers from Presentations"></asp:Label>
    </h1>
    <br />

    <p class="center">
        <asp:Label ID="_message" runat="server" CssClass="failureNotification" Text=""></asp:Label>
    </p>
    <h3 class="center">
        <asp:Button ID="_addNew" runat="server" Text="Add speaker to presentation" OnClick="_addNew_Click" />
    </h3>

    <br />

    <asp:Panel ID="_pnlAddNew" runat="server" Visible="false">
    <table class="tableCenter">

        <!-- Room -->
        <tr>
            <td class="tdr">
                <asp:Label ID="Label2" runat="server" Text="Speaker"></asp:Label></td>
            <td>
                <asp:DropDownList ID="_newSpeakerPair" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSpeakerFullName" DataTextField="fullName" DataValueField="personID">
                    <asp:ListItem Value="0">- Please Select - </asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSpeakerFullName" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="speakerInfoSelectFullName" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Speaker Selection Required" ControlToValidate="_newSpeakerPair" CssClass="failureNotification" InitialValue="0"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td class="tdr">
                <asp:Label ID="Label3" runat="server" Text="Presentation"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="_newPresentationPair" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataPresentationTopics" DataTextField="presentationTopic" DataValueField="presentationID">
                    <asp:ListItem Value="0">- Please Select -</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataPresentationTopics" runat="server" ConnectionString="<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>" SelectCommand="presentationSelectTopics" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
            <td class="tdl">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Presentation Selection Required" CssClass="failureNotification" EnableTheming="True" ControlToValidate="_newPresentationPair" InitialValue="0"></asp:RequiredFieldValidator>
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

    <asp:GridView ID="_speakerPresentationGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="presentationID,speakerID" DataSourceID="SqlDataSpeakerPresentationPairs" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" OnRowDeleted="_speakerPresentationGridView_RowDeleted">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="presentationID" HeaderText="presentationID" ReadOnly="True" SortExpression="presentationID" Visible="False"></asp:BoundField>
            <asp:BoundField DataField="presentationTopic" HeaderText="Presentation" SortExpression="presentationTopic"></asp:BoundField>
            <asp:BoundField DataField="speakerID" HeaderText="speakerID" ReadOnly="True" SortExpression="speakerID" Visible="False"></asp:BoundField>
            <asp:BoundField DataField="fullName" HeaderText="Speaker" ReadOnly="True" SortExpression="fullName"></asp:BoundField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" ForeColor="Red" OnClientClick="return confirm('Are you sure you want to remove this speaker from this presentation?')" Text="Delete"></asp:LinkButton>
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




    <asp:SqlDataSource runat="server" ID="SqlDataSpeakerPresentationPairs" ConnectionString='<%$ ConnectionStrings:S18CDSpeakCDSConnectionString %>' DeleteCommand="speakerPresentationDelete" DeleteCommandType="StoredProcedure" SelectCommand="speakerPresentationSelectPairs" SelectCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="presentationID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="speakerID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>

