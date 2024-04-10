using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QualityRad.Pages
{
    public partial class CadastroClinica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            

            string razaoSocial = razaoSocialTextBox.Text;
            string nomeFantasia = nomeFantasiaTextBox.Text;
            string endereco = enderecoTextBox.Text;
            string complemento = complementoTextBox.Text;
            string bairro = bairroTextBox.Text;
            string cidade = cidadeTextBox.Text;
            string estado = estadoTextBox.Text;
            string ie = ieTextBox.Text;
            string cep = cepTextBox.Text;
            string inscricaoMunicipal = inscricaoMunicipalTextBox.Text;
            string email = emailTextBox.Text;
            string cnpj = cnpjTextBox.Text;
            string telefone = telefoneTextBox.Text;
            string responsavelLegal = responsavelLegalTextBox.Text;
            string responsavelTecnico = responsavelTecnicoTextBox.Text;
            string crm = crmTextBox.Text;
            string crmCpf = crmCpfTextBox.Text;

        }
    }
}