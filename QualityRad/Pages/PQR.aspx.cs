using QualityRad.Login.Models;
using System;
using System.Web.UI;

namespace QualityRad.Pages
{
    public partial class PQR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Coleta dos valores dos controles
            string razaoSocial = txtRazaoSocial.Text;
            string nomeFantasia = txtNomeFantasia.Text;
            string cnpj = txtCNPJ.Text;
            string email = txtEmail.Text;
            string telefone = txtTelefone.Text;
            string cep = txtCEP.Text;
            string logradouro = txtLogradouro.Text;
            string bairro = txtBairro.Text;
            string cidade = txtCidade.Text;
            string estado = txtEstado.Text;
            string complemento = txtComplemento.Text;
            string numero = txtNumero.Text;
            string ie = txtIE.Text;
            string inscricaoMunicipal = txtInscricaoMunicipal.Text;
            string responsavelLegal = txtResponsavelLegal.Text;
            string responsavelTecnico = txtResponsavelTecnico.Text;
            string crm = txtCRM.Text;
            string crmCpf = txtCRMCpf.Text;
            string nomeProprietario = TextBox1.Text;
            string fabricante = txtFabricante.Text;
            string dataRegistro = txtDataRegistro.Text;
            string numeroRegistro = txtNumeroRegistro.Text;
            string anoAquisicao = txtAnoAquisicao.Text;

            // Processar ou armazenar os dados conforme necessário
            // Exemplo: salvar em banco de dados, enviar e-mail, etc.

            // Para fins de exemplo, vamos apenas exibir os dados no console (você deve substituir isso pela sua lógica)
            Console.WriteLine("Razão Social: " + razaoSocial);
            Console.WriteLine("Nome Fantasia: " + nomeFantasia);
            // Continue para os outros campos...

            // Se você deseja exibir uma mensagem de sucesso ou redirecionar o usuário, faça isso aqui
            // Exemplo: Response.Write("Formulário enviado com sucesso!");
        }
    }
}

