<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="services.aspx.cs" Inherits="services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Our Health Services</title>
     <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    

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
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
        }
        .card-header {
            font-size: 1.25rem;
            font-weight: bold;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
            padding: 1.5rem;
            border-bottom: none;
        }
        .card-body {
            padding: 2rem;
        }
        
        .text-dark {
            color: #343a40 !important;
        }
        .text-white {
            color: #fff !important;
        }
        .icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #fff;
        }
        .service-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            color: #343a40;
        }
        .service-description {
            font-size: 1.1rem;
            line-height: 1.6;
            color: #555;
        }
        
        .lead {
            font-size: 1.25rem;
            color: #666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <!DOCTYPE html>

    
   
    <div class="container mt-5">
        <h2 class="text-center mb-5 display-4 fw-bold" style="color: #343a40;">Our Health Services</h2>
        <p class="text-center mb-5 lead">We provide comprehensive healthcare services to meet all your medical needs. From routine checkups to emergency care, we are here for you.</p>

        <!-- First Row of Services -->
        <div class="row g-4 mb-4">
            <!-- General Consultation -->
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-header d-flex align-items-center">
                        <i class="fas fa-stethoscope icon me-3"></i>
                        <h5 class="mb-0">General Consultation</h5>
                    </div>
                    <div class="card-body">
                        <p class="service-description">Our general consultation services are designed to diagnose and treat a wide range of health concerns. Whether you're feeling unwell or need a routine checkup, our experienced doctors are here to help.</p>
                        
                    </div>
                </div>
            </div>

            <!-- Diagnostic Services -->
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-header d-flex align-items-center">
                        <i class="fas fa-microscope icon me-3"></i>
                        <h5 class="mb-0">Diagnostic Services</h5>
                    </div>
                    <div class="card-body">
                        <p class="service-description">We offer state-of-the-art diagnostic services, including imaging (X-rays, MRIs, CT scans) and laboratory tests. Accurate diagnostics are the foundation of effective treatment.</p>
                        
                    </div>
                </div>
            </div>

            <!-- Preventive Care -->
            <div class="col-md-4">
                <div class="card h-100">
                    <div class="card-header d-flex align-items-center">
                        <i class="fas fa-shield-alt icon me-3"></i>
                        <h5 class="mb-0">Preventive Care</h5>
                    </div>
                    <div class="card-body">
                        <p class="service-description">Stay ahead of potential health issues with our preventive care packages. We offer vaccinations, health screenings, and personalized wellness plans to keep you healthy.</p>
                       
                    </div>
                </div>
            </div>
        </div>

        <!-- Second Row of Services -->
        <div class="row g-4">
            <!-- Appointment Scheduling -->
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header d-flex align-items-center">
                        <i class="fas fa-calendar-check icon me-3"></i>
                        <h5 class="mb-0">Appointment Scheduling</h5>
                    </div>
                    <div class="card-body">
                        <p class="service-description">Book appointments easily through our online scheduling system. Choose a time that works for you and avoid long waiting times. Your health is our priority.</p>
                       
                    </div>
                </div>
            </div>

            <!-- Emergency Services -->
            <div class="col-md-6">
                <div class="card h-100">
                    <div class="card-header d-flex align-items-center">
                        <i class="fas fa-ambulance icon me-3"></i>
                        <h5 class="mb-0">Emergency Services</h5>
                    </div>
                    <div class="card-body">
                        <p class="service-description">Our clinic provides 24/7 emergency care for critical health situations. Our team of emergency specialists is always ready to provide immediate and life-saving care.</p>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>


</asp:Content>

