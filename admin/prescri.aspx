<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminHome.master" AutoEventWireup="true" CodeFile="prescri.aspx.cs" Inherits="admin_prescri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="container bg-light p-4 rounded shadow-lg">
        <div class="row mb-3">
            <div class="col text-start fw-bold">Patient: <asp:Label ID="lblPatient" runat="server" Text="John Smith"></asp:Label></div>
            <div class="col text-center"><h2>Prescription</h2></div>
            <div class="col text-end fw-bold">Doctor: <asp:Label ID="lblDoctor" runat="server" Text="Dr. John Doe"></asp:Label></div>
        </div>
        <div class="text-end text-muted" id="date"><asp:Label ID="lblDate" runat="server"></asp:Label></div>

        <asp:Panel ID="pnlMedicines" runat="server">
            <div class="row g-2 mb-3">
                <div class="col-md-6">
                    <label class="form-label">Medicine Name:</label>
                    <asp:TextBox ID="txtMedicine1" runat="server" CssClass="form-control" placeholder="Type to search..."></asp:TextBox>
                  
                </div>
                <div class="col-md-6">
                    <label class="form-label">Power:</label>
                    <asp:DropDownList ID="ddlPower1" runat="server" CssClass="form-select">
                        
                         <asp:ListItem Value="10mg">10mg</asp:ListItem>
                        <asp:ListItem Value="20mg">20mg</asp:ListItem>
                        <asp:ListItem Value="50mg">50mg</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <asp:RequiredFieldValidator ID="rfvMedicine" runat="server" ControlToValidate="txtMedicine1" 
            ErrorMessage="Medicine Name is required!" CssClass="text-danger" Display="Dynamic" />
            <asp:RequiredFieldValidator ID="rfvPower" runat="server" ControlToValidate="ddlPower1" 
            ErrorMessage="Power selection is required!" CssClass="text-danger" Display="Dynamic" 
            InitialValue="Select Power"/>
        </asp:Panel>
        
        <div class="text-center mt-3">
            <asp:Button ID="btnAddMedicine" runat="server" Text="Add More Medicine" CssClass="btn btn-secondary" OnClick="btnAddMedicine_Click" />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Prescription" CssClass="btn btn-success" OnClick="btnSubmit_Click" />
        </div>

        <div class="mt-4 p-3 bg-light border rounded">
            <h3 class="text-center">Final Prescription</h3>
            <div id="prescriptionSummary">
                <asp:ListBox ID="medicines" runat="server" CssClass="form-control"></asp:ListBox>
            </div>
        </div>
    </div>
</asp:Content>

