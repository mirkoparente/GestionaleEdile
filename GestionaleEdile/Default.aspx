<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GestionaleEdile.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="container-fluid h-custom">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-6 my-lg-5 py-lg-5">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp" class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-5 offset-xl-1 my-lg-5 py-lg-5">

                    <!-- Username input -->
                    <div class="form-outline mb-4">
                        <asp:TextBox ID="Username" runat="server" CssClass="form-control form-control-lg" placeholder="Username"></asp:TextBox>
                    </div>
                    <!-- Password input -->
                    <div class="form-outline mb-3">
                        <asp:TextBox ID="Password" TextMode="Password" runat="server" CssClass="form-control form-control-lg" placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="text-center text-lg-start mt-4 pt-2">
                        <asp:Button ID="Login" runat="server" Text="Login" CssClass="btn btn-primary btn-lg" Style="padding-left: 2.5rem; padding-right: 2.5rem;" OnClick="Login_Click" />
                    </div>

                    <p id="error" runat="server" class="alert alert-danger mt-5">Utente non riconosciuto</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
