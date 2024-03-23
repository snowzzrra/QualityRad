<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="QualityRad.Login.LoginPage" MasterPageFile="~/Site.Master" Title ="Login" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">
        <div class="row">
            <div style="height: 100vh" >
                <div style="background-color: #f2f2f2; width: 30%; float:left;">
                    <div id="formulario" runat="server" style="margin-top: 200px">
                        <asp:Label ID="lblEmail" runat="server">Email:</asp:Label>
                        <asp:TextBox ID="tbxEmail" CssClass="form-control" runat="server"></asp:TextBox>

                        <asp:Label ID="lblSenha" runat="server">Senha:</asp:Label>
                        <asp:TextBox ID="tbxSenha" CssClass="form-control" runat="server"></asp:TextBox>

                        <asp:Button OnClick="btnLogin_Click" ID="btnLogin" CssClass="btn btn-success" Text="Enviar" runat="server" />
                    </div>
                 </div>

                <div style="background-color: #00ADEE; width: 70%; float:right;">
                        teste
                </div>
            </div>
        </div>
</asp:Content>
