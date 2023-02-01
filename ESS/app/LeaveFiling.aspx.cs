using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BusinessLogic;
using BusinessObject;

namespace ESS
{
    public partial class LeaveFiling : System.Web.UI.Page
    {
        FilingModuleBL leaveBL = new FilingModuleBL();
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
                txtStartDt.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtEndDt.Text = DateTime.Now.ToString("yyyy-MM-dd");

                BindDropdown();

                DataSet ds = new DataSet();
                ds = leaveBL.LeaveFilingListGet("Header");
                gridbindings(ds);
            }
        }

        public void BindLeaveList()
        {
            DataSet ds = new DataSet();
            ds = leaveBL.LeaveFilingListGet("Header");
            gridbindings(ds);

            int trecord = ds.Tables[0].Rows.Count;
            if (trecord > 0)
            {
                panel1.Controls.Add(new LiteralControl("<div class='alert alert-success' role='alert'>"));
                panel1.Controls.Add(new LiteralControl("<strong>Success!</strong> Successfully Added Record!"));
                panel1.Controls.Add(new LiteralControl("</div>"));                
            }            
        }

        public void BindDropdown()
        {
            try
            {
                ListOfValuesBL parameterSrvc = new ListOfValuesBL();

                DataSet dsLeaveType = new DataSet();
                dsLeaveType = parameterSrvc.ParameterIDGet(5);
                ddLeaveType.DataSource = dsLeaveType;
                ddLeaveType.DataTextField = "ParamName";
                ddLeaveType.DataValueField = "ParamCode";
                ddLeaveType.DataBind();
                ddLeaveType.Items.Insert(0, new ListItem("- Select -", String.Empty));

                DataSet dsLeaveQuan = new DataSet();
                dsLeaveType = parameterSrvc.ParameterIDGet(6);
                ddQuantity.DataSource = dsLeaveType;
                ddQuantity.DataTextField = "ParamName";
                ddQuantity.DataValueField = "ParamCode";
                ddQuantity.DataBind();
                ddQuantity.Items.Insert(0, new ListItem("- Select -", String.Empty));
            }
            catch (Exception err)
            {
                Alert(err.Message);
            }
        }

        public void gridbindings(DataSet ds)
        {
            var trecord = ds.Tables[0].Rows.Count;
            if (trecord > 0)
            {
                this.leaveListTable.Visible = true;
                this.leaveListTable.PageSize = 15;
                this.leaveListTable.DataSource = ds;
                this.leaveListTable.DataBind();
            }
        }

        public void gridbindings1(DataSet ds)
        {
            var trecord = ds.Tables[0].Rows.Count;
            if (trecord > 0)
            {
                this.gridApprovers.Visible = true;
                this.gridApprovers.PageSize = 15;
                this.gridApprovers.DataSource = ds;
                this.gridApprovers.DataBind();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                SequenceBL generateSequence = new SequenceBL();
                SequenceBO sequence = new SequenceBO();

                FilingModuleBO fileBO = new FilingModuleBO();
                FilingModuleBL fileBL = new FilingModuleBL();

                sequence = generateSequence.SequenceCodeGenerate("LeaveCode");
                generateSequence.SequenceCodeUpdate("LeaveCode");
                var leaveCode = sequence.NewSequence;

                fileBO.LeaveCode = leaveCode;
                fileBO.StartDate = Convert.ToDateTime(txtStartDt.Text);
                fileBO.EndDate = Convert.ToDateTime(txtEndDt.Text);
                fileBO.LeaveType = Convert.ToInt32(ddLeaveType.SelectedValue);
                fileBO.Status = "Filed";
                fileBO.Quantity = Convert.ToInt32(ddQuantity.SelectedValue);
                fileBO.PaidLeave = "No";
                fileBO.Reason = txtReason.Text;
                fileBO.CreatedBy = Convert.ToString(Session["Username"]);
                fileBL.FileNewInsert(fileBO);

                BindLeaveList();
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
                string strLeaveCode = btn.CommandArgument;

                DataSet ds = new DataSet();
                ds = leaveBL.LeaveFilingListApproversGet(strLeaveCode, "SubHeader");
                gridbindings1(ds);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "MyScript", "openModal(); ", true);
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
    }
}