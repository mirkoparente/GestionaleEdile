<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListaDipendenti.aspx.cs" Inherits="GestionaleEdile.Admin.ListaDipendenti" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="text-center my-3">Dipendenti</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-active table-striped" ItemType="GestionaleEdile.Admin.Dipendenti">
           
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <strong>NOME</strong>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <p class="text-capitalize"> <%# Item.Nome %></p>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <strong>COGNOME</strong>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <p class="text-capitalize"><%# Item.Cognome %> </p>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <strong>INDIRIZZO</strong>
                    </HeaderTemplate>
                    <ItemTemplate>
                       <p class="text-capitalize"> <%# Item.Indirizzo %> </p>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <strong>CODICE FISCALE</strong>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# Item.CF.ToUpper() %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <strong>CONIUGATO</strong>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <p class="text-capitalize"><%# Item.Sposato.ToString().Replace("True","Sposato").Replace("False","Single") %></p>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <strong>NUMERO FIGLI</strong>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# Item.NFigli %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <strong>MANSIONE</strong>
                    </HeaderTemplate>
                    <ItemTemplate>
                       <p class="text-capitalize"> <%# Item.Mansione %></p>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <Columns>
               <asp:TemplateField>
                   <ItemTemplate>
                       <a href="ModificaDipendente.aspx?IdDipendente=<%# Item.Id %>" class="btn btn-outline-primary">
                           <i class="bi bi-pencil"></i>
                       </a>
                   </ItemTemplate>
               </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:HyperLink ID="HyperLink1" CssClass="btn btn-outline-primary my-3" Text="Inserisci Dipendente" NavigateUrl="~/Admin/NuovoDipendente.aspx" runat="server"></asp:HyperLink>
    </div>
</asp:Content>
