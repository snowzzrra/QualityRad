 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CadastroClinica.aspx.cs" Inherits="QualityRad.Pages.CadastroClinica" MasterPageFile="~/Site.Master" Title ="CadastroClinica" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContent">
    <style>
        .formulario-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        
        .formulario-cadastro-clinica {
            display: flex;
            align-items: center;
            flex-direction: column;
            width: 90%;
            max-width: 500px;
            margin: 0 auto;
            background-color: #f4f4f4;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .complementobairro, .razaonome, .cidadeestado, .cepmunicipal, .cnpjtelefone {
            width: 61.2%;
            display: flex;
            flex-direction: row;


        }

        .complementobairro .form-control,
        .razaonome .form-control,
        .cidadeestado .form-control,
        .cepmunicipal .form-control,
        .cnpjtelefone .form-control {
             margin-right: 5px;
        }


        .input-container {
            margin-bottom: 15px;
        }
        
        .form-control {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            align-items: center;
        }
        
        
        .form-button {
            width: 100%;
            margin-top: 15px;
            background-color: #007bff;
            color: #fff;
            padding: 15px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .form-button:hover {
            background-color: #0056b3;
        }
    </style>
    <div runat="server">
        <div class="formulario-container">
            <div class="formulario-cadastro-clinica">
               
                <div class="razaonome">
                <asp:TextBox ID="razaoSocialTextBox" CssClass="form-control" runat="server" placeholder="Razão Social"></asp:TextBox>
                <asp:TextBox ID="nomeFantasiaTextBox" CssClass="form-control" runat="server" placeholder="Nome Fantasia"></asp:TextBox>
                </div>
               
                <asp:TextBox ID="enderecoTextBox" CssClass="form-control" runat="server" placeholder="Endereço"></asp:TextBox>
                
                <div class="complementobairro">
                <asp:TextBox ID="complementoTextBox" CssClass="form-control" runat="server" placeholder="Complemento"></asp:TextBox>
                <asp:TextBox ID="bairroTextBox" CssClass="form-control" runat="server" placeholder="Bairro"></asp:TextBox>
                </div>

                <div class="cidadeestado">
                <asp:TextBox ID="cidadeTextBox" CssClass="form-control" runat="server" placeholder="Cidade"></asp:TextBox>
                <asp:TextBox ID="estadoTextBox" CssClass="form-control" runat="server" placeholder="Estado"></asp:TextBox>
                </div>

                <asp:TextBox ID="ieTextBox" CssClass="form-control" runat="server" placeholder="Inscrição Estadual"></asp:TextBox>

                <div class="cepmunicipal">
                <asp:TextBox ID="cepTextBox" CssClass="form-control" runat="server" placeholder="CEP"></asp:TextBox>
                <asp:TextBox ID="inscricaoMunicipalTextBox" CssClass="form-control" runat="server" placeholder="Inscrição Municipal"></asp:TextBox>
                </div>

                <asp:TextBox ID="emailTextBox" CssClass="form-control" runat="server" placeholder="E-mail"></asp:TextBox>
                
                <div class="cnpjtelefone">
                <asp:TextBox ID="cnpjTextBox" CssClass="form-control cnpj-input" runat="server" placeholder="CNPJ"></asp:TextBox>
                <asp:TextBox ID="telefoneTextBox" CssClass="form-control telefone-input" runat="server" placeholder="Telefone"></asp:TextBox>
                </div>

                <asp:TextBox ID="responsavelLegalTextBox" CssClass="form-control" runat="server" placeholder="Responsável Legal"></asp:TextBox>
                <asp:TextBox ID="responsavelTecnicoTextBox" CssClass="form-control" runat="server" placeholder="Responsável Técnico"></asp:TextBox>
                <asp:TextBox ID="crmTextBox" CssClass="form-control" runat="server" placeholder="CRM"></asp:TextBox>
                <asp:TextBox ID="crmCpfTextBox" CssClass="form-control" runat="server" placeholder="CRM/CPF"></asp:TextBox>
                <asp:Button ID="submitButton" CssClass="form-button" runat="server" Text="Enviar" OnClick="SubmitButton_Click" />
            </div>
        </div>
    </div>

</asp:Content>

