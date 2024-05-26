using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QualityRad.Login.Models;
using QualityRad.Models;

namespace QualityRad.Pages
{
    public partial class CadastroClinica : System.Web.UI.Page
    {
        ClinicaDAO ioClinicaDAO = new ClinicaDAO();
        ClinicaContaDAO ioClinicaContaDAO = new ClinicaContaDAO();
        Account contaLogada = null;

        public List<Clinica> ListaClinicas
        {
            get
            {
                if ((List<Clinica>)ViewState["ViewStateListaClinicas"] == null)
                    this.CarregaDados();
                return (List<Clinica>)ViewState["ViewStateListaClinicas"];
            }
            set
            {
                ViewState["ViewStateListaClinicas"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            contaLogada = (Account)Session["LoginSession"];
            if (!this.IsPostBack)
            {
                this.CarregaDados();
            }
        }

        private void CarregaDados()
        {
            this.ListaClinicas = this.ioClinicaDAO.BuscaClinicas();

            if (contaLogada.acc_tipo == 'U')
            {
                this.gvGerenciamentoClinica.DataSource = this.ioClinicaContaDAO.BuscarPorIdConta(contaLogada);
            }
            else
            {
                this.gvGerenciamentoClinica.DataSource = this.ListaClinicas;
            }
            
            this.gvGerenciamentoClinica.DataBind();
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            int idClinica = this.ListaClinicas.OrderByDescending(a => a.IDClinica).First().IDClinica + 1;
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

            Clinica newClinica = new Clinica(idClinica, razaoSocial, nomeFantasia, endereco, complemento, bairro, cidade, estado, ie, cep, inscricaoMunicipal, email, cnpj, telefone, responsavelLegal, responsavelTecnico, crm, crmCpf);

            try
            {
                this.ioClinicaDAO.CriarClinica(newClinica);
                this.ioClinicaContaDAO.InserirNovaRelacao(new ClinicaConta(idClinica, Convert.ToInt32(contaLogada.acc_id)));
                HttpContext.Current.Response.Write("<script>alert('Clinica cadastrada com sucesso!');</script>");
                this.CarregaDados();
            }

            catch (Exception ex)
            {
                throw new Exception("Erro ao conectar ao banco de dados: " + ex.Message);
            }

            this.razaoSocialTextBox.Text = String.Empty;
            this.nomeFantasiaTextBox.Text = String.Empty;
            this.enderecoTextBox.Text = String.Empty;
            this.complementoTextBox.Text = String.Empty;
            this.bairroTextBox.Text = String.Empty;
            this.cidadeTextBox.Text = String.Empty;
            this.ieTextBox.Text = String.Empty;
            this.cepTextBox.Text = String.Empty;
            this.inscricaoMunicipalTextBox.Text = String.Empty;
            this.emailTextBox.Text = String.Empty;
            this.cnpjTextBox.Text = String.Empty;
            this.telefoneTextBox.Text = String.Empty;
            this.responsavelLegalTextBox.Text = String.Empty;
            this.responsavelTecnicoTextBox.Text = String.Empty;
            this.crmTextBox.Text = String.Empty;
            this.crmCpfTextBox.Text = String.Empty;
        }

        protected void gvGerenciamentoClinica_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.gvGerenciamentoClinica.EditIndex = e.NewEditIndex;
            this.CarregaDados();
        }

        protected void gvGerenciamentoClinica_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.gvGerenciamentoClinica.EditIndex = -1;
            this.CarregaDados();
        }

        //protected void gvGerenciamentoClinica_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    int ldcIdClinica = Convert.ToInt32((this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("lblEditIdClinica") as Label).Text);
        //    string lsNomeClinica = (this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("tbxEditNome") as TextBox).Text;
        //    string lsEndereco = (this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("tbxEditEndereco") as TextBox).Text;
        //    string lsCep = (this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("tbxEditCep") as TextBox).Text;
        //    string lsInscricaoMunicipal = (this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("tbxEditInscricaoMunicipal") as TextBox).Text;
        //    string lsEmail = (this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("tbxEditEmail") as TextBox).Text;
        //    string lsCNPJ = (this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("tbxEditCNPJ") as TextBox).Text;
        //    string lsTelefone = (this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("tbxEditTelefone") as TextBox).Text;
        //    string lsResponsavelLegal = (this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("tbxEditResponsavelLegal") as TextBox).Text;
        //    string lsResponsavelTecnico = (this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("tbxEditResponsavelTecnico") as TextBox).Text;
        //    string lsCRM = (this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("tbxEditCRM") as TextBox).Text;
        //    string lsCRMCpf = (this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("tbxEditCRMCpf") as TextBox).Text;

