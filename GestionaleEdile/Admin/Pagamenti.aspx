<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Pagamenti.aspx.cs" Inherits="GestionaleEdile.Admin.Pagamenti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="text-center my-3">Effettua un Pagamento</h1>
            <p id="mess" runat="server" class="alert alert-info">Pagamento Effettuato</p>

        <div class="row">
            <div class="col">

                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control my-3" placeholder="Inserisci importo"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text="Periodo Pagamento" CssClass="my-3"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>


                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control my-3">
                    <asp:ListItem Text="Seleziona Acconto o Stipendio" />
                    <asp:ListItem Text="Acconto" Value="0" />
                    <asp:ListItem Text="Stipendio" Value="1" />
                </asp:DropDownList>

                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control my-3">
                    <asp:ListItem Text="Seleziona Dipendente" />
                   
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-outline-primary" Text="Invia Pagamento" OnClick="Button1_Click" />
            </div>
        </div>

    </div>
</asp:Content>
