using System;
using System.Collections.Generic;
using System.Text;

namespace AdoSql.Models
{
    public class Person
    {
        public int PersonId { get; set; }

        public string GovId { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }

        public string Address { get; set; }

        public string BloodType { get; set; }

        public DateTime Created { get; set; }
    }
}
