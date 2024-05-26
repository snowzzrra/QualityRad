using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Configuration;

namespace QualityRad.Models
{
    public class ClinicaDAO
    {
        SqlCommand ioQuery;
        SqlConnection ioConexao;

        public List<Clinica> BuscaClinicas(int? idClinica = null)
        {
            List<Clinica> loListClinicas = new List<Clinica>();

            // Capturando a connection string do arquivo de configuração
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            try
            {
                using (ioConexao = new SqlConnection(connectionString))
                {
                    // Tentativa de abrir a conexão
                    ioConexao.Open();

                    // Verifica se um ID foi passado para buscar uma clínica específica
                    if (idClinica.HasValue)
                    {
                        ioQuery = new SqlCommand("SELECT * FROM CLINICA WHERE id_clinica = @idClinica", ioConexao);
                        ioQuery.Parameters.Add(new SqlParameter("@idClinica", idClinica.Value));
                    }
                    else
                    {
                        ioQuery = new SqlCommand("SELECT * FROM CLINICA", ioConexao);
                    }

                    using (SqlDataReader loReader = ioQuery.ExecuteReader())
                    {
                        while (loReader.Read())
                        {
                            Clinica loNovaClinica = new Clinica(
                                loReader.GetInt32(0),
                                loReader.GetString(1),
                                loReader.GetString(2),
                                loReader.GetString(3),
                                loReader.GetString(4),
                                loReader.GetString(5),
                                loReader.GetString(6),
                                loReader.GetString(7),
                                loReader.GetString(8),
                                loReader.GetString(9),
                                loReader.GetString(10),
                                loReader.GetString(11),
                                loReader.GetString(12),
                                loReader.GetString(13),
                                loReader.GetString(14),
                                loReader.GetString(15),
                                loReader.GetString(16),
                                loReader.GetString(17)
                            );
                            loListClinicas.Add(loNovaClinica);
                        }
                        loReader.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                // Capturando e tratando a exceção caso a conexão não seja aberta com sucesso
                throw new Exception("Erro ao conectar ao banco de dados: " + ex.Message);
            }

            return loListClinicas;
        }

        public int CriarClinica(Clinica ioNovaClinica)
        {
            if (ioNovaClinica == null)
                throw new NullReferenceException();
            int liQtdRegistrosInseridos = 0;
            using (ioConexao = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                try
                {
                    ioConexao.Open();
                    ioQuery = new SqlCommand("INSERT INTO CLINICA (id_clinica, razao_social, nome_fantasia, endereco, complemento, bairro, cidade, estado, ie, cep, inscricao_municipal, email, cnpj, telefone, responsavel_legal, responsavel_tecnico, crm, crm_cpf) VALUES (@id, @razaoSocial, @nomeFantasia, @endereco, @complemento, @bairro, @cidade, @estado, @ie, @cep, @inscricaoMunicipal, @email, @cnpj, @telefone, @responsavelLegal, @responsavelTecnico, @crm, @crmCpf)", ioConexao);
                    ioQuery.Parameters.Add(new SqlParameter("@id", ioNovaClinica.IDClinica));
                    ioQuery.Parameters.Add(new SqlParameter("@razaoSocial", ioNovaClinica.RazaoSocial));
                    ioQuery.Parameters.Add(new SqlParameter("@nomeFantasia", ioNovaClinica.NomeFantasia));
                    ioQuery.Parameters.Add(new SqlParameter("@endereco", ioNovaClinica.Endereco));
                    ioQuery.Parameters.Add(new SqlParameter("@complemento", ioNovaClinica.Complemento));
                    ioQuery.Parameters.Add(new SqlParameter("@bairro", ioNovaClinica.Bairro));
                    ioQuery.Parameters.Add(new SqlParameter("@cidade", ioNovaClinica.Cidade));
                    ioQuery.Parameters.Add(new SqlParameter("@estado", ioNovaClinica.Estado));
                    ioQuery.Parameters.Add(new SqlParameter("@ie", ioNovaClinica.IE));
                    ioQuery.Parameters.Add(new SqlParameter("@cep", ioNovaClinica.CEP));
                    ioQuery.Parameters.Add(new SqlParameter("@inscricaoMunicipal", ioNovaClinica.InscricaoMunicipal));
                    ioQuery.Parameters.Add(new SqlParameter("@email", ioNovaClinica.Email));
                    ioQuery.Parameters.Add(new SqlParameter("@cnpj", ioNovaClinica.CNPJ));
                    ioQuery.Parameters.Add(new SqlParameter("@telefone", ioNovaClinica.Telefone));
                    ioQuery.Parameters.Add(new SqlParameter("@responsavelLegal", ioNovaClinica.ResponsavelLegal));
                    ioQuery.Parameters.Add(new SqlParameter("@responsavelTecnico", ioNovaClinica.ResponsavelTecnico));
                    ioQuery.Parameters.Add(new SqlParameter("@crm", ioNovaClinica.CRM));
                    ioQuery.Parameters.Add(new SqlParameter("@crmCpf", ioNovaClinica.CRMCpf));
                    liQtdRegistrosInseridos = ioQuery.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Erro ao tentar cadastrar nova clínica: " + ex.Message);
                }
            }
            return liQtdRegistrosInseridos;
        }

        public int DeletarClinica(int idClinica)
        {
            int liQtdRegistrosDeletados = 0;
            using (ioConexao = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                try
                {
                    ioConexao.Open();
                    ioQuery = new SqlCommand("DELETE FROM CLINICA WHERE id_clinica = @idClinica", ioConexao);
                    ioQuery.Parameters.Add(new SqlParameter("@idClinica", idClinica));
                    liQtdRegistrosDeletados = ioQuery.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Erro ao tentar deletar clínica: " + ex.Message);
                }
            }
            return liQtdRegistrosDeletados;
        }
    }
}