        //    if (string.IsNullOrEmpty(lsNomeClinica))
        //    {
        //        HttpContext.Current.Response.Write("<script>alert('Por favor, digite o nome da clínica!');</script>");
        //    }
        //    else if (string.IsNullOrEmpty(lsEndereco))
        //    {
        //        HttpContext.Current.Response.Write("<script>alert('Por favor, digite o endereço da clínica!');</script>");
        //    }
        //    else if (string.IsNullOrEmpty(lsCep))
        //    {
        //        HttpContext.Current.Response.Write("<script>alert('Por favor, digite o CEP da clínica!');</script>");
        //    }
        //    else if (string.IsNullOrEmpty(lsInscricaoMunicipal))
        //    {
        //        HttpContext.Current.Response.Write("<script>alert('Por favor, digite a inscrição municipal da clínica!');</script>");
        //    }
        //    else if (string.IsNullOrEmpty(lsEmail))
        //    {
        //        HttpContext.Current.Response.Write("<script>alert('Por favor, digite o email da clínica!');</script>");
        //    }
        //    else if (string.IsNullOrEmpty(lsCNPJ))
        //    {
        //        HttpContext.Current.Response.Write("<script>alert('Por favor, digite o CNPJ da clínica!');</script>");
        //    }
        //    else if (string.IsNullOrEmpty(lsTelefone))
        //    {
        //        HttpContext.Current.Response.Write("<script>alert('Por favor, digite o telefone da clínica!');</script>");
        //    }
        //    else if (string.IsNullOrEmpty(lsResponsavelLegal))
        //    {
        //        HttpContext.Current.Response.Write("<script>alert('Por favor, digite o responsável legal da clínica!');</script>");
        //    }
        //    else if (string.IsNullOrEmpty(lsResponsavelTecnico))
        //    {
        //        HttpContext.Current.Response.Write("<script>alert('Por favor, digite o responsável técnico da clínica!');</script>");
        //    }
        //    else if (string.IsNullOrEmpty(lsCRM))
        //    {
        //        HttpContext.Current.Response.Write("<script>alert('Por favor, digite o CRM da clínica!');</script>");
        //    }
        //    else if (string.IsNullOrEmpty(lsCRMCpf))
        //    {
        //        HttpContext.Current.Response.Write("<script>alert('Por favor, digite o CPF do responsável técnico da clínica!');</script>");
        //    }
        //    else
        //    {
        //        try
        //        {
        //            Clinica loClinica = new Clinica(ldcIdClinica, lsNomeClinica, lsEndereco, lsCep, lsInscricaoMunicipal, lsEmail, lsCNPJ, lsTelefone, lsResponsavelLegal, lsResponsavelTecnico, lsCRM, lsCRMCpf);
        //            this.ioClinicaDAO.AtualizaClinica(loClinica);
        //            this.gvGerenciamentoClinica.EditIndex = -1;
        //            this.CarregaDados();
        //            HttpContext.Current.Response.Write("<script>alert('Clínica atualizada com sucesso!');</script>");
        //        }
        //        catch
        //        {
        //            HttpContext.Current.Response.Write("<script>alert('Erro na atualização do cadastro da clínica!');</script>");
        //        }
        //    }
        //}

        protected void gvGerenciamentoClinica_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int ldcIdClinica = Convert.ToInt32((this.gvGerenciamentoClinica.Rows[e.RowIndex].FindControl("lblIdClinica") as Label).Text);

                if (this.ListaClinicas.Any(a => a.IDClinica == ldcIdClinica))
                {
                    this.ioClinicaDAO.DeletarClinica(ldcIdClinica);
                    this.CarregaDados();
                    HttpContext.Current.Response.Write("<script>alert('Clínica removida com sucesso!');</script>");
                }
                else
                {
                    HttpContext.Current.Response.Write("<script>alert('Erro ao encontrar a clínica selecionada.');</script>");
                }
            }
            catch
            {
                HttpContext.Current.Response.Write("<script>alert('Erro na remoção da clínica selecionada.');</script>");
            }
        }
    }
}