using System;
using System.Data;

using DataAccess;
using BusinessObject;

namespace BusinessLogic
{
    public class PersonalInfoBL
    {
        //Personal Information Get
        public PersonalInfoBO PersonalInfoGet(string strAccessCode, string strEmpNo)
        {
            PersonalInfoDA personalRepository = new PersonalInfoDA();

            try
            {
                return personalRepository.PersonalInfoGet(strAccessCode, strEmpNo);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                personalRepository = null;
            }
        }
    }
}
