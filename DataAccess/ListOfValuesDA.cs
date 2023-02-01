using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;

using BusinessObject;

namespace DataAccess
{
    public class ListOfValuesDA
    {
        public DataSet RolesGet(string strStatementType) //Role
        {
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@StatementType", strStatementType)
            };

            try
            {
                return DBHelper.ExecuteParamerizedReader("sp_ListOfValues", CommandType.StoredProcedure, parameter);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Parameter [List Of Values]
        public DataSet ParameterIDGet(int paramID)
        {
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@ParamID", paramID)
            };

            try
            {
                return DBHelper.ExecuteParamerizedReader("sp_ParameterByIDGet", CommandType.StoredProcedure, parameter);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        //End Parameter [List Of Values]
    }
}
