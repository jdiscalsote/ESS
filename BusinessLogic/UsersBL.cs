using System;
using System.Data;

using DataAccess;
using BusinessObject;
namespace BusinessLogic
{
    public class UsersBL
    {
        public DataSet UsersListGet()
        {
            UsersDA usersRepository = new UsersDA();

            try
            {
                return usersRepository.UsersListGet();
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                usersRepository = null;
            }
        }

        //Create New Users
        public string NewUserInsert(NewUsersBO userRegister)
        {
            UsersDA usersRepository = new UsersDA();

            try
            {
                return usersRepository.NewUserInsert(userRegister);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                usersRepository = null;
            }
        }

        public NewUsersBO UsersDetails(string strEmpNo)
        {
            UsersDA loginRepository = new UsersDA();

            try
            {
                return loginRepository.UsersDetails(strEmpNo);
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
    }
}
