using System;
using System.Data;

using DataAccess;
using BusinessObject;

namespace BusinessLogic
{
    public class ListOfValuesBL
    {
        public DataSet RolesGet(string strStatementType) //Role
        {
            ListOfValuesDA lovRepository = new ListOfValuesDA();

            try
            {
                return lovRepository.RolesGet(strStatementType);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                lovRepository = null;
            }
        }

        //Parameter [List Of Values]
        public DataSet ParameterIDGet(int paramID)
        {
            ListOfValuesDA parameterRepository = new ListOfValuesDA();

            try
            {
                return parameterRepository.ParameterIDGet(paramID);
            }

            catch (Exception ex)
            {

                throw ex;
            }

            finally
            {
                parameterRepository = null;
            }
        }
        //End Parameter [List Of Values]
    }
}
