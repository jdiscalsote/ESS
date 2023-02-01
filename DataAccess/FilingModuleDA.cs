using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;

using BusinessObject;

namespace DataAccess
{
    public class FilingModuleDA
    {
        //Leave Filing
        public DataSet LeaveFilingListGet(string StatementType) // Header
        {
            SqlParameter[] myparams = new SqlParameter[]
            {
                new SqlParameter("@StatementType", StatementType)
            };

            try
            {
                return DBHelper.ExecuteParamerizedReader("sp_LeaveFilingGetList", CommandType.StoredProcedure, myparams);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DataSet LeaveFilingListApproversGet(string strLeaveCode, string StatementType) //Sub Header
        {
            SqlParameter[] myparams = new SqlParameter[]
            {
                new SqlParameter("@LeaveCode", strLeaveCode),
                new SqlParameter("@StatementType", StatementType)
            };

            try
            {
                return DBHelper.ExecuteParamerizedReader("sp_LeaveFilingGetList", CommandType.StoredProcedure, myparams);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Create New File
        public string FileNewInsert(FilingModuleBO fileBO)
        {
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@LeaveCode", fileBO.LeaveCode),
                new SqlParameter("@StartDate", fileBO.StartDate),
                new SqlParameter("@EndDate", fileBO.EndDate),
                new SqlParameter("@LeaveType", fileBO.LeaveType),
                new SqlParameter("@Status", fileBO.Status),
                new SqlParameter("@Quantity", fileBO.Quantity),
                new SqlParameter("@PaidLeave", fileBO.PaidLeave),
                new SqlParameter("@Reason", fileBO.Reason),
                new SqlParameter("@CreatedBy", fileBO.CreatedBy)
            };

            try
            {
                return DBHelper.ExecuteNonQuery("sp_LeaveFilingNewInsert", CommandType.StoredProcedure, parameter);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
