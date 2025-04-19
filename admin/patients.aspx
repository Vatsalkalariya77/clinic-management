<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminHome.master" AutoEventWireup="true" CodeFile="patients.aspx.cs" Inherits="admin_patients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <h2>All patients here </h2>
            <asp:GridView CssClass="table table-responsive table-primary table-hover" AutoGenerateColumns="false" ID="patients" runat="server">
                <Columns>
            <asp:BoundField ControlStyle-CssClass="w-25" DataField="name" HeaderText="name" />
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="dob" HeaderText="DOB" />
            <asp:BoundField DataField="p_no" HeaderText="Phone number" />
            <asp:BoundField DataField="gender" HeaderText="Gender" />
            <asp:BoundField DataField="city" HeaderText="City" />
            <asp:TemplateField>
                <HeaderTemplate>view</HeaderTemplate>
                <ItemTemplate>
                    <a href="patients.aspx?patient=<%# Eval("name") %>" class="btn btn-success" >View</a>
                </ItemTemplate>
            </asp:TemplateField> 
        </Columns>
            </asp:GridView>
    </asp:Panel>
    <asp:Panel ID="Panel2" Visible="false" runat="server">
        <asp:Button ID="Button1" CssClass="btn btn-danger mb-3" runat="server" Text="Close" OnClick="Button1_Click" />
        <asp:GridView CssClass="table table-responsive table-primary table-hover" ID="GridView1" runat="server"></asp:GridView>
    </asp:Panel>
</asp:Content>

