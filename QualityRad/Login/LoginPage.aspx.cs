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
            if (!this.IsPostBack)
            {
                this.CarregaDados();
            }

            if (Session["LoginSession"] != null)
            {
                Response.Redirect("~/Default");
            }
        }

        private void CarregaDados()
        {
            this.ListaContas = this.ioAccountDAO.BuscaContas();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // SISTEMA DE LOGIN --- COMENTADO POR ESTAR NO MODO DESENVOLVIMENTO
            //decimal ldcIdConta = this.ListaContas.OrderByDescending(a => a.acc_id).First().acc_id + 1;
            //string lsEmailConta = this.tbxEmail.Text;
            //string lsSenhaConta = this.tbxSenha.Text;

            //Account conta = this.ioAccountDAO.ContaValida(lsEmailConta, lsSenhaConta);

            //if (conta == null)
            //{
            //    HttpContext.Current.Response.Write("<script>alert('Login inválido!');</script>");
            //    this.CarregaDados();
            //    this.tbxEmail.Text = String.Empty;
            //    this.tbxSenha.Text = String.Empty;
            //} else
            //{
            //    Session["LoginSession"] = conta;
            //    Response.Redirect("~/Default");
            //}

            //DELETAR ESSE CÓDIGO APÓS FUNCIONAMENTO TOTAL:
            Session["LoginSession"] = new Account(3, "1", "1", "1", "1", 'U');
            Response.Redirect("~/Default");
        }
    }
}