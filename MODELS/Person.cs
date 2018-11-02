using System;

namespace MODELS
{
    public class Person
    {
        public int PersonId { get; set; }

        public string GovId { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }

        public DateTime Created { get; set; }
    }
}
