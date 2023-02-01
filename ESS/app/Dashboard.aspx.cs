using System;
using System.Web;
using System.Web.UI;
using BusinessLogic;
using BusinessObject;
using System.Globalization;
using System.Web.UI.WebControls;

namespace ESS
{
    public partial class Dashboard : System.Web.UI.Page
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
                BindDropdown();
            }
        }

        public void BindDropdown()
        {
            for (int month = 1; month <= 12; month++)
            {
                string monthName = DateTimeFormatInfo.CurrentInfo.GetMonthName(month);
                ddMonth.Items.Add(new ListItem(monthName, month.ToString().PadLeft(2, '0')));
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

        protected void lnkProfile_Click(object sender, EventArgs e)
        {
            AddTotalPageVisit();
            Response.Redirect("Profile.aspx");
        }

        protected void lnkLeaveFil_Click(object sender, EventArgs e)
        {
            AddTotalPageVisit();
            Response.Redirect("LeaveFiling.aspx");
        }

        protected void lnkOBFil_Click(object sender, EventArgs e)
        {
            AddTotalPageVisit();
            Response.Redirect("OBFiling.aspx");
        }               
    }
}