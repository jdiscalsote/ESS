using System;
using System.IO;
using System.Data;
using System.Text;
using System.Net.Mail;
using System.Security.Cryptography;

using DataAccess;
using BusinessLogic;
using BusinessObject;

namespace BusinessLogic
{
    public class SecurityBL
    {
        //User Status Update
        public DataSet StatusUpdate(string strAccessCode) //Update when logout
        {
            SecurityDA securityRepository = new SecurityDA();

            try
            {
                return securityRepository.StatusUpdate(strAccessCode);
            }

            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                securityRepository = null;
            }
        }

        //Total Login Update
        public DataSet TotalLoginUpdate(int totalLogin, string strAccessCode, string strStatementType)
        {
            SecurityDA securityRepository = new SecurityDA();

            try
            {
                return securityRepository.TotalLoginUpdate(totalLogin, strAccessCode, strStatementType);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                securityRepository = null;
            }
        }

        //Total Page Visit Update
        public DataSet TotalPageVisitUpdate(int totalPage, string strAccessCode, string strStatementType)
        {
            SecurityDA securityRepository = new SecurityDA();

            try
            {
                return securityRepository.TotalPageVisitUpdate(totalPage, strAccessCode, strStatementType);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                securityRepository = null;
            }
        }

        //Data Encryption
        public string Encrypt(string stringToEncrypt)
        {
            byte[] inputByteArray = Encoding.UTF8.GetBytes(stringToEncrypt);
            byte[] rgbIV = { 0x21, 0x43, 0x56, 0x87, 0x10, 0xfd, 0xea, 0x1c };
            byte[] key = { };
            try
            {
                key = System.Text.Encoding.UTF8.GetBytes("A0D1nX0Q");
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(key, rgbIV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                return Convert.ToBase64String(ms.ToArray());
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }

        //Data Decryption
        public string Decrypt(string EncryptedText)
        {
            EncryptedText = EncryptedText.Replace(" ", "+");
            byte[] inputByteArray = new byte[EncryptedText.Length + 1];
            byte[] rgbIV = { 0x21, 0x43, 0x56, 0x87, 0x10, 0xfd, 0xea, 0x1c };
            byte[] key = { };
            int mod = EncryptedText.Length % 4;
            if (mod > 0)
            {
                EncryptedText += new string('=', 4 - mod);
            }

            try
            {
                key = System.Text.Encoding.UTF8.GetBytes("A0D1nX0Q");
                DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                inputByteArray = Convert.FromBase64String(EncryptedText);
                MemoryStream ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, rgbIV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                System.Text.Encoding encoding = System.Text.Encoding.UTF8;
                return encoding.GetString(ms.ToArray());
            }
            catch (Exception e)
            {
                return e.Message;
            }
        }
    }
}
