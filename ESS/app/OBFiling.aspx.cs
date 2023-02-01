using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLogic;
using BusinessObject;

namespace ESS
{
    public partial class OBFiling : System.Web.UI.Page
    {
        public void Alert(String strMess)
        {
            String strScript = "alert('" + strMess + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", strScript, true);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

                BindDropdown();
                BindTime();
            }
        }

        public void BindDropdown()
        {
            try
            {
                ListOfValuesBL parameterSrvc = new ListOfValuesBL();

                DataSet dsClient = new DataSet();
                dsClient = parameterSrvc.ParameterIDGet(7);
                ddClient.DataSource = dsClient;
                ddClient.DataTextField = "ParamName";
                ddClient.DataValueField = "ParamCode";
                ddClient.DataBind();
                ddClient.Items.Insert(0, new ListItem("- Select -", String.Empty));
            }
            catch (Exception err)
            {
                Alert(err.Message);
            }
        }

        private void BindTime()
        {
            // Set the start time (00:00 means 12:00 AM)
            DateTime StartTime = DateTime.ParseExact("00:00", "HH:mm", null);
            // Set the end time (23:55 means 11:45 PM)
            DateTime EndTime = DateTime.ParseExact("23:45", "HH:mm", null);
            //Set 15 minutes interval
            TimeSpan Interval = new TimeSpan(0, 15, 0);
            //To set 1 hour interval
            //TimeSpan Interval = new TimeSpan(1, 0, 0);           
            ddTimeIn.Items.Clear();
            ddTimeOut.Items.Clear();
            while (StartTime <= EndTime)
            {
                ddTimeIn.Items.Add(StartTime.ToShortTimeString());
                ddTimeOut.Items.Add(StartTime.ToShortTimeString());
                StartTime = StartTime.Add(Interval);
            }
            ddTimeIn.Items.Insert(0, new ListItem("- Select -", "0"));
            ddTimeOut.Items.Insert(0, new ListItem("- Select -", "0"));
        }

        protected void ddTimeOut_TextChanged(object sender, EventArgs e)
        {
            DateTime timeIn = Convert.ToDateTime(ddTimeIn.SelectedValue);
            string tsTimeIn = timeIn.ToString("HH:mm");

            DateTime timeOut = Convert.ToDateTime(ddTimeOut.SelectedValue);
            string tsTimeOut = timeOut.ToString("HH:mm");

            DateTime dFrom, dTo;

            if (DateTime.TryParse(tsTimeIn, out dFrom) && DateTime.TryParse(tsTimeOut, out dTo))
            {
                TimeSpan TS = dTo - dFrom;
                int hour = TS.Hours;
                int mins = TS.Minutes;
                string timeDiff = hour.ToString("00") + ":" + mins.ToString("00");
                txtHoursFields.Text = timeDiff;
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", "openModal();", true);
        }

        public void AddTotalPageVisit()
        {
            try
            {
                SequenceBL generateSequence = new SequenceBL();
                SequenceBO sequence = new SequenceBO();
                SecurityBL statusUpdate = new SecurityBL();

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
    }
}