using CORE;
using System;
using System.Collections.Generic;
using System.Text;

namespace MODELS
{
    public class Car : IEntity
    {
        public int Id { get; set; }

        public string BuildNo { get; set; }
        public string PlateNo { get; set; }

        public decimal Price { get; set; }

        public string Color { get; set; }

        public string Brand { get; set; }

        public DateTime Created { get; set; }
        public DateTime? Updated { get; set; }
        public DateTime? Deleted { get; set; }
    }
}
