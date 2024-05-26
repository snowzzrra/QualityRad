using QualityRad.Login.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QualityRad.Pages
{
    public partial class WebForm1 : System.Web.UI.Page
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
        }

        private void CarregaDados()
        {
            this.ListaContas = this.ioAccountDAO.BuscaContas();
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string name = this.tbxName.Text;
            string email = this.tbxEmail.Text;
            string password = this.tbxPassword.Text;
            string confirmPassword = this.tbxPasswordConfirm.Text;
            string phone = this.tbxPhone.Text;
            decimal ldcIdConta = this.ListaContas.OrderByDescending(a => a.acc_id).First().acc_id + 1;

            Account newConta = new Account(ldcIdConta, email, password, phone, name);

            if (password == confirmPassword && !this.ListaContas.Any(a => a.acc_fone == phone) && !this.ListaContas.Any(a => a.acc_email == email))
            {
                try
                {
                    this.ioAccountDAO.CriarConta(newConta);
                }
                catch
                {
                    HttpContext.Current.Response.Write("<script>alert('Erro no banco de dados.');</script>");
                }
                HttpContext.Current.Response.Write("<script>alert('Conta criada com sucesso!');</script>");
                Response.Redirect("LoginPage.aspx");
            }
            else
            {
                HttpContext.Current.Response.Write("<script>alert('Verifique a senha ou o telefone já existe ou o email já existe.');</script>");
            }
        }
    }
}
