using System;
using System.Web;
using System.Web.UI;

using BusinessLogic;
using BusinessObject;

namespace ESS
{
    public partial class Profile : System.Web.UI.Page
    {
        SecurityBL statusUpdate = new SecurityBL();

        public void Alert(String strMess)
        {
            String strScript = "alert('" + strMess + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", strScript, true);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPersonalInfo();
            }
        }

        public void BindPersonalInfo()
        {
            try
            {
                PersonalInfoBO perBO = new PersonalInfoBO();
                PersonalInfoBL perBL = new PersonalInfoBL();

                perBO = perBL.PersonalInfoGet(Convert.ToString(Session["AccessCode"]), Convert.ToString(Session["EmpNo"]));
                lblAccCode.Text = perBO.AccessCode;
                lblEmpCode.Text = perBO.EmpNo;
                lblEmpName.Text = perBO.EmployeeName;

                lblSSS.Text = perBO.SSS_No;
                lblTIN.Text = perBO.TIN_No;
                lblPHIC.Text = perBO.PHIC_No;
                lblHDMF.Text = perBO.HDMF_No;

                lblPosition.Text = perBO.Position;
                lblDepartment.Text = perBO.Department;
                lblEmpType.Text = perBO.EmploymentType;
                lblDateHired.Text = Convert.ToDateTime(perBO.DateHired).ToString("MM/dd/yyy");
                lblDateRegular.Text = Convert.ToDateTime(perBO.DateRegular).ToString("MM/dd/yyy");
                lblDateSeperated.Text = Convert.ToDateTime(perBO.DateSeperated).ToString("MM/dd/yyy");
                lblContractStart.Text = Convert.ToDateTime(perBO.ContractStart).ToString("MM/dd/yyy");
                lblContractEnd.Text = Convert.ToDateTime(perBO.ContractEnd).ToString("MM/dd/yyy");
                lblTeam.Text = perBO.Team;
                lblImmSuperior.Text = perBO.ImmediateSuperior;
                lblLocation.Text = perBO.Location;
                lblShiftSchedule.Text = perBO.ShiftSchedule;
                lblBank.Text = perBO.Bank;
                lblAccountType.Text = perBO.AccountType;
                lblAccountNo.Text = perBO.AccountNo;
                lblWebRole.Text = perBO.WebkioskRole;
                lblRegAddress.Text = perBO.RegisteredAddress;
                lblLocalAddress.Text = perBO.LocalAddress;
                lblForeignAddress.Text = perBO.ForeignAddress;
                lblTelNum.Text = perBO.TelephonNum;
                lblMobNum.Text = perBO.MobileNum;
                lblGender.Text = perBO.Gender;
                lblBirthDate.Text = Convert.ToDateTime(perBO.BirthDate).ToString("MM/dd/yyy");
                lblEmailAddress.Text = perBO.EmailAddress;
                lblMaritalStatus.Text = perBO.MaritalStatus;
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
                SequenceBL generateSequence = new SequenceBL();
                SequenceBO sequence = new SequenceBO();

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

        protected void lnkBackButton_Click(object sender, EventArgs e)
        {
            AddTotalPageVisit();
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "swal('Warning!', 'Please input your Account Code', 'warning'); ", true);
        }
    }
}