using QualityRad.Login.Models;

using System;
using System.Collections;
using System.IO;
using System.Web.UI;
using iTextSharp.text.pdf;
using System.Collections.Generic;
using System.Web;
using System.Linq;

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
            string nomeProprietario = txtNomeProprietario.Text;
            string fabricante = txtFabricante.Text;
            string dataRegistro = txtDataRegistro.Text;
            string numeroRegistro = txtNumeroRegistro.Text;
            string anoAquisicao = txtAnoAquisicao.Text;
            // Formatação do endereço completo
            List<string> partesEndereco = new List<string>
            {
                logradouro,
                bairro,
                numero,
                complemento,
                cidade,
                estado
            };
            string endereco = string.Join(", ", partesEndereco.Where(part => !string.IsNullOrEmpty(part)));

            // Preenche o PDF com os dados coletados
            ArrayList dados = new ArrayList
            {
                "",//0
                "",//1
                "",//2
                email,//3
                endereco,//4
                razaoSocial,//5
                responsavelLegal,//6
                inscricaoMunicipal,//7
                nomeFantasia,//8
                telefone,//9
                responsavelTecnico,//10
                cnpj,//11
                cep,//12
                crm,//13
                "",//14
                "",//15
                "",//16
                "",//17
                "",//18
                "",//19
                "",//20
                "",//21
                crmCpf,//22


                /*ie,
                nomeProprietario,
                fabricante,
                dataRegistro,
                numeroRegistro,
                anoAquisicao*/
            };

            GerarPDF(dados);
        }

        private void GerarPDF(ArrayList dados)
        {
            // Caminho para o PDF original (editável)
            string caminhoPDF = Server.MapPath("../Resources/Formulario.pdf");

            Response.ContentType = "application/pdf";
            Response.AppendHeader("Content-Disposition", "attachment; filename=FormularioPreenchido.pdf");

            // Abre o PDF original
            PdfReader pdfReader = new PdfReader(caminhoPDF);
            PdfStamper pdfStamper = new PdfStamper(pdfReader, Response.OutputStream);

            // Obtém os campos do formulário
            AcroFields campos = pdfStamper.AcroFields;
            IDictionary<string, AcroFields.Item> camposDoFormulario = campos.Fields;

            int i = 0, j = 0;

            // Preenche os campos do formulário com os dados coletados na ordem
            foreach (string nomeCampo in camposDoFormulario.Keys)
            {
                if (i < dados.Count) // Garantir que não exceda o número de dados disponíveis
                {
                    campos.SetField(nomeCampo, dados[i].ToString());
                    System.Diagnostics.Debug.WriteLine(dados[i].ToString());
                    i++; // Incrementa o contador de dados
                }
                else
                {
                    break; // Sai do loop se não houver mais dados para preencher
                }
            }

            // Fecha o PDF
            pdfStamper.FormFlattening = true; // Torna os campos preenchidos parte do conteúdo do PDF
            pdfStamper.Close();
            pdfReader.Close();

            HttpContext.Current.ApplicationInstance.CompleteRequest();
        }

    }
}
