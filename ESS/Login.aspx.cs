using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESS
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtAccountCode.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "swal('Warning!', 'Please input your Account Code', 'warning'); ", true);
            }
            else if (txtUsername.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "swal('Warning!', 'Please input your Username', 'warning'); ", true);
            }
            else if (txtPassword.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "swal('Warning!', 'Please input your Password', 'warning'); ", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", "swal('Success!', 'Logged In Success!', 'success') .then((value) => { window.location.href='app/Dashboard.aspx' }); ", true);
            }
        }
    }
}