<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminHome.master" AutoEventWireup="true" CodeFile="doctors.aspx.cs" Inherits="doctors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container py-5">
            <!-- Doctor Profile Card -->

                <div class="container mt-2">
            <div class="card">
                <div class="card-body">
                    
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Image ID="imgDoctor" runat="server" CssClass="img-fluid rounded" />
                                    <asp:FileUpload ID="fuDoctorImage" runat="server" CssClass="form-control mt-2" />
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group mb-3">
                                        <asp:Label ID="lblName" runat="server" Text="Doctor Name:" AssociatedControlID="txtName" />
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                            ControlToValidate="txtName" 
                                            ErrorMessage="Name is required" 
                                            CssClass="text-danger" />
                                    </div>

                                    <div class="col-md-8">
                                    <div class="form-group mb-3">
                                        <asp:Label ID="Label1" runat="server" Text="Doctor Password:" AssociatedControlID="txtpass" />
                                        <asp:TextBox ID="txtpass" runat="server" CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtpass" 
                                            ErrorMessage="password is required" 
                                            CssClass="text-danger" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <asp:Label ID="lblDegree" runat="server" Text="Degree:" AssociatedControlID="txtDegree" />
                                        <asp:TextBox ID="txtDegree" runat="server" CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="rfvDegree" runat="server" 
                                            ControlToValidate="txtDegree" 
                                            ErrorMessage="Degree is required" 
                                            CssClass="text-danger" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <asp:Label ID="lblExperience" runat="server" Text="Experience (Years):" AssociatedControlID="txtExperience" />
                                        <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" TextMode="Number" />
                                        <asp:RangeValidator ID="rvExperience" runat="server" 
                                            ControlToValidate="txtExperience" 
                                            Type="Integer" 
                                            MinimumValue="0" 
                                            MaximumValue="50" 
                                            ErrorMessage="Please enter valid experience (0-50 years)" 
                                            CssClass="text-danger" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <asp:Label ID="lblDescription" runat="server" Text="Description:" AssociatedControlID="txtDescription" />
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <asp:Label ID="lblAvailability" runat="server" Text="Availability:" AssociatedControlID="ddlAvailability" />
                                        <asp:DropDownList ID="ddlAvailability" runat="server" CssClass="form-select">
                                            <asp:ListItem Text="Select Availability" Value="" />
                                            <asp:ListItem Text="Monday - Friday" Value="weekdays" />
                                            <asp:ListItem Text="Monday - Saturday" Value="fullweek" />
                                            <asp:ListItem Text="Weekends Only" Value="weekends" />
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvAvailability" runat="server" 
                                            ControlToValidate="ddlAvailability" 
                                            ErrorMessage="Please select availability" 
                                            CssClass="text-danger" />
                                    </div>

                                    <div class="form-group">
                                        <asp:Button ID="btnSave" runat="server" Text="Save Information" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-secondary ms-2" CausesValidation="false" OnClick="btnClear_Click" />
                                    </div>
                                </div>
                            </div>
                       
                       </div>
                </div>
            </div>

                    <%--display Doctors--%>

                     <asp:Repeater ID="AllDoctors" runat="server">
        <ItemTemplate>
            <div class="container mt-4 ">
    <div class="card shadow-sm">
        <div class="row g-0">
            <!-- Doctor Image Column -->
            <div class="col-md-4">
                <asp:Image ID="imgDoctor" runat="server" CssClass="img-fluid rounded-start" 
                    ImageUrl='<%# Eval("docImg") %>' AlternateText="Doctor Photo" />
            </div>
            
            <!-- Doctor Information Column -->
            <div class="col-md-8">
                <div class="card-body">
                    <!-- Doctor Name and Degree -->
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <h3 class="card-title">
                                <asp:Label ID="lblDoctorName" runat="server" Text='<%# Eval("docName") %>' />
                            </h3>
                            <h6 class="text-muted">
                                <asp:Label ID="lblDegree" runat="server" Text='<%# Eval("docDegree") %>' />
                            </h6>
                        </div>
                        
                        <!-- Experience Badge -->
                        <div class="badge bg-primary rounded-pill">
                            <asp:Label ID="lblExperience" runat="server" 
                                Text='<%# Eval("docExp") + " Years Experience" %>' />
                        </div>
                    </div>
                    
                    <!-- Doctor Description -->
                    <div class="mt-3">
                        <asp:Label ID="lblDescription" runat="server" CssClass="card-text" 
                            Text='<%# Eval("docDesc") %>' />
                    </div>
                    
                    <!-- Availability Section -->
                    <div class="mt-4">
                        <h5 class="mb-3">Availability</h5>
                                <div class="d-flex justify-content-between align-items-center mb-2">
                                    
                                    <div class="time-slots">
                                        <span class="badge bg-success me-2">
                                            <%# Eval("docAva") %>
                                        </span>
                                     
                                    </div>
                                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        </ItemTemplate>
    </asp:Repeater>

            
</asp:Content>

