<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        .contact-section {
            padding: 40px 0;
        }
        .contact-image {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .contact-info {
            padding-left: 20px;
        }
        .contact-info h2 {
            font-size: 2rem;
            color: #007bff;
        }
        .contact-info p {
            font-size: 1.1rem;
            color: #555;
        }
        .contact-info i {
            color: #007bff;
        }
    </style>


    <!-- Contact Section -->
    <div class="container contact-section">
        <div class="row">
            <!-- Left Section: Image -->
            <div class="col-md-6"> 
                <asp:Image ID="Image1" runat="server" ImageUrl="~/svgs/contact_image.png" CssClass="w-75 " />
            </div>

            <!-- Right Section: Contact Information -->
            <div class="col-md-6 contact-info">
                <h2>Contact Information</h2>
                <p><i class="fas fa-clinic-medical"></i> <strong>Clinic Name:</strong> Medicare Clinic</p>
                <p><i class="fas fa-map-marker-alt"></i> <strong>Address:</strong> 123 Main St, City, Country</p>
                <p><i class="fas fa-envelope"></i> <strong>Email:</strong> info@medicareclinic.com</p>
                <p><i class="fas fa-phone-alt"></i> <strong>Phone Number:</strong> +(555) 123-4567</p>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


</asp:Content>

