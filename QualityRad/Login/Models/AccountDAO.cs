using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Configuration;

namespace QualityRad.Login.Models
{
    public class AccountDAO
    {
        SqlCommand ioQuery;
        SqlConnection ioConexao;

        public List<Account> BuscaContas()
        {
            List<Account> loListContas = new List<Account>();

            // Capturando a connection string do arquivo de configuração
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            try
            {         
                using (ioConexao = new SqlConnection(connectionString))
                {
                    // Tentativa de abrir a conexão
                    ioConexao.Open();
                    ioQuery = new SqlCommand("SELECT * FROM ACCOUNTS", ioConexao);
                    using (SqlDataReader loReader = ioQuery.ExecuteReader())
                    {
                        while (loReader.Read())
                        {
                            Account loNovaConta = new Account(loReader.GetInt32(0), loReader.GetString(1), loReader.GetString(2));
                            loListContas.Add(loNovaConta);
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

            return loListContas;
        }

        public bool ContaValida(Account conta)
        {
            List<Account> loListContas = new List<Account>();
            bool contaValida = false;

            // Capturando a connection string do arquivo de configuração
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            try
            {
                using (ioConexao = new SqlConnection(connectionString))
                {
                    // Tentativa de abrir a conexão
                    ioConexao.Open();
                    ioQuery = new SqlCommand("SELECT * FROM ACCOUNTS WHERE ACC_EMAIL = @email COLLATE Latin1_General_CS_AS AND ACC_SENHA = @senha COLLATE Latin1_General_CS_AS", ioConexao);
                    ioQuery.Parameters.Add(new SqlParameter("@email", conta.acc_email));
                    ioQuery.Parameters.Add(new SqlParameter("@senha", conta.acc_senha));

                    using (SqlDataReader loReader = ioQuery.ExecuteReader())
                    {
                        while (loReader.Read())
                        {
                            Account loNovaConta = new Account(loReader.GetInt32(0), loReader.GetString(1), loReader.GetString(2));
                            loListContas.Add(loNovaConta);
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

            if (loListContas.Any())
            {
                contaValida = true;
            }

            return contaValida;
        }
    }
}