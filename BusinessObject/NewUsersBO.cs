using System;

namespace BusinessObject
{
    public class NewUsersBO
    {
        public string AccessCode { get; set; }
        public string EmpNo { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public int Role { get; set; }
        public string CreatedBy { get; set; }
    }
}
