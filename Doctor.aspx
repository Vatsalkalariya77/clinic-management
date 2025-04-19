<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="Doctor.aspx.cs" Inherits="Doctor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!-- Custom CSS for Modern UI -->
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
        }
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 15px;
            overflow: hidden;
            background: #fff;
            margin-bottom: 2rem;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
        }
        .card-title {
            font-size: 1.75rem;
            font-weight: 700;
            color: #343a40;
        }
        .text-muted {
            color: #6c757d !important;
        }
        .badge {
            font-size: 0.9rem;
            font-weight: 600;
            padding: 0.5rem 1rem;
            border-radius: 20px;
        }
        .badge.bg-primary {
            background: linear-gradient(135deg, #007bff, #00bcd4);
        }
        .badge.bg-success {
            background: linear-gradient(135deg, #28a745, #20c997);
        }
        .img-fluid {
            border-radius: 15px 0 0 15px;
            height: 100%;
            object-fit: cover;
        }
        .card-body {
            padding: 2rem;
        }
        .time-slots .badge {
            margin-right: 0.5rem;
            margin-bottom: 0.5rem;
            padding: 0.5rem 1rem;
            font-size: 0.9rem;
        }
        .availability-section h5 {
            font-size: 1.25rem;
            font-weight: 600;
            color: #343a40;
            margin-bottom: 1rem;
        }
        .doctor-info {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 1.5rem;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="AllDoctors" runat="server">
        <ItemTemplate>
            <div class="container mt-4">
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
                                <div class="doctor-info">
                                    <div>
                                        <h3 class="card-title">
                                            <asp:Label ID="lblDoctorName" runat="server" Text='<%# Eval("docName") %>' />
                                        </h3>
                                        <h6 class="text-muted">
                                            <asp:Label ID="lblDegree" runat="server" Text='<%# Eval("docDegree") %>' />
                                        </h6>
                                    </div>
                                    
                                    <!-- Experience Badge -->
                                    <div class="badge bg-primary">
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
                                <div class="availability-section mt-4">
                                    <h5>Availability</h5>
                                    <div class="time-slots">
                                        <span class="badge bg-success">
                                            <%# Eval("docAva") %>
                                        </span>
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