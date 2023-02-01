using System;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

using DataAccess;
using BusinessLogic;
using BusinessObject;

namespace ESS
{
    public partial class Users : System.Web.UI.Page
    {
        UsersBL usersListGet = new UsersBL();
        ListOfValuesBL roles = new ListOfValuesBL();

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
                DataSet ds = new DataSet();
                ds = usersListGet.UsersListGet();
                gridbindings(ds);

                BindRoles();
                BindStatus();
            }
        }

        public void gridbindings(DataSet ds)
        {
            var trecord = ds.Tables[0].Rows.Count;
            if (trecord > 0)
            {
                this.usersListTable.Visible = true;
                this.usersListTable.PageSize = 15;
                this.usersListTable.DataSource = ds;
                this.usersListTable.DataBind();
            }
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

        public void BindStatus()
        {
            foreach (GridViewRow row in usersListTable.Rows)
            {
                string strStatus = usersListTable.Rows[row.RowIndex].Cells[7].Text;

                string strPass = new string('*', usersListTable.Rows[row.RowIndex].Cells[5].Text.Length);
                usersListTable.Rows[row.RowIndex].Cells[5].Text = strPass;

                if (strStatus == "Online")
                {
                    usersListTable.Rows[row.RowIndex].Cells[7].CssClass = "text-success";
                }
                else
                {
                    usersListTable.Rows[row.RowIndex].Cells[7].CssClass = "text-danger";
                }
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

        public void CreateNewUser()
        {
            try
            {
                NewUsersBO newUser = new NewUsersBO();
                UsersBL userBL = new UsersBL();

                newUser.AccessCode = txtAccessCode.Text;
                newUser.EmpNo = txtEmpNo.Text;
                newUser.FirstName = txtFirstNam.Text;
                newUser.MiddleName = txtMiddleName.Text;
                newUser.LastName = txtLastNam.Text;
                newUser.UserName = txtUsername.Text;
                newUser.Password = txtPassword.Text;
                newUser.Role = Convert.ToInt32(ddRole.SelectedValue);
                newUser.CreatedBy = Convert.ToString(Session["Role"]);

                userBL.NewUserInsert(newUser);
            }
            catch (Exception err)
            {
                Alert(err.Message);
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtPassword.Text != txtConPassword.Text)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('Warning!', 'Password not match, Please try again!', 'warning') .then((value) => { $('#userForm').modal('show'); }); ", true);
                }
                else
                {
                    CreateNewUser();
                    ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "swal('Success!', 'Successfully Added!', 'success') .then((value) => { window.location.href='Users.aspx' }); ", true);
                }
            }
            catch (Exception err)
            {
                Alert(err.Message);
            }
        }

        protected void lnkView_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton btn = (LinkButton)(sender);
                string strAccessCode = btn.CommandArgument;

                AddTotalPageVisit();
                Response.Redirect("UsersProfile.aspx?accessCode=" + strAccessCode, false);
            }
            catch (Exception err)
            {
                Alert(err.Message);
            }
        }        
    }
}