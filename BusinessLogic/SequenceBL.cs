using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using System.Threading.Tasks;

using BusinessObject;
using DataAccess;

namespace BusinessLogic
{
    public class SequenceBL
    {
        //Add
        public SequenceBO SequenceCodeGenerate(string strSequenceName)
        {
            SequenceDA sequenceRepository = new SequenceDA();

            try
            {
                return sequenceRepository.SequenceCodeGenerate(strSequenceName);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                sequenceRepository = null;
            }
        }

        //Update
        public string SequenceCodeUpdate(string strSequenceName)
        {
            SequenceDA sequenceRepository = new SequenceDA();

            try
            {
                return sequenceRepository.SequenceCodeUpdate(strSequenceName);
            }

            catch (Exception ex)
            {
                throw ex;
            }

            finally
            {
                sequenceRepository = null;
            }
        }
    }
}
