<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ModificaDipendente.aspx.cs" Inherits="GestionaleEdile.Admin.ModificaDipendente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center my-5">Modifica Dipendente</h1>
    <p id="mess" runat="server" class="alert alert-info">Dipendente Modificato</p>
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
                <div class="d-flex justify-content-between w-100">

                    <asp:Button ID="Modifica" Text="Modifica" CssClass="btn btn-outline-primary" runat="server" OnClick="Modifica_Click" />
                    <button type="button" class="btn btn-outline-danger" runat="server" data-bs-toggle="modal" data-bs-target="#exampleModal">Elimina</button>


                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Elimina Dipendente</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Sicuro di voler eliminare questo Dipendente?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn--outline-secondary" data-bs-dismiss="modal">Annulla</button>
                                    <asp:Button ID="Button1" Text="Elimina" CssClass="btn btn-outline-danger" runat="server" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>
