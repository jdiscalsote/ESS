using System;
using System.Data;
using System.Data.SqlClient;

using BusinessObject;

namespace DataAccess
{
    public class UsersDA
    {
        public DataSet UsersListGet()
        {
            try
            {
                return DBHelper.ExecuteReader("sp_UsersListGet", CommandType.StoredProcedure);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        //Create New Users
        public string NewUserInsert(NewUsersBO userRegister)
        {
            SqlParameter[] parameter = new SqlParameter[]
            {
                new SqlParameter("@AccessCode", userRegister.AccessCode),
                new SqlParameter("@EmpNo", userRegister.EmpNo),
                new SqlParameter("@FirstName", userRegister.FirstName),
                new SqlParameter("@MiddleName", userRegister.MiddleName),
                new SqlParameter("@LastName", userRegister.LastName),
                new SqlParameter("@UserName", userRegister.UserName),
                new SqlParameter("@Password", userRegister.Password),
                new SqlParameter("@Role", userRegister.Role),
                new SqlParameter("@CreatedBy", userRegister.CreatedBy)
            };

            try
            {
                return DBHelper.ExecuteNonQuery("sp_UserAccessInsert", CommandType.StoredProcedure, parameter);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public NewUsersBO UsersDetails(string strAccessCode)
        {
            DataSet dsAPP = new DataSet();
            NewUsersBO usersBO = new NewUsersBO();

            SqlParameter[] myparams = new SqlParameter[]
            {
                new SqlParameter("@AccessCode", strAccessCode)
            };

            try
            {
                dsAPP = DBHelper.ExecuteParamerizedReader1("SELECT * From dbo.UserAccess Where AccessCode ='" + strAccessCode + "'", CommandType.Text, myparams);

                if (dsAPP.Tables[0].Rows.Count > 0)
                {
                    //Employee Information
                    usersBO.FirstName = Convert.ToString(dsAPP.Tables[0].Rows[0]["FirstName"]);
                    usersBO.MiddleName = Convert.ToString(dsAPP.Tables[0].Rows[0]["MiddleName"]);
                    usersBO.LastName = Convert.ToString(dsAPP.Tables[0].Rows[0]["LastName"]);
                    usersBO.UserName = Convert.ToString(dsAPP.Tables[0].Rows[0]["UserName"]);
                    usersBO.Role = Convert.ToInt32(dsAPP.Tables[0].Rows[0]["Role"]);
                    usersBO.Password = Convert.ToString(dsAPP.Tables[0].Rows[0]["Password"]);
                }
                dsAPP.Clear();
                return usersBO;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
