using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLogic;
using BusinessObject;

namespace ESS
{
    public partial class SiteApp : System.Web.UI.MasterPage
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
                //Session Validation
                if (Session["AccessCode"] == null || Convert.ToString(Session["AccessCode"]) == "")
                {
                    Session.Abandon();
                    Response.Redirect("~/Login.aspx");
                }

                BindUserDetails();
            }
        }

        public void BindUserDetails()
        {
            LoginAccessBO usersBO = new LoginAccessBO();
            LoginAccessBL usersDtl = new LoginAccessBL();

            usersBO = usersDtl.LoginAccessDetails(Convert.ToString(Session["AccessCode"]));
            lblUsername.Text = usersBO.EmployeeName;
            lblRole.Text = usersBO.UserRole;
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

        protected void lnkDashboard_Click(object sender, EventArgs e)
        {
            AddTotalPageVisit();
            Response.Redirect("Dashboard.aspx");
        }

        protected void lnkUsers_Click(object sender, EventArgs e)
        {
            AddTotalPageVisit();
            Response.Redirect("Users.aspx");
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "swal('Logout!', 'Are you sure?', 'warning') .then((value) => { window.location.href='/Login.aspx' }); ", true);
            string accessCode = Convert.ToString(Session["AccessCode"]);
            statusUpdate.StatusUpdate(accessCode);
        }        
    }
}