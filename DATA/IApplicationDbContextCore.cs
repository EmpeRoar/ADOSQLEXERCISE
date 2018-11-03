using Microsoft.EntityFrameworkCore;
using MODELS;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace DATA
{
    public interface IApplicationDbContextCore
    {
        DbSet<Car> Cars { get; set; }
        Task<int> SaveChangesAsync(CancellationToken cancellationToken = default(CancellationToken));
    }
}
