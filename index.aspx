<%@ Page Title="" Language="C#" MasterPageFile="~/home.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section class="hero-section">
            <div class="container text-center">
                <h1 class="display-4 mb-4">Your Health Is Our Priority</h1>
                <p class="lead mb-4">Book your appointment today and get the best medical care from our expert doctors.</p>
                <a class="btn btn-light btn-lg px-4" href="#Appoiment">Book Appointment</a>
            </div>
        </section>
        <!-- Quick Appointment Booking -->
        <section id="Appoiment" class="py-5" visible="false">
            <div class="container">
                <h2 class="text-center mb-4">Book Your Appointment</h2>
                <div class="row justify-content-center">
                    <div class="col-md-8">
                       <div class="card mb-4">
                          <div class="card-header bg-primary text-white">
                            <h5 class="card-title mb-0">
                              <i class="fas fa-user-plus me-2"></i>Patient Registration
                            </h5>
                          </div>
                          <div class="card-body">
                            <div class="row">
                              <div class="col-md-6">
                                <div class="mb-3">
                                  <label for="patientName" class="form-label">Patient Name</label>
                                  <asp:TextBox
                                    placeholder="Enter your Name"
                                    CssClass="form-control"
                                    ID="pname"
                                    runat="server"
                                  ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPName" runat="server" ControlToValidate="pname"
                                    ErrorMessage="Patient Name is required!" CssClass="text-danger" Display="Dynamic" />
                                </div>
                                <div class="mb-3">
                                  <label for="email" class="form-label">Email Address</label>
                                  <asp:TextBox
                                      placeholder="abc@gamil.com"
                                    CssClass="form-control"
                                    ID="pemail"
                                    runat="server"
                                    TextMode="Email"
                                  ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPEmail" runat="server" ControlToValidate="pemail"
                                    ErrorMessage="Email is required!" CssClass="text-danger" Display="Dynamic" />
                                </div>
                                <div class="mb-3">
                                  <label for="dob" class="form-label">Date of Birth</label>
                                  <asp:TextBox
                                    CssClass="form-control"
                                    ID="pdate"
                                    runat="server"
                                    TextMode="Date"
                                ></asp:TextBox>

                                <!-- Required Field Validator -->
                                <asp:RequiredFieldValidator 
                                    ID="rfvPDate" 
                                    runat="server" 
                                    ControlToValidate="pdate"
                                    ErrorMessage="Date of Birth is required!" 
                                    CssClass="text-danger" 
                                    Display="Dynamic" 
                                />

                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="mb-3">
                                  <label for="phone" class="form-label">Phone Number</label>
                                  <asp:TextBox
                                      placeholder="Enter your Phone number"
                                    CssClass="form-control"
                                    ID="pphone"
                                    runat="server"
                                    MaxLength="10"
                                    TextMode="SingleLine"
                                ></asp:TextBox>

                                <!-- Required Field Validator -->
                                <asp:RequiredFieldValidator 
                                    ID="rfvPPhone" 
                                    runat="server" 
                                    ControlToValidate="pphone"
                                    ErrorMessage="Phone Number is required!" 
                                    CssClass="text-danger" 
                                    Display="Dynamic" 
                                />

                                <!-- Regular Expression Validator -->
                                <asp:RegularExpressionValidator 
                                    ID="revPPhone" 
                                    runat="server" 
                                    ControlToValidate="pphone"
                                    ValidationExpression="^\d{10}$"
                                    ErrorMessage="Phone Number must be exactly 10 digits!" 
                                    CssClass="text-danger" 
                                    Display="Dynamic" 
                                />

                                </div>
                                <div class="mb-3">
                                  <label for="gender" class="form-label">Gender</label>
                                  <asp:DropDownList
                                    CssClass="form-control"
                                    ID="pgender"
                                    runat="server"
                                  >
                                      <asp:ListItem Text="Select Gender" Value="" Selected="True"/>
                                  <asp:ListItem Text="Male" Value="Male" />
                                      <asp:ListItem Text="Female" Value="Female" />
                                      <asp:ListItem Text="Other" Value="Other" />
                                  </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvPGender" runat="server" ControlToValidate="pgender"
                                    ErrorMessage="Gender selection is required!" CssClass="text-danger" Display="Dynamic" InitialValue=""/>
                                </div>
                                <div class="mb-3">
                                  <label for="address" class="form-label">City</label>
                                  <asp:TextBox
                                      placeholder="Enter your City"
                                    ID="paddress"
                                    CssClass="form-control"
                                    runat="server"
                                  ></asp:TextBox>
                                </div>
                              </div>
                              <div class="col-md-6">
                                <asp:Label ID="lblSpecialty" runat="server" CssClass="form-label"
                                  >Select Specialty</asp:Label
                                >
                                <asp:DropDownList
                                  ID="ddlSpecialty"
                                  runat="server"
                                  CssClass="form-select"
                                  AutoPostBack="true" OnSelectedIndexChanged="ddlSpecialty_SelectedIndexChanged"
                                > 
                                </asp:DropDownList>
                                  <asp:RequiredFieldValidator ID="rfvSpecialty" runat="server" ControlToValidate="ddlSpecialty"
                                    ErrorMessage="Specialty selection is required!" CssClass="text-danger" Display="Dynamic" InitialValue=""/>
                              </div>
                              <div class="col-md-6">
                                <asp:Label ID="lblSymptoms" runat="server" CssClass="form-label"
                                  >Select Tern</asp:Label
                                >
                                <asp:DropDownList
                                  ID="trem"
                                  runat="server"
                                  CssClass="form-select"
                                >
                                     <asp:ListItem Text="Select Tern" Value=""  Selected="True"/>
                                     <asp:ListItem Text="New Term" Value="new" />
                                     <asp:ListItem Text="Repeat Term" Value="repeat" />
                                </asp:DropDownList>
                                   <asp:RequiredFieldValidator ID="rvfTerm" runat="server" ControlToValidate="trem"
                                    ErrorMessage="Tern selection is required!" CssClass="text-danger" Display="Dynamic" InitialValue=""/>
                              </div>
                              <div class="col-md-6">
                                <asp:Label ID="lblDoctor" runat="server" CssClass="form-label"
                                  >Select Doctor</asp:Label
                                >
                                <asp:DropDownList ID="ddlDoctor" runat="server" AutoPostBack="true" CssClass="form-select">
                                </asp:DropDownList>
                                  <asp:RequiredFieldValidator ID="rfvDoctor" runat="server" ControlToValidate="ddlDoctor"
                                    ErrorMessage="Doctor selection is required!" CssClass="text-danger" Display="Dynamic" InitialValue=""/>
                              </div>
                              <div class="col-md-6">
                                <asp:Label ID="lblDate" runat="server" CssClass="form-label"
                                  >Preferred Date</asp:Label>
                                  <asp:Calendar ID="txtDate" runat="server" SelectionMode="Day" OnDayRender="txtDate_DayRender"></asp:Calendar>
                                  
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-12">
                                <asp:Button
                                  ID="submit"
                                  CssClass="btn btn-primary mt-3 w-100"
                                  runat="server"
                                  Text="Submit" OnClick="submit_Click"
                                />
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
            

        <!-- Features Section -->
        <section class="bg-light py-5">
            <div class="container">
                <h2 class="text-center mb-4">Why Choose Us</h2>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="card h-100 feature-card">
                            <div class="card-body text-center">
                                <i class="fas fa-user-md fa-3x text-primary mb-3"></i>
                                <h5 class="card-title">Expert Doctors</h5>
                                <p class="card-text">Our team consists of highly qualified and experienced medical professionals dedicated to providing the best care.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card h-100 feature-card">
                            <div class="card-body text-center">
                                <i class="fas fa-clock fa-3x text-primary mb-3"></i>
                                <h5 class="card-title">24/7 Service</h5>
                                <p class="card-text">We provide round-the-clock medical services for emergencies and urgent care needs.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card h-100 feature-card">
                            <div class="card-body text-center">
                                <i class="fas fa-hospitals fa-3x text-primary mb-3"></i>
                                <h5 class="card-title">Modern Facilities</h5>
                                <p class="card-text">State-of-the-art medical equipment and facilities to provide the highest standard of care.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <!-- Featured Doctors -->
        <section class="py-5">
            <div class="container">
                <h2 class="text-center mb-4">Our Specialists</h2>
                <div class="row g-4 d-flex gap-5">
                    <asp:Repeater ID="rptDoctors" runat="server">
                        <ItemTemplate>
                            <div class="card" style="width: 18rem;">
                                  <asp:Image ID="imgDoctor" runat="server" CssClass="img-fluid rounded-start bg-light" ImageUrl='<%# Eval("docImg") %>' AlternateText="Doctor Photo" />
                                  <div class="card-body">
                                    <h5 class="card-title"><%# Eval("docName") %></h5>
                                    <p class="card-text"><%# Eval("docDegree") %></p>
                                    
                                  </div>
                                </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                </div>
                <div class="d-flex justify-content-center mt-3">
                    <asp:HyperLink ID="HyperLink5" CssClass="btn btn-primary"  runat="server" NavigateUrl="~/Doctor.aspx">More ...</asp:HyperLink></div>
            </div>
        </section>
</asp:Content>

