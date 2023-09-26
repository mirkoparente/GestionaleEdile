<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NuovoDipendente.aspx.cs" Inherits="GestionaleEdile.Admin.NuovoDipendente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center my-5">Inserisci Nuovo Dipendente</h1>
    <p id="mess" runat="server" class="alert alert-info">Dipendente Aggiunto</p>
    <div class="container">
        <div class="row row-cols-1 row-cols-md-2 justify-content-center">
            <div class="col">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control mb-3" placeholder="Nome"></asp:TextBox>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control mb-3" placeholder="Cognome"></asp:TextBox>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control mb-3" placeholder="Indirizzo"></asp:TextBox>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control mb-3" placeholder="Codice Fiscale"></asp:TextBox>
                <asp:CheckBox ID="CheckBox1" CssClass="my-3" runat="server" Text="Coniugato" />
                <asp:TextBox ID="TextBox5" runat="server" TextMode="Number" CssClass="form-control mb-3" placeholder="Numero Figli"></asp:TextBox>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control mb-3" placeholder="Mansione"></asp:TextBox>
            <asp:Button ID="Insert" Text="Inserisci Dipendente" CssClass="btn btn-outline-primary" runat="server" OnClick="Insert_Click" />
            </div>

        </div>
    </div>
</asp:Content>
