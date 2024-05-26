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
                            Account loNovaConta = new Account(loReader.GetInt32(0), loReader.GetString(1), loReader.GetString(2), loReader.GetString(3), loReader.GetString(4), loReader.GetString(5)[0]);
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

        public int CriarConta(Account ioNovaConta)
        {
            if (ioNovaConta == null)
                throw new NullReferenceException();
            int liQtdRegistrosInseridos = 0;
            using (ioConexao = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                try
                {
                    ioConexao.Open();
                    ioQuery = new SqlCommand("INSERT INTO ACCOUNTS (id_user, email_user, pass_user, phone_user, name_user, acc_tipo) VALUES (@id, @email, @senha, @telefone, @nome, 'U')", ioConexao);
                    ioQuery.Parameters.Add(new SqlParameter("@id", ioNovaConta.acc_id));
                    ioQuery.Parameters.Add(new SqlParameter("@email", ioNovaConta.acc_email));
                    ioQuery.Parameters.Add(new SqlParameter("@senha", ioNovaConta.acc_senha));
                    ioQuery.Parameters.Add(new SqlParameter("@telefone", ioNovaConta.acc_fone));
                    ioQuery.Parameters.Add(new SqlParameter("@nome", ioNovaConta.acc_nome));
                    liQtdRegistrosInseridos = ioQuery.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Erro ao tentar cadastrar novo usuário: " + ex);
                }
            }
            return liQtdRegistrosInseridos;
        }

        public Account ContaValida(string email, string senha)
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
                    ioQuery = new SqlCommand("SELECT * FROM ACCOUNTS WHERE EMAIL_USER = @email COLLATE Latin1_General_CS_AS AND PASS_USER = @senha COLLATE Latin1_General_CS_AS", ioConexao);
                    ioQuery.Parameters.Add(new SqlParameter("@email", email));
                    ioQuery.Parameters.Add(new SqlParameter("@senha", senha));

                    using (SqlDataReader loReader = ioQuery.ExecuteReader())
                    {
                        while (loReader.Read())
                        {
                            Account loNovaConta = new Account(loReader.GetInt32(0), loReader.GetString(1), loReader.GetString(2), loReader.GetString(3), loReader.GetString(4), loReader.GetString(5)[0]);
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
                return loListContas.FirstOrDefault();
            }

            return null;
        }
    }
}