<%@ Page Title="Menu" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="menu.aspx.cs" Inherits="menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- This is where I put the child content -->

    <h1>
        <asp:Label ID="Label1" runat="server" Text="Menu of Work Items"></asp:Label>
    </h1>
    <br />

     <!-- Speaker functions -->
    <asp:Panel ID="_speakerPanel" runat="server" Visible="False">
        <h4>
            <asp:Label ID="Label2" runat="server" Text="Speakers (Future Enhancements)"></asp:Label>
        </h4>
            <ul>
                <li><asp:Label ID="Label3" runat="server" Text="Register self as speaker"></asp:Label></li>
                <li><asp:Label ID="Label4" runat="server" Text="Update personal speaker information without needing Admin access"></asp:Label></li>
            </ul>
    </asp:Panel>


    <!-- Student host functions -->
    <asp:Panel ID="_studentPanel" runat="server" Visible="False">
        <h4>
            <asp:Label ID="Label5" runat="server" Text="Student Hosts (Future Enhancements)"></asp:Label>
        </h4>
            <ul>
                <li><asp:Label ID="Label6" runat="server" Text="Register self as Student Host"></asp:Label></li>
                <li><asp:Label ID="Label7" runat="server" Text="Make preferences on which speaker you would like to host"></asp:Label></li>
            </ul>
    </asp:Panel>


    <!-- Event coordinator functions -->
    <asp:Panel ID="_adminPanel" runat="server" Visible="False">
        <h4>
            <asp:Label ID="Label8" runat="server" Text="Event Coordinator"></asp:Label>
        </h4>
            <ul>                
                <li><asp:LinkButton ID="_validShirtSize" runat="server" Text="Shirt Size - Add/Modify (SMR - CP#5)" OnClick="_validShirtSize_Click"></asp:LinkButton></li>                                               
                <li><asp:LinkButton ID="_speakerInfo" runat="server" Text="Speaker Info - Add/Modify (SMR - CP#7)" OnClick="_speakerInfo_Click"></asp:LinkButton></li>
                <li><asp:LinkButton ID="_presentation" runat="server" Text="Presentations - Add/Modify (SMR - CP#8)" OnClick="_presentation_Click"></asp:LinkButton></li>
                <li><asp:LinkButton ID="_validRooms" runat="server" Text="Presentation Rooms - Add/Modify (SMR - CP#9)" OnClick="_validRooms_Click"></asp:LinkButton></li>
                <li><asp:LinkButton ID="_speakerPresentation_Click" runat="server" Text="Add/Remove Speakers from Presentations (SMR - CP#9)" OnClick="_speakerPresentation_Click_Click" ></asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="_employer" Text="Add/Modify New Employer (DDN - CP#5)" runat="server" OnClick="_employer_Click"></asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="_profile" Text="Add/Modify Users (DDN - CP#8 )" runat="server" OnClick="_profile_Click"></asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="_majorsAddModify" runat="server" Text="Majors - Add/Modify (CJL - CP#5)" OnClick="_majorsAddModify_Click"></asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="_personRoleAddDelete" runat="server" Text="personRole - Add/Delete (CJL - CP#7)" OnClick="_personRoleAddDelete_Click"></asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="_validRolesAddModify" runat="server" Text="validRoles - Add/Modify (CJL - CP#7)" OnClick="_validRolesAddModify_Click"></asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="_personEmployerAddDelete" runat="server" Text ="personEmployer - Add/Delete (CJL - CP#8)" OnClick="_personEmployerAddDelete_Click"></asp:LinkButton>
                <li>
                    <asp:LinkButton ID="_studentInfoAddDelete" runat="server" Text ="studentInfo - Add/Delete (CJL - CP#8)" OnClick="_studentInfoAddDelete_Click"></asp:LinkButton></li>
                

            </ul>
        <h4>
            <asp:Label ID="Label9" runat="server" Text="Reports"></asp:Label>
        </h4>
            <ul>
                <li>
                    <asp:LinkButton ID="_presentationReport" runat="server" Text="Presentations Report" OnClick="_presentationReport_Click"></asp:LinkButton></li>
                <li>
                    <asp:LinkButton ID="_studentHostsReport" runat="server" Text="Student Hosts Report" OnClick="_studentHostsReport_Click"></asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton ID="_speakerReport" runat="server" Text ="Speaker Report - (CJL - CP#9)" OnClick="_speakerReport_Click"></asp:LinkButton>
            </ul>
    </asp:Panel>

    <br />

    <asp:Label ID="_cookieRetrieveInfo" runat="server" Text=""></asp:Label>


</asp:Content>

