using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QualityRad.Login.Models
{
    [Serializable]
    public class Account
    {
        public decimal acc_id { get; set; }
        public string acc_email { get; set; }
        public string acc_senha { get; set; }
        public string acc_fone { get; set; }
        public string acc_nome { get; set; }

        public Account(decimal id, string email, string senha, string telefone, string nome)
        {
            this.acc_id = id;
            this.acc_email = email;
            this.acc_senha = senha;
            this.acc_fone = telefone;
            this.acc_nome = nome;
        }
    }
}