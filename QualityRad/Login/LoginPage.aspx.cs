using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QualityRad.Login.Models;

namespace QualityRad.Login
{
    public partial class LoginPage : System.Web.UI.Page
    {
        AccountDAO ioAccountDAO = new AccountDAO();

        public List<Account> ListaContas
        {
            get
            {
                if ((List<Account>)ViewState["ViewStateListaContas"] == null)
                    this.CarregaDados();
                return (List<Account>)ViewState["ViewStateListaContas"];
            }
            set
            {
                ViewState["ViewStateListaContas"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void CarregaDados()
        {
            this.ListaContas = this.ioAccountDAO.BuscaContas();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            decimal ldcIdConta = this.ListaContas.OrderByDescending(a => a.acc_id).First().acc_id + 1;
            string lsEmailConta = this.tbxEmail.Text;
            string lsSenhaConta = this.tbxSenha.Text;

            Account loConta = new Account(ldcIdConta, lsEmailConta, lsSenhaConta);

            if (this.ioAccountDAO.ContaValida(loConta))
            {
                Response.Redirect("~/Pages/CadastroClinica.aspx");
            }
            else
            {
                HttpContext.Current.Response.Write("<script>alert('Login inválido!');</script>");
                this.CarregaDados();
                this.tbxEmail.Text = String.Empty;
                this.tbxSenha.Text = String.Empty;
            }            
        }
    }
}