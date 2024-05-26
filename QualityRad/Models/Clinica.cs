using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QualityRad.Models
{
    [Serializable]
    public class Clinica
    {
        public int IDClinica { get; set; }
        public string RazaoSocial { get; set; }
        public string NomeFantasia { get; set; }
        public string Endereco { get; set; }
        public string Complemento { get; set; }
        public string Bairro { get; set; }
        public string Cidade { get; set; }
        public string Estado { get; set; }
        public string IE { get; set; }
        public string CEP { get; set; }
        public string InscricaoMunicipal { get; set; }
        public string Email { get; set; }
        public string CNPJ { get; set; }
        public string Telefone { get; set; }
        public string ResponsavelLegal { get; set; }
        public string ResponsavelTecnico { get; set; }
        public string CRM { get; set; }
        public string CRMCpf { get; set; }

        public Clinica(int idClinica, string razaoSocial, string nomeFantasia, string endereco, string complemento, string bairro, string cidade, string estado, string ie, string cep, string inscricaoMunicipal, string email, string cnpj, string telefone, string responsavelLegal, string responsavelTecnico, string crm, string crmCpf)
        {
            this.IDClinica = idClinica;
            this.RazaoSocial = razaoSocial;
            this.NomeFantasia = nomeFantasia;
            this.Endereco = endereco;
            this.Complemento = complemento;
            this.Bairro = bairro;
            this.Cidade = cidade;
            this.Estado = estado;
            this.IE = ie;
            this.CEP = cep;
            this.InscricaoMunicipal = inscricaoMunicipal;
            this.Email = email;
            this.CNPJ = cnpj;
            this.Telefone = telefone;
            this.ResponsavelLegal = responsavelLegal;
            this.ResponsavelTecnico = responsavelTecnico;
            this.CRM = crm;
            this.CRMCpf = crmCpf;
        }
    }
}