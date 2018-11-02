using Microsoft.EntityFrameworkCore;
using MODELS;
using System.Threading;
using System.Threading.Tasks;

namespace AdoSql
{
    public interface IApplicationDbContext
    {
        DbSet<Person> People { get; set; }
        Task<int> SaveChangesAsync(CancellationToken cancellationToken = default(CancellationToken));
    }
}
