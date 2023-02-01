using System;
using System.Data;
using System.Data.SqlClient;

using BusinessObject;

namespace DataAccess
{
    public class LoginAccessDA
    {
        public LoginAccessBO LoginAccessDetails(string strAccessCode)
        {
            DataSet dsAPP = new DataSet();
            LoginAccessBO usersBO = new LoginAccessBO();

            SqlParameter[] myparams = new SqlParameter[]
            {
                new SqlParameter("@strAccessCode", strAccessCode)
            };

            try
            {
                dsAPP = DBHelper.ExecuteParamerizedReader1("SELECT ua.UserId, ua.AccessCode, ua.EmpNo, concat(ua.FirstName,' ',ua.MiddleName,' ',ua.LastName) as 'EmpNam', ua.Username, ua.Password, (Select RoleName From dbo.UserRole Where RoleId = ua.Role) as 'Role', (case when TotalLogin is null then 0 else TotalLogin end) as 'TotalLogin', (case when TotalPageVisit is null then 0 else TotalPageVisit end) as 'TotalPageVisit', (case when LastLoginDate is null then '01/01/1991 00:00:00' else LastLoginDate end) as 'LastLoginDate' FROM UserAccess ua where AccessCode='" + strAccessCode + "'", CommandType.Text, myparams);

                if (dsAPP.Tables[0].Rows.Count > 0)
                {
                    //Users Information
                    usersBO.UserID = Convert.ToInt32(dsAPP.Tables[0].Rows[0]["UserID"]);
                    usersBO.AccessCode = dsAPP.Tables[0].Rows[0]["AccessCode"].ToString();
                    usersBO.EmployeeNum = dsAPP.Tables[0].Rows[0]["EmpNo"].ToString();
                    usersBO.EmployeeName = dsAPP.Tables[0].Rows[0]["EmpNam"].ToString();
                    usersBO.Username = dsAPP.Tables[0].Rows[0]["Username"].ToString();
                    usersBO.Password = dsAPP.Tables[0].Rows[0]["Password"].ToString();
                    usersBO.UserRole = dsAPP.Tables[0].Rows[0]["Role"].ToString();
                    usersBO.TotalLogin = Convert.ToInt32(dsAPP.Tables[0].Rows[0]["TotalLogin"]);
                    usersBO.TotalPage = Convert.ToInt32(dsAPP.Tables[0].Rows[0]["TotalPageVisit"]);
                    usersBO.LastLogin = Convert.ToDateTime(dsAPP.Tables[0].Rows[0]["LastLoginDate"]);
                }
                dsAPP.Clear();
                return usersBO;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }        

        //public LoginAccessBO ReportDetails(int recID, string strStatementType)
        //{
        //    DataSet dsEmp = new DataSet();
        //    LoginAccessBO objBO = new LoginAccessBO();

        //    SqlParameter[] myparams = new SqlParameter[]
        //    {
        //        new SqlParameter("@RecID", recID),
        //        new SqlParameter("@StatementType", strStatementType)
        //    };

        //    try
        //    {
        //        dsEmp = DBHelper.ExecuteParamerizedReader("sp_WeeklyReportGet", CommandType.StoredProcedure, myparams);

        //        if (dsEmp.Tables[0].Rows.Count > 0)
        //        {
        //            objBO.Week = Convert.ToDateTime(dsEmp.Tables[0].Rows[0]["Week"]);
        //            objBO.Type = dsEmp.Tables[0].Rows[0]["Type"].ToString();
        //            objBO.NewTarget = dsEmp.Tables[0].Rows[0]["NewTarget"].ToString();
        //            objBO.CaseNo = dsEmp.Tables[0].Rows[0]["CaseNo"].ToString();
        //            objBO.GLPINo = dsEmp.Tables[0].Rows[0]["GLPINo"].ToString();
        //            objBO.Description = dsEmp.Tables[0].Rows[0]["Description"].ToString();
        //            objBO.Phase = dsEmp.Tables[0].Rows[0]["Phase"].ToString();
        //            objBO.Status = dsEmp.Tables[0].Rows[0]["Status"].ToString();
        //            objBO.PendingWith = dsEmp.Tables[0].Rows[0]["PendingWith"].ToString();
        //            objBO.Remarks = dsEmp.Tables[0].Rows[0]["Remarks"].ToString();
        //            objBO.CreatedDate = Convert.ToDateTime(dsEmp.Tables[0].Rows[0]["CreatedDate"]);
        //        }
        //        dsEmp.Clear();
        //        return objBO;
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //public string NewReportInsert(LoginAccessBO objBO)
        //{
        //    SqlParameter[] parameter = new SqlParameter[]
        //    {
        //        new SqlParameter("@Week", objBO.Week),
        //        new SqlParameter("@Type", objBO.Type),
        //        new SqlParameter("@NewTarget", objBO.NewTarget),
        //        new SqlParameter("@CaseNo", objBO.CaseNo),
        //        new SqlParameter("@GLPINo", objBO.GLPINo),
        //        new SqlParameter("@Description", objBO.Description),
        //        new SqlParameter("@Phase", objBO.Phase),
        //        new SqlParameter("@Status", objBO.Status),
        //        new SqlParameter("@PendingWith", objBO.PendingWith),
        //        new SqlParameter("@Remarks", objBO.Remarks),
        //        new SqlParameter("@CreatedBy", objBO.CreatedBy),
        //        new SqlParameter("@CreatedDate", objBO.CreatedDate)
        //    };

        //    try
        //    {
        //        return DBHelper.ExecuteNonQuery("sp_WeeklyReportInsert", CommandType.StoredProcedure, parameter);
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
    }
}
