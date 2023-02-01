using System;
using System.Data;

using DataAccess;
using BusinessObject;

namespace BusinessLogic
{
    public class FilingModuleBL
    {
        //Leave Filing
        public DataSet LeaveFilingListGet(string StatementType) //Header
        {
            FilingModuleDA leaveRepository = new FilingModuleDA();

            try
            {
                return leaveRepository.LeaveFilingListGet(StatementType);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                leaveRepository = null;
            }
        }

        public DataSet LeaveFilingListApproversGet(string strLeaveCode, string StatementType) //Sub Header
        {
            FilingModuleDA leaveRepository = new FilingModuleDA();

            try
            {
                return leaveRepository.LeaveFilingListApproversGet(strLeaveCode, StatementType);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                leaveRepository = null;
            }
        }

        //Create New File
        public string FileNewInsert(FilingModuleBO fileBO)
        {
            FilingModuleDA leaveRepository = new FilingModuleDA();

            try
            {
                return leaveRepository.FileNewInsert(fileBO);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                leaveRepository = null;
            }
        }

    }
}
