using System;
using System.Data;

using DataAccess;
using BusinessObject;

namespace BusinessLogic
{
    public class LoginAccessBL
    {
        public LoginAccessBO LoginAccessDetails(string strAccessCode)
        {
            LoginAccessDA loginRepository = new LoginAccessDA();

            try
            {
                return loginRepository.LoginAccessDetails(strAccessCode);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                loginRepository = null;
            }
        }        

        //public LoginAccessBO ReportDetails(int recID, string strStatementType)
        //{
        //    LoginAccessDA reportRepository = new LoginAccessDA();

        //    try
        //    {
        //        return reportRepository.ReportDetails(recID, strStatementType);
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //    finally
        //    {
        //        reportRepository = null;
        //    }
        //}

        //public string NewReportInsert(LoginAccessBO objBO)
        //{
        //    LoginAccessDA reportRepository = new LoginAccessDA();

        //    try
        //    {
        //        return reportRepository.NewReportInsert(objBO);
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //    finally
        //    {
        //        reportRepository = null;
        //    }
        //}
    }
}
