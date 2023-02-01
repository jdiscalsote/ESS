using System;
using System.Data.SqlClient;

using BusinessObject;
using System.Data;

namespace DataAccess
{
    public class SequenceDA
    {
        //For Generate
        public SequenceBO SequenceCodeGenerate(string strSequenceName)
        {
            DataSet dsSEQ = new DataSet();
            SqlParameter[] parameter = new SqlParameter[] {
                new SqlParameter("@strSequenceName", strSequenceName)
            };

            try
            {
                dsSEQ = DBHelper.ExecuteParamerizedReader("sp_GetSequenceInfo", CommandType.StoredProcedure, parameter);
                SequenceBO sequence = new SequenceBO();

                if ((dsSEQ.Tables[0].Rows.Count > 0))
                {
                    //Sequence no.
                    string strFormat = ((dsSEQ.Tables[0].Rows[0]["format"] == System.DBNull.Value) ? "" : dsSEQ.Tables[0].Rows[0]["format"]).ToString();
                    int intLastSeqCode = Convert.ToInt32(((dsSEQ.Tables[0].Rows[0]["next"] == System.DBNull.Value) ? "" : dsSEQ.Tables[0].Rows[0]["next"]).ToString());

                    //Generate new sequence
                    int intCodeLength = 6;

                    int intNewSeq = Convert.ToInt32(intLastSeqCode) + 1;
                    string strSequence = "";

                    //Determine the number of zeroes to include based on the length of intNewSeq
                    int intSeqCounter = intCodeLength - Convert.ToString(intNewSeq).Length;

                    for (int i = 0; i < intSeqCounter; i++)
                    {
                        strSequence = strSequence + "0";
                    }

                    //New sequence no.
                    strSequence = strSequence + intNewSeq;

                    sequence.NewSequence = strFormat + strSequence;
                }
                else
                {
                    sequence.SequenceType = "";
                }


                return sequence;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        //For Update
        public string SequenceCodeUpdate(string strSequenceName)
        {
            SqlParameter[] myparams = new SqlParameter[]
            {
               new SqlParameter("@strSequenceName", strSequenceName)
            };

            try
            {
                return DBHelper.ExecuteNonQuery("sp_UpdateSequenceInfo", CommandType.StoredProcedure, myparams);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
