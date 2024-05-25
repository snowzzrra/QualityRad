using System;
using System.Web.UI;

namespace QualityRad.Pages
{
    public partial class PQR_TesteAceita : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string razaoSocial = txtRazaoSocial.Text;
            string nomeFantasia = txtNomeFantasia.Text;
            string endereco = txtEndereco.Text;
            string complemento = txtComplemento.Text;
            string bairro = txtBairro.Text;
            string cidade = txtCidade.Text;
            string estado = txtEstado.Text;
            string ie = txtIE.Text;
            string cep = txtCEP.Text;
            string inscricaoMunicipal = txtInscricaoMunicipal.Text;
            string email = txtEmail.Text;
            string cnpj = txtCNPJ.Text;
            string telefone = txtTelefone.Text;
            string responsavelLegal = txtResponsavelLegal.Text;
            string responsavelTecnico = txtResponsavelTecnico.Text;
            string crm = txtCRM.Text;
            string crmCpf = txtCRMCpf.Text;


            Response.Write($"Razão Social: {razaoSocial}<br>Nome Fantasia: {nomeFantasia}<br>Endereço: {endereco}<br>Complemento: {complemento}<br>Bairro: {bairro}<br>Cidade: {cidade}<br>Estado: {estado}<br>IE: {ie}<br>CEP: {cep}<br>Inscrição Municipal: {inscricaoMunicipal}<br>Email: {email}<br>CNPJ: {cnpj}<br>Telefone: {telefone}<br>Responsável Legal: {responsavelLegal}<br>Responsável Técnico: {responsavelTecnico}<br>CRM: {crm}<br>CRM CPF: {crmCpf}");
        }
    }
}
