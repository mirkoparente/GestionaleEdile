<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StoricoPagamenti.aspx.cs" Inherits="GestionaleEdile.Admin.StoricoPagamenti" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <h1 class="text-center my-3">Pagamenti Effettuati</h1>
    <div class="container">

      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-active table-striped-columns" ItemType="GestionaleEdile.Admin.Paga">

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
                 <p class="text-capitalize"> <%# Item.Cognome %> </p>
              </ItemTemplate>
          </asp:TemplateField>
      </Columns>
      <Columns>
          <asp:TemplateField>
              <HeaderTemplate>
                  <strong>DATA PAGAMENTO</strong>
              </HeaderTemplate>
              <ItemTemplate>
                  <%# Item.PeriodoPagamento.ToShortDateString() %>
              </ItemTemplate>
          </asp:TemplateField>
      </Columns>
      <Columns>
          <asp:TemplateField>
              <HeaderTemplate>
                  <strong>IMPORTO</strong>
              </HeaderTemplate>
              <ItemTemplate>
                  <%# Item.Pagamento.ToString("C2") %>
              </ItemTemplate>
          </asp:TemplateField>
      </Columns>
      <Columns>
          <asp:TemplateField>
              <HeaderTemplate>
                  <strong>ACCONTO/STIPENDIO</strong>
              </HeaderTemplate>
              <ItemTemplate>
                <p class="text-capitalize">  <%# Item.AccontoOStipendio.ToString().Replace("True","Stipendio").Replace("False","Acconto")%> </p>
              </ItemTemplate>
          </asp:TemplateField>
      </Columns>
        
  </asp:GridView>
    </div>
</asp:Content>
