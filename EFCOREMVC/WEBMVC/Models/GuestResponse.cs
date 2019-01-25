using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WEBMVC.Models
{
    public class GuestResponse
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public bool? WillAttend { get; set; }

        public bool SoftDeleted { get; set; } = false;
    }
}
