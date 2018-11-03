using System;
using System.Collections.Generic;
using System.Text;

namespace CORE
{
    public interface IEntity
    {
        int Id { get; set; }
        DateTime Created { get; set; }
        DateTime? Updated { get; set; }
        DateTime? Deleted { get; set; }
    }
}
