using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

using DataAccess;
using BusinessLogic;
using BusinessObject;

namespace ESS
{
    public partial class Login : System.Web.UI.Page
    {
        //SQL Connection String
        string strConnString = ConfigurationManager.ConnectionStrings["ESS"].ConnectionString;

        LoginAccessBL userSrvc = new LoginAccessBL();
        LoginAccessBO userObj = new LoginAccessBO();
        SecurityBL statusUpdate = new SecurityBL();

        SequenceBL generateSequence = new SequenceBL();
        SequenceBO sequence = new SequenceBO();

        SqlCommand com;
        SqlParameter AccessCode, EmpNo, Username, Password;

        public void Alert(String strMess)
        {
            String strScript = "alert('" + strMess + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", strScript, true);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Session Validation
                if (Session["AccessCode"] == null || Convert.ToString(Session["AccessCode"]) == "")
                {
                    string accessCode = Convert.ToString(Session["AccessCode"]);
                    statusUpdate.StatusUpdate(accessCode);
                }
            }
        }

        public void AddTotalLogin()
        {
            try
            {
                sequence = generateSequence.SequenceCodeGenerate("TotalLogin");
                generateSequence.SequenceCodeUpdate("TotalLogin");
                int intTotalLogin = Convert.ToInt32(sequence.NewSequence);

                statusUpdate.TotalLoginUpdate(intTotalLogin, Convert.ToString(Session["AccessCode"]), "TotalLogin");
            }
            catch (Exception err)
            {
                Alert(err.Message);
            }
        }

        public void AddTotalPageVisit()
        {
            try
            {
                sequence = generateSequence.SequenceCodeGenerate("TotalPage");
                generateSequence.SequenceCodeUpdate("TotalPage");
                int intTotalPage = Convert.ToInt32(sequence.NewSequence);

                statusUpdate.TotalPageVisitUpdate(intTotalPage, Convert.ToString(Session["AccessCode"]), "TotalPage");
            }
            catch (Exception err)
            {
                Alert(err.Message);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            AccessCode = new SqlParameter();
            EmpNo = new SqlParameter();
            Username = new SqlParameter();
            Password = new SqlParameter();
            SqlConnection con = new SqlConnection(strConnString);

            com = new SqlCommand();
            com.Connection = con;
            con.Open();

            Session["AccessCode"] = txtAccountCode.Text;
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "sp_UserLogin";

            AccessCode.SqlDbType = SqlDbType.VarChar;
            AccessCode.Size = 50;
            AccessCode.ParameterName = "@strAccessCode";
            AccessCode.Value = txtAccountCode.Text.ToString();
            AccessCode.Direction = ParameterDirection.Input;

            EmpNo.SqlDbType = SqlDbType.VarChar;
            EmpNo.Size = 50;
            EmpNo.ParameterName = "@strEmpNo";
            EmpNo.Value = txtEmpNoNam.Text.ToString();
            EmpNo.Direction = ParameterDirection.Input;

            Username.SqlDbType = SqlDbType.VarChar;
            Username.Size = 50;
            Username.ParameterName = "@strUserNam";
            Username.Value = txtEmpNoNam.Text.ToString();
            Username.Direction = ParameterDirection.Input;

            Password.SqlDbType = SqlDbType.VarChar;
            Password.Size = 50;
            Password.ParameterName = "@strPassword";
            Password.Value = txtPassword.Text.ToString();
            Password.Direction = ParameterDirection.Input;

            com.Parameters.Add(AccessCode);
            com.Parameters.Add(EmpNo);
            com.Parameters.Add(Username);
            com.Parameters.Add(Password);

            string strAccessCode = Session["AccessCode"].ToString();
            userObj = userSrvc.LoginAccessDetails(strAccessCode);
            Session["AccessCode"] = userObj.AccessCode;
            Session["EmpNo"] = userObj.EmployeeNum;
            Session["Username"] = userObj.Username;
            Session["Role"] = userObj.UserRole;

            int status;

            status = Convert.ToInt16(com.ExecuteScalar());

            if (status == 1)
            {
                txtAccountCode.Text = null;
                txtEmpNoNam.Text = null;
                txtPassword.Text = null;

                ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "swal('Success!', 'Logged In Success!', 'success') .then((value) => { window.location.href='app/Dashboard.aspx' }); ", true);

                AddTotalLogin();
                AddTotalPageVisit();
            }
            else
            {                
                ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "swal('Error!', 'Invalid Account!', 'error') .then((value) => { window.location.href='Login.aspx' }); ", true);
                txtAccountCode.Text = null;
                txtEmpNoNam.Text = null;
                txtPassword.Text = null;
            }                 

            con.Close();
        }
    }
}