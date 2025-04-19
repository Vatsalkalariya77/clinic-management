<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminHome.master" AutoEventWireup="true" CodeFile="appoiment.aspx.cs" Inherits="admin_appoiment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h2>Appoinents </h2>
    <asp:Calendar ID="AppoimentDates" SelectionMode="Day" runat="server" OnDayRender="AppoimentDates_DayRender" OnSelectionChanged="AppoimentDates_SelectionChanged"></asp:Calendar>
    <asp:GridView CssClass="table table-responsive table-primary table-hover" AutoGenerateColumns="false" ID="appoiments" runat="server">
        <Columns>
            <asp:BoundField ControlStyle-CssClass="w-25" DataField="name" HeaderText="name" />
            <asp:BoundField DataField="city" HeaderText="city" />
            <asp:BoundField DataField="tern" HeaderText="tern" />
            <asp:BoundField DataField="speciality" HeaderText="speciality" />
            <asp:BoundField DataField="doctor" HeaderText="Doctor" />
            <asp:TemplateField>
                <HeaderTemplate>Complete</HeaderTemplate>
                <ItemTemplate>
                    <a href="prescri.aspx?com=<%# Eval("id") %>" class="btn btn-success" >Complete</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>Reschedule</HeaderTemplate>
                <ItemTemplate>
                    <a href="appoiment.aspx?res=<%# Eval("id") %>" class="btn btn-danger" >Reschedule</a>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>
    </asp:GridView>
</asp:Content>

