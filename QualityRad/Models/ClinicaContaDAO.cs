using QualityRad.Login.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace QualityRad.Models
{
    public class ClinicaContaDAO
    {
        SqlCommand ioQuery;
        SqlConnection ioConexao;

        public ClinicaConta BuscarPorIdClinica(int idClinica)
        {
            ClinicaConta clinicaConta = null;

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            try
            {
                using (ioConexao = new SqlConnection(connectionString))
                {
                    ioConexao.Open();
                    ioQuery = new SqlCommand("SELECT * FROM ClinicaConta WHERE idClinica = @idClinica", ioConexao);
                    ioQuery.Parameters.AddWithValue("@idClinica", idClinica);

                    using (SqlDataReader loReader = ioQuery.ExecuteReader())
                    {
                        if (loReader.Read())
                        {
                            clinicaConta = new ClinicaConta(loReader.GetInt32(0), loReader.GetInt32(1));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao buscar relação ClinicaConta: " + ex.Message);
            }

            return clinicaConta;
        }

        public List<Clinica> BuscarPorIdConta(Account conta)
        {
            List<Clinica> loListClinicas = new List<Clinica>();

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            try
            {
                using (ioConexao = new SqlConnection(connectionString))
                {
                    ioConexao.Open();
                    ioQuery = new SqlCommand("SELECT * FROM CLINICA WHERE id_clinica IN (SELECT idClinica FROM CLINICACONTA WHERE idConta = @IDConta)", ioConexao);
                    ioQuery.Parameters.AddWithValue("@IDConta", conta.acc_id);

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
                throw new Exception("Erro ao buscar clinicas da conta: " + ex.Message);
            }

            return loListClinicas;
        }

        public void InserirNovaRelacao(ClinicaConta novaRelacao)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            try
            {
                using (ioConexao = new SqlConnection(connectionString))
                {
                    ioConexao.Open();
                    ioQuery = new SqlCommand("INSERT INTO ClinicaConta (idClinica, idConta) VALUES (@idClinica, @idConta)", ioConexao);
                    ioQuery.Parameters.AddWithValue("@idClinica", novaRelacao.idClinica);
                    ioQuery.Parameters.AddWithValue("@idConta", novaRelacao.idConta);
                    ioQuery.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Erro ao inserir nova relação ClinicaConta: " + ex.Message);
            }
        }
    }
}