<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PQR-TesteAceita.aspx.cs" Inherits="QualityRad.Pages.PQR_TesteAceita" MasterPageFile="~/Site.Master" Title="TesteAceita" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Formulário Básico</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 70%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input[type="text"], .form-group input[type="email"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Dados do Serviço de radiologia (Solicitante):</h2>
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <label for="razaoSocial">Razão Social:</label>
                    <asp:TextBox ID="txtRazaoSocial" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="nomeFantasia">Nome Fantasia:</label>
                    <asp:TextBox ID="txtNomeFantasia" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="endereco">Endereço:</label>
            <asp:TextBox ID="txtEndereco" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <label for="complemento">Complemento:</label>
                    <asp:TextBox ID="txtComplemento" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="bairro">Bairro:</label>
                    <asp:TextBox ID="txtBairro" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <label for="cidade">Cidade:</label>
                    <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="estado">Estado:</label>
                    <asp:TextBox ID="txtEstado" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="ie">Inscrição Estadual (IE):</label>
            <asp:TextBox ID="txtIE" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <label for="cep">CEP:</label>
                    <asp:TextBox ID="txtCEP" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="inscricaoMunicipal">Inscrição Municipal:</label>
                    <asp:TextBox ID="txtInscricaoMunicipal" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <label for="cnpj">CNPJ:</label>
                    <asp:TextBox ID="txtCNPJ" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="telefone">Telefone:</label>
                    <asp:TextBox ID="txtTelefone" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="responsavelLegal">Responsável Legal:</label>
            <asp:TextBox ID="txtResponsavelLegal" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="responsavelTecnico">Responsável Técnico:</label>
            <asp:TextBox ID="txtResponsavelTecnico" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col">
                    <label for="crm">CRM:</label>
                    <asp:TextBox ID="txtCRM" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col">
                    <label for="crmCpf">CRM CPF:</label>
                    <asp:TextBox ID="txtCRMCpf" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
        </div>

                <h2>Descrição do Equipamento de Radiodiagnóstico:</h2>

        /* esses deviam ta um no lado do outro, que nem como era do react, eu to fazendo com base no react */

        <div class="form-group"> 
                <div class="row">
                <div class="col">
            <label for="nomeProprietario">Nome do Proprietário:</label>
            <asp:TextBox ID="txtNomeProprietario" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <div class="col">
            <label for="fabricante">Fabricante:</label>
            <asp:TextBox ID="txtFabricante" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
            </div>
                    </div>
        <div class="form-group">
                <div class="row">
                <div class="col">
            <label for="dataRegistro">Data de Registro:</label>
            <asp:TextBox ID="txtDataRegistro" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="form-group">
            <div class="col">
            <label for="numeroRegistro">Número de Registro:</label>
            <asp:TextBox ID="txtNumeroRegistro" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
            </div>
                    </div>
            </div>
        <div class="form-group">
            <label for="anoAquisicao">Ano de Aquisição:</label>
            <asp:TextBox ID="txtAnoAquisicao" runat="server" CssClass="form-control"></asp:TextBox>
        </div>

        

        <div class="form-group">
            <asp:Button ID="btnSubmit" runat="server" Text="Enviar" CssClass="form-control" OnClick="btnSubmit_Click" />
        </div>
    </div>
        </div>
</asp:Content>