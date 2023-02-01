using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace DataAccess
{
    public class DBHelper
    {
        static internal string ExecuteNonQuery(string CommandName, CommandType cmdType, SqlParameter[] param)
        {
            int result = 0;
            string connectionString = ConfigurationManager.ConnectionStrings["ESS"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);

            DataSet ds = new DataSet();

            try
            {
                cnn.Open();

                SqlCommand cmd = new SqlCommand(CommandName, cnn);
                cmd.CommandType = cmdType;
                cmd.CommandText = CommandName;
                cmd.Parameters.AddRange(param);

                result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    return "success";
                }
                else
                {
                    return "an error occured transaction not posted.";
                }
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                cnn.Close();
            }
        }

        static internal DataSet ExecuteReader(string CommandName, CommandType CmdType)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ESS"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);

            DataSet ds = new DataSet();

            try
            {
                cnn.Open();

                SqlCommand cmd = new SqlCommand(CommandName, cnn);
                cmd.CommandType = CmdType;
                cmd.CommandText = CommandName;

                SqlDataAdapter SQLlAdap = new SqlDataAdapter(cmd);
                ds = new DataSet();
                SQLlAdap.Fill(ds);

                return ds;
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                cnn.Close();
            }

        }

        public static DataSet ExecuteParamerizedReader(string CommandName, CommandType CmdType, SqlParameter[] param)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ESS"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);

            DataSet ds = new DataSet();

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(CommandName, cnn);
                cmd.CommandType = CmdType;
                cmd.CommandText = CommandName;
                cmd.Parameters.AddRange(param);

                SqlDataAdapter SQLlAdap = new SqlDataAdapter(cmd);
                ds = new DataSet();
                SQLlAdap.Fill(ds);

                return ds;
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                cnn.Close();
            }

        }

        public static DataSet ExecuteParamerizedReader1(string CommandName, CommandType CmdType, SqlParameter[] param)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ESS"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);

            DataSet ds = new DataSet();

            try
            {
                cnn.Open();
                SqlCommand cmd = new SqlCommand(CommandName, cnn);
                cmd.CommandType = CmdType;
                cmd.CommandText = CommandName;
                cmd.Parameters.AddRange(param);

                SqlDataAdapter SQLlAdap = new SqlDataAdapter(cmd);
                ds = new DataSet();
                SQLlAdap.Fill(ds);

                return ds;
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                cnn.Close();
            }
        }

        public static DataSet GetData(string strCommand)
        {
            DataSet DS = new DataSet();

            string connectionString = ConfigurationManager.ConnectionStrings["ESS"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);

            DataSet ResultSet = new DataSet();
            SqlDataAdapter SQLAdap = new SqlDataAdapter();
            try
            {
                cnn.Open();
                SQLAdap.SelectCommand = new SqlCommand(strCommand, cnn);
                SQLAdap.Fill(ResultSet);

                return ResultSet;
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                cnn.Close();
            }
        }

        public static string InsertData(string strCommand)
        {
            int result = 0;

            string connectionString = ConfigurationManager.ConnectionStrings["SDT_WeeklyReport"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);

            try
            {
                SqlCommand sqlCom = new SqlCommand();
                cnn.Open();
                var _with1 = sqlCom;
                _with1.Connection = cnn;
                _with1.CommandText = strCommand;
                result = sqlCom.ExecuteNonQuery();

                if (result > 0)
                {
                    return "success";
                }
                else
                {
                    return "an error occured transaction not posted.";
                }

            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                cnn.Close();
            }
        }

        public static string UpdateData(string strCommand)
        {
            int result = 0;

            string connectionString = ConfigurationManager.ConnectionStrings["SDT_WeeklyReport"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);

            try
            {
                SqlCommand sqlCom = new SqlCommand();
                cnn.Open();
                var _with1 = sqlCom;
                _with1.Connection = cnn;
                _with1.CommandText = strCommand;
                result = sqlCom.ExecuteNonQuery();

                if (result > 0)
                {
                    return "success";
                }
                else
                {
                    return "an error occured transaction not posted.";
                }

            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                cnn.Close();
            }
        }
    }
}
