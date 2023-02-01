using System;

namespace BusinessObject
{
    public class LoginAccessBO
    {
        public int UserID { get; set; }        
        public string AccessCode { get; set; }
        public string EmployeeNum { get; set; }
        public string EmployeeName { get; set; }
        public string Username { get; set; }
        public string UserRole { get; set; }
        public string Password { get; set; }

        public int TotalLogin { get; set; }
        public int TotalPage { get; set; }

        public DateTime LastLogin { get; set; }
    }
}
