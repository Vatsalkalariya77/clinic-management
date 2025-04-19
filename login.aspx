<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="admin_login" %>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Clinic Management System - Login</title>
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="./dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        .auth-wrapper {
            min-height: 100vh;
            background: linear-gradient(135deg, #0d6efd 0%, #0dcaf0 100%);
        }
        .auth-card {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 1rem;
        .auth-sidebar {
            background: rgba(13, 110, 253, 0.1);
            border-radius: 1rem 0 0 1rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auth-wrapper d-flex align-items-center py-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="card auth-card">
                            <div class="row g-0">
                                <!-- Left Sidebar with Image -->
                                <div class="col-md-5 auth-sidebar d-none d-md-flex align-items-center justify-content-center">
                                    <div class="text-center p-4">
                                        <i class="fas fa-hospital-alt fa-4x text-primary mb-4"></i>
                                        <h2 class="fw-bold text-primary">MediCare Clinic</h2>
                                        <p class="text-muted">Your trusted healthcare partner</p>
                                    </div>
                                </div>

                                <!-- Login Form -->
                                <div class="col-md-7">
                                    <div class="card-body p-4 p-md-5">
                                        <asp:MultiView ID="mvAuth" runat="server" ActiveViewIndex="0">
                                            <!-- Login View -->
                                            <asp:View ID="vLogin" runat="server">
                                                <h4 class="fw-bold mb-4">Login to Your Account</h4>
                                                
                                                <asp:Panel ID="pnlLoginError" runat="server" CssClass="alert alert-danger" Visible="false">
                                                    <i class="fas fa-exclamation-circle me-2"></i>
                                                    <asp:Label ID="lblLoginError" runat="server"></asp:Label>
                                                </asp:Panel>

                                                <div class="mb-3">
                                                    <asp:Label ID="lblEmail" runat="server" CssClass="form-label">Email Address</asp:Label>
                                                    <div class="input-group">
                                                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                                        ControlToValidate="txtEmail" 
                                                        Display="Dynamic"
                                                        CssClass="text-danger small"
                                                        ErrorMessage="Email is required" />
                                                </div>

                                                <div class="mb-3">
                                                    <asp:Label ID="lblPassword" runat="server" CssClass="form-label">Password</asp:Label>
                                                    <div class="input-group">
                                                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter your password" TextMode="Password"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                                        ControlToValidate="txtPassword" 
                                                        Display="Dynamic"
                                                        CssClass="text-danger small"
                                                        ErrorMessage="Password is required" />
                                                </div>

                                                

                                                <div class="mb-3">
                                                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary w-100" OnClick="btnLogin_Click" />
                                                </div>

                                                <p class="text-center mb-0">
                                                    Don't have an account? 
                                                    
                                                    <a href="register.aspx">Register now</a>
                                                </p>
                                            </asp:View>

                                           
                                          
                                        </asp:MultiView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="./dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
