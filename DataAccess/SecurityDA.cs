using System;
using System.Data;
using System.Data.SqlClient;

using BusinessObject;

namespace DataAccess
{
    public class SecurityDA
    {
        //User Status Update
        public DataSet StatusUpdate(string strAccessCode) //Update when logout
        {
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@AccessCode", strAccessCode)
            };

            try
            {
                return DBHelper.ExecuteParamerizedReader("sp_UserStatusUpdate", CommandType.StoredProcedure, parameter);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Total Login Update
        public DataSet TotalLoginUpdate(int totalLogin, string strAccessCode, string strStatementType)
        {
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@totalLogin", totalLogin),
                new SqlParameter("@strAccessCode", strAccessCode),
                new SqlParameter("@strStatement", strStatementType)
            };

            try
            {
                return DBHelper.ExecuteParamerizedReader("sp_UpdateTotalLoginPage", CommandType.StoredProcedure, parameter);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Total Page Visit Update
        public DataSet TotalPageVisitUpdate(int totalPage, string strAccessCode, string strStatementType)
        {
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@totalPage", totalPage),
                new SqlParameter("@strAccessCode", strAccessCode),
                new SqlParameter("@strStatement", strStatementType)
            };

            try
            {
                return DBHelper.ExecuteParamerizedReader("sp_UpdateTotalLoginPage", CommandType.StoredProcedure, parameter);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
