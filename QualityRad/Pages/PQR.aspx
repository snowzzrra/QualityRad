<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PQR.aspx.cs" Inherits="QualityRad.Pages.PQR" MasterPageFile="~/Site.Master" Title="TesteAceita" %>

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
            margin-top: 30px;
            color: #333;
        }

        h3 {
            margin-top: 30px;
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

        .form-group input[type="text"], 
        .form-group input[type="email"] {
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

        .input-group {
            display: flex;
            flex-wrap: nowrap;
        }

        .input-group .form-control {
            flex: 1;
        }

        .input-group .btn {
            border-radius: 0;
            margin-left: -1px; /* Remove space between input and button */
        }

        .text-center {
            text-align: center;
        }

        .text-danger {
            color: red;
        }
    </style>

    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container">
            <h2>Dados do Serviço de radiologia (Solicitante):</h2>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label for="razaoSocial">Razão Social:</label>
                        <asp:TextBox ID="txtRazaoSocial" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="nomeFantasia">Nome Fantasia:</label>
                        <asp:TextBox ID="txtNomeFantasia" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="cnpj">CNPJ:</label>
                        <asp:TextBox ID="txtCNPJ" runat="server" CssClass="form-control" placeholder="00.000.000/0000-00"></asp:TextBox>
                        <!--
                        <asp:RegularExpressionValidator ID="revCNPJ" runat="server" ControlToValidate="txtCNPJ" ErrorMessage="CNPJ inválido" ValidationExpression="^\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}$" CssClass="text-danger"></asp:RegularExpressionValidator>
                        -->
                    </div>
                </div>
            </div>
            <hr/>
            <h3>Contato:</h3>
            <div class="form-end">
                <div class="row">
                    <div class="col-md-6">
                        <label for="email">Email:</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="exemplo@mail.com"></asp:TextBox>
                        <!--
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email inválido" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" CssClass="text-danger"></asp:RegularExpressionValidator>
                        -->
                    </div>
                    <div class="col-md-6">
                        <label for="telefone">Telefone:</label>
                        <asp:TextBox ID="txtTelefone" runat="server" CssClass="form-control" placeholder="(00) 00000-0000"></asp:TextBox>
                        <!--
                        <asp:RegularExpressionValidator ID="revTelefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="Telefone inválido" ValidationExpression="^\(\d{2}\) \d{5}-\d{4}$" CssClass="text-danger"></asp:RegularExpressionValidator>
                        -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <label for="cep">CEP:</label>
                        <div class="input-group">
                            <asp:TextBox ID="txtCEP" runat="server" CssClass="form-control" placeholder="00000-000"></asp:TextBox>
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-primary" onclick="buscarCEP()">Buscar CEP</button>
                            </span>
                        </div>
                        <!--
                        <asp:CustomValidator ID="cvCEP" runat="server" ControlToValidate="txtCEP" ErrorMessage="CEP inválido" ClientValidationFunction="validateCEP" CssClass="text-danger"></asp:CustomValidator>
                        -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label for="logradouro">Logradouro:</label>
                        <asp:TextBox ID="txtLogradouro" runat="server" CssClass="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="bairro">Bairro:</label>
                        <asp:TextBox ID="txtBairro" runat="server" CssClass="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="cidade">Cidade:</label>
                        <asp:TextBox ID="txtCidade" runat="server" CssClass="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="estado">Estado:</label>
                        <asp:TextBox ID="txtEstado" runat="server" CssClass="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="complemento">Complemento:</label>
                        <asp:TextBox ID="txtComplemento" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="numero">Número:</label>
                        <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNumero" runat="server" ControlToValidate="txtNumero" ErrorMessage="Número é obrigatório" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <hr />
            <h3>Dados Técnicos:</h3>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label for="ie">Inscrição Estadual (IE):</label>
                        <asp:TextBox ID="txtIE" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="inscricaoMunicipal">Inscrição Municipal:</label>
                        <asp:TextBox ID="txtInscricaoMunicipal" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="responsavelLegal">Responsável Legal:</label>
                        <asp:TextBox ID="txtResponsavelLegal" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="responsavelTecnico">Responsável Técnico:</label>
                        <asp:TextBox ID="txtResponsavelTecnico" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="crm">CRM:</label>
                        <asp:TextBox ID="txtCRM" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="crmCpf">CRM CPF:</label>
                        <asp:TextBox ID="txtCRMCpf" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <hr/>
            <h2>Descrição do Equipamento de Radiodiagnóstico:</h2>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label for="nomeProprietario">Nome do Proprietário:</label>
                        <asp:TextBox ID="txtNomeProprietario" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="fabricante">Fabricante:</label>
                        <asp:TextBox ID="txtFabricante" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="dataRegistro">Data de Registro:</label>
                        <asp:TextBox ID="txtDataRegistro" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="numeroRegistro">Número de Registro:</label>
                        <asp:TextBox ID="txtNumeroRegistro" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label for="anoAquisicao">Ano de Aquisição:</label>
                        <asp:TextBox ID="txtAnoAquisicao" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="text-center">
                    <asp:Button 
                        ID="btnSubmit" 
                        runat="server" 
                        Text="Enviar" 
                        CssClass="btn btn-primary" 
                        OnClick="btnSubmit_Click"
                        OnClientClick="logToConsole(); return true;" />
                </div>
            </div>
        </div>

            

            <script type="text/javascript">
                function validateCEP(sender, args) {
                    var cep = args.Value.replace(/\D/g, ''); // Remove non-digit characters
                    if (cep.length === 8) {
                        args.Value = cep.slice(0, 5) + '-' + cep.slice(5); // Insert hyphen
                        args.IsValid = true;
                    } else {
                        args.IsValid = false;
                    }
                }

                function buscarCEP() {
                    var cepField = document.getElementById('<%= txtCEP.ClientID %>');
                    var cep = cepField.value.replace(/\D/g, ''); // Remove non-digit characters
                    if (cep.length !== 8) {
                        alert("CEP inválido!");
                        return;
                    }

                    cepField.value = cep.slice(0, 5) + '-' + cep.slice(5); // Insert hyphen

                    var script = document.createElement('script');
                    script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=preencherCampos';
                    document.body.appendChild(script);
                }

                function preencherCampos(conteudo) {
                    if (!("erro" in conteudo)) {
                        document.getElementById('<%= txtLogradouro.ClientID %>').value = conteudo.logradouro;
                        document.getElementById('<%= txtBairro.ClientID %>').value = conteudo.bairro;
                        document.getElementById('<%= txtCidade.ClientID %>').value = conteudo.localidade;
                        document.getElementById('<%= txtEstado.ClientID %>').value = conteudo.uf;
                    } else {
                        alert("CEP não encontrado.");
                    }
                }
                function logToConsole() {
                    console.log('Botão Enviar clicado');
                    // Adicione mais logs ou informações que deseja imprimir
                    console.log('Logradouro:', document.getElementById('<%= txtLogradouro.ClientID %>').value);
                    console.log('Cidade:', document.getElementById('<%= txtCidade.ClientID %>').value);
                }
            </script>


        
</asp:Content>
       
