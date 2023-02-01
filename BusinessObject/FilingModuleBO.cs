using System;

namespace BusinessObject
{
    public class FilingModuleBO
    {
        public string LeaveCode { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int LeaveType { get; set; }
        public string Status { get; set; }
        public int Quantity { get; set; }
        public string PaidLeave { get; set; }
        public string Reason { get; set; }

        public string CreatedBy { get; set; }
    }
}
