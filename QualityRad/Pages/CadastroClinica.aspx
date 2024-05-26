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

        <h2 style="text-align: center;">Lista de clínicas cadastradas</h2>
        <asp:GridView ID="gvGerenciamentoClinica" runat="server" Width="100%" AutoGenerateColumns="false" Font-Size="14px" CellPadding="4" ForeColor="#333333" GridLines="None" 
            OnRowCancelingEdit="gvGerenciamentoClinica_RowCancelingEdit" OnRowEditing="gvGerenciamentoClinica_RowEditing"
            OnRowDeleting="gvGerenciamentoClinica_RowDeleting" EmptyDataText="Nenhum dado disponível.">
            <Columns>
                <asp:TemplateField Visible="false">
                    <EditItemTemplate>
                        <asp:Label ID="lblEditIdClinica" runat="server" Text='<%# Eval("IDClinica") %>'></asp:Label>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoIdClinica" runat="server" Style="width:100%;" Text="ID"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblIdClinica" runat="server" Style="text-align:center;" Text='<%# Eval("IDClinica") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="50px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditRazaoSocial" runat="server" CssClass="form-control" Height="35px" MaxLength="100" Text='<%# Eval("RazaoSocial") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoRazaoSocial" runat="server" Style="text-align:center; display:block;" Text="Razão Social"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblRazaoSocial" runat="server" Style="text-align:left;" Text='<%# Eval("RazaoSocial") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditNomeFantasia" runat="server" CssClass="form-control" Height="35px" MaxLength="100" Text='<%# Eval("NomeFantasia") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoNomeFantasia" runat="server" Style="text-align:center; display:block;" Text="Nome Fantasia"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNomeFantasia" runat="server" Style="text-align:left;" Text='<%# Eval("NomeFantasia") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditEndereco" runat="server" CssClass="form-control" Height="35px" MaxLength="200" Text='<%# Eval("Endereco") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoEndereco" runat="server" Style="text-align:center; display:block;" Text="Endereço"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEndereco" runat="server" Style="text-align:left;" Text='<%# Eval("Endereco") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="250px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditComplemento" runat="server" CssClass="form-control" Height="35px" MaxLength="100" Text='<%# Eval("Complemento") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoComplemento" runat="server" Style="text-align:center; display:block;" Text="Complemento"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblComplemento" runat="server" Style="text-align:left;" Text='<%# Eval("Complemento") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="150px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditBairro" runat="server" CssClass="form-control" Height="35px" MaxLength="100" Text='<%# Eval("Bairro") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoBairro" runat="server" Style="text-align:center; display:block;" Text="Bairro"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblBairro" runat="server" Style="text-align:left;" Text='<%# Eval("Bairro") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="150px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditCidade" runat="server" CssClass="form-control" Height="35px" MaxLength="100" Text='<%# Eval("Cidade") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoCidade" runat="server" Style="text-align:center; display:block;" Text="Cidade"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCidade" runat="server" Style="text-align:left;" Text='<%# Eval("Cidade") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="150px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditEstado" runat="server" CssClass="form-control" Height="35px" MaxLength="2" Text='<%# Eval("Estado") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoEstado" runat="server" Style="text-align:center; display:block;" Text="Estado"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEstado" runat="server" Style="text-align:left;" Text='<%# Eval("Estado") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="50px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditIE" runat="server" CssClass="form-control" Height="35px" MaxLength="20" Text='<%# Eval("IE") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoIE" runat="server" Style="text-align:center; display:block;" Text="Inscrição Estadual"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblIE" runat="server" Style="text-align:left;" Text='<%# Eval("IE") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="150px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditCEP" runat="server" CssClass="form-control" Height="35px" MaxLength="10" Text='<%# Eval("CEP") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoCEP" runat="server" Style="text-align:center; display:block;" Text="CEP"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCEP" runat="server" Style="text-align:left;" Text='<%# Eval("CEP") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditInscricaoMunicipal" runat="server" CssClass="form-control" Height="35px" MaxLength="20" Text='<%# Eval("InscricaoMunicipal") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoInscricaoMunicipal" runat="server" Style="text-align:center; display:block;" Text="Inscrição Municipal"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblInscricaoMunicipal" runat="server" Style="text-align:left;" Text='<%# Eval("InscricaoMunicipal") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="150px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditEmail" runat="server" CssClass="form-control" Height="35px" MaxLength="100" Text='<%# Eval("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoEmail" runat="server" Style="text-align:center; display:block;" Text="Email"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Style="text-align:left;" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditCNPJ" runat="server" CssClass="form-control" Height="35px" MaxLength="18" Text='<%# Eval("CNPJ") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegexValidatorCNPJ" runat="server" ControlToValidate="tbxEditCNPJ" ValidationExpression="^\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}$" ErrorMessage="* Por favor, insira um CNPJ válido." Style="color: red;" Display="Dynamic"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoCNPJ" runat="server" Style="text-align:center; display:block;" Text="CNPJ"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCNPJ" runat="server" Style="text-align:left;" Text='<%# Eval("CNPJ") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="150px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditTelefone" runat="server" CssClass="form-control" Height="35px" MaxLength="15" Text='<%# Eval("Telefone") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoTelefone" runat="server" Style="text-align:center; display:block;" Text="Telefone"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTelefone" runat="server" Style="text-align:left;" Text='<%# Eval("Telefone") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="150px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditResponsavelLegal" runat="server" CssClass="form-control" Height="35px" MaxLength="100" Text='<%# Eval("ResponsavelLegal") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoResponsavelLegal" runat="server" Style="text-align:center; display:block;" Text="Responsável Legal"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblResponsavelLegal" runat="server" Style="text-align:left;" Text='<%# Eval("ResponsavelLegal") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditResponsavelTecnico" runat="server" CssClass="form-control" Height="35px" MaxLength="100" Text='<%# Eval("ResponsavelTecnico") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoResponsavelTecnico" runat="server" Style="text-align:center; display:block;" Text="Responsável Técnico"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblResponsavelTecnico" runat="server" Style="text-align:left;" Text='<%# Eval("ResponsavelTecnico") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="200px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditCRM" runat="server" CssClass="form-control" Height="35px" MaxLength="20" Text='<%# Eval("CRM") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoCRM" runat="server" Style="text-align:center; display:block;" Text="CRM"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCRM" runat="server" Style="text-align:left;" Text='<%# Eval("CRM") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="100px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbxEditCRMCpf" runat="server" CssClass="form-control" Height="35px" MaxLength="14" Text='<%# Eval("CRMCpf") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegexValidatorCPF" runat="server" ControlToValidate="tbxEditCRMCpf" ValidationExpression="^\d{3}\.\d{3}\.\d{3}-\d{2}$" ErrorMessage="* Por favor, insira um CPF válido." Style="color: red;" Display="Dynamic"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <HeaderTemplate>
                        <asp:Label ID="lblTextoCRMCpf" runat="server" Style="text-align:center; display:block;" Text="CRM CPF"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCRMCpf" runat="server" Style="text-align:left;" Text='<%# Eval("CRMCpf") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" Width="150px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-success" Text="Atualizar" CausesValidation="true" ValidationGroup="editVal"  />&nbsp;
                        <asp:Button ID="btnCancelar" runat="server" CommandName="Cancel" CssClass="btn btn-danger" Text="Cancelar" CausesValidation="false" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="btnEditarClinica" runat="server" CommandName="Edit" CssClass="btn btn-warning" Text="Editar" CausesValidation="false" />&nbsp;
                        <asp:Button ID="btnDeletarClinica" runat="server" CommandName="Delete" CssClass="btn btn-danger" Text="Deletar" CausesValidation="false" OnClientClick="return confirm('Tem certeza que deseja deletar?');"/>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Right" Width="350px" />
                    <ItemStyle HorizontalAlign="Right" Width="550px" />
                </asp:TemplateField>
            </Columns>
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" Font-Size="14px"/>
            <FooterStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
            <HeaderStyle HorizontalAlign="Center" Wrap="true" BackColor="#507CD1" Font-Bold="true" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="true" ForeColor="#333333" Font-Size="14px" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4B70BE" />
        </asp:GridView>
    </div>

</asp:Content>

