using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

using DataAccess;
using BusinessLogic;
using BusinessObject;

namespace ESS
{
    public partial class UsersProfile : System.Web.UI.Page
    {
        SecurityBL statusUpdate = new SecurityBL();
        ListOfValuesBL roles = new ListOfValuesBL();
        UsersBL userDtl = new UsersBL();

        public void Alert(String strMess)
        {
            String strScript = "alert('" + strMess + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", strScript, true);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TabName.Value = Request.Form[TabName.UniqueID];

                BindLoginAccess();
                BindRoles();
                BindUserDetails();
            }
        }

        public void BindLoginAccess()
        {
            LoginAccessBO accessBO = new LoginAccessBO();
            LoginAccessBL accessDtl = new LoginAccessBL();

            accessBO = accessDtl.LoginAccessDetails(Convert.ToString(Request["accessCode"]));
            lblEmpName.Text = accessBO.EmployeeName;
            lblRole.Text = accessBO.UserRole;
            lblTotalLogin.Text = accessBO.TotalLogin.ToString();
            lblPageVisit.Text = accessBO.TotalPage.ToString();
            lblLastLogin.Text = Convert.ToDateTime(accessBO.LastLogin).ToString();
        }

        public void BindUserDetails()
        {
            NewUsersBO userBo = new NewUsersBO();           

            userBo = userDtl.UsersDetails(Convert.ToString(Request["accessCode"]));
            txtFirstName.Text = userBo.FirstName;
            txtMiddleName.Text = userBo.MiddleName;
            txtLastName.Text = userBo.LastName;
            txtUsername.Text = userBo.UserName;
            ddRole.SelectedValue = userBo.Role.ToString();
            OldPass.Value = userBo.Password;
        }

        public void BindRoles()
        {
            try
            {
                DataSet dsDepartment = new DataSet();
                dsDepartment = roles.RolesGet("RolesGet");
                ddRole.DataSource = dsDepartment;
                ddRole.DataTextField = "RoleName";
                ddRole.DataValueField = "RoleID";
                ddRole.DataBind();
                ddRole.Items.Insert(0, new ListItem("- Select Role -", String.Empty));
                ddRole.SelectedIndex = 0;
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
            Response.Redirect("Users.aspx");
        }

        protected void btnUpdatePass_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet dsOldPass = new DataSet();
                string accessCode = Convert.ToString(Request["accessCode"]);
                dsOldPass = DBHelper.GetData("Select Password From dbo.UserAccess Where AccessCode = '" + accessCode + "' ");
                string oldPass = dsOldPass.Tables[0].Rows[0]["Password"].ToString();

                if (oldPass != txtOldPass.Text)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('Warning!', 'Old Password Not Match, Please try again!', 'warning'); ", true);                    
                }
                else
                {
                    if (txtNewPass.Text != txtConPass.Text)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('Warning!', 'Password not match, Please try again!', 'warning'); ", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('Success!', 'Password Updated!', 'success'); ", true);
                    }
                }
            }
            catch (Exception err)
            {
                Alert(err.Message);
            }
        }
    }
}