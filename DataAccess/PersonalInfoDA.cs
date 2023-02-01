using System;
using System.Data;
using System.Data.SqlClient;

using BusinessObject;

namespace DataAccess
{
    public class PersonalInfoDA
    {
        //Personal Information Get
        public PersonalInfoBO PersonalInfoGet(string strAccessCode, string strEmpNo)
        {
            DataSet dsAPP = new DataSet();
            PersonalInfoBO perBO = new PersonalInfoBO();

            SqlParameter[] myparams = new SqlParameter[]
            {
                new SqlParameter("@strAccessCode", strAccessCode),
                new SqlParameter("@strEmpNo", strEmpNo)
            };

            try
            {
                dsAPP = DBHelper.ExecuteParamerizedReader("sp_PersonalInfoGet", CommandType.StoredProcedure, myparams);

                if (dsAPP.Tables[0].Rows.Count > 0)
                {
                    perBO.AccessCode = Convert.ToString(dsAPP.Tables[0].Rows[0]["AccessCode"]);
                    perBO.EmpNo = Convert.ToString(dsAPP.Tables[0].Rows[0]["EmpNo"]);
                    perBO.EmployeeName = Convert.ToString(dsAPP.Tables[0].Rows[0]["EmployeeName"]);
                    perBO.TIN_No = Convert.ToString(dsAPP.Tables[0].Rows[0]["TIN_No"]);
                    perBO.SSS_No = Convert.ToString(dsAPP.Tables[0].Rows[0]["SSS_No"]);
                    perBO.PHIC_No = Convert.ToString(dsAPP.Tables[0].Rows[0]["PHIC_No"]);
                    perBO.HDMF_No = Convert.ToString(dsAPP.Tables[0].Rows[0]["HDMF_No"]);
                    perBO.Position = Convert.ToString(dsAPP.Tables[0].Rows[0]["Position"]);
                    perBO.Department = Convert.ToString(dsAPP.Tables[0].Rows[0]["Department"]);
                    perBO.EmploymentType = Convert.ToString(dsAPP.Tables[0].Rows[0]["EmploymentType"]);
                    perBO.DateHired = Convert.ToDateTime(dsAPP.Tables[0].Rows[0]["DateHired"]);
                    perBO.DateRegular = Convert.ToDateTime(dsAPP.Tables[0].Rows[0]["DateRegular"]);
                    perBO.DateSeperated = Convert.ToDateTime(dsAPP.Tables[0].Rows[0]["DateSeperated"]);
                    perBO.ContractStart = Convert.ToDateTime(dsAPP.Tables[0].Rows[0]["ContractStart"]);
                    perBO.ContractEnd = Convert.ToDateTime(dsAPP.Tables[0].Rows[0]["ContractEnd"]);
                    perBO.Team = Convert.ToString(dsAPP.Tables[0].Rows[0]["Team"]);
                    perBO.ImmediateSuperior = Convert.ToString(dsAPP.Tables[0].Rows[0]["ImmediateSuperior"]);
                    perBO.Location = Convert.ToString(dsAPP.Tables[0].Rows[0]["Location"]);
                    perBO.ShiftSchedule = Convert.ToString(dsAPP.Tables[0].Rows[0]["ShiftSchedule"]);
                    perBO.Bank = Convert.ToString(dsAPP.Tables[0].Rows[0]["Bank"]);
                    perBO.AccountType = Convert.ToString(dsAPP.Tables[0].Rows[0]["AccountType"]);
                    perBO.AccountNo = Convert.ToString(dsAPP.Tables[0].Rows[0]["AccountNo"]);
                    perBO.WebkioskRole = Convert.ToString(dsAPP.Tables[0].Rows[0]["WebkioskRole"]);
                    perBO.RegisteredAddress = Convert.ToString(dsAPP.Tables[0].Rows[0]["RegisteredAddress"]);
                    perBO.LocalAddress = Convert.ToString(dsAPP.Tables[0].Rows[0]["LocalAddress"]);
                    perBO.ForeignAddress = Convert.ToString(dsAPP.Tables[0].Rows[0]["ForeignAddress"]);
                    perBO.TelephonNum = Convert.ToString(dsAPP.Tables[0].Rows[0]["TelephonNum"]);
                    perBO.MobileNum = Convert.ToString(dsAPP.Tables[0].Rows[0]["MobileNum"]);
                    perBO.Gender = Convert.ToString(dsAPP.Tables[0].Rows[0]["Gender"]);
                    perBO.BirthDate = Convert.ToDateTime(dsAPP.Tables[0].Rows[0]["BirthDate"]);
                    perBO.EmailAddress = Convert.ToString(dsAPP.Tables[0].Rows[0]["EmailAddress"]);
                    perBO.MaritalStatus = Convert.ToString(dsAPP.Tables[0].Rows[0]["MaritalStatus"]);
                }
                dsAPP.Clear();
                return perBO;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
