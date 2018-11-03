using AdoSql.Models;
using DATA.FluentMaps;
using Microsoft.EntityFrameworkCore;
using System.Threading;
using System.Threading.Tasks;

namespace AdoSql
{
    public class ApplicationDbContext : DbContext, IApplicationDbContext
    {
       
        public DbSet<Person> People { get; set; }

        public override async Task<int> SaveChangesAsync(CancellationToken cancellationToken = default(CancellationToken))
        {
            return await base.SaveChangesAsync(cancellationToken);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=DESKTOP-TDHPB1J\SQLEXPRESS02;Database=ADOSQLEXERCISECONSOLE;Trusted_Connection=True;MultipleActiveResultSets=true");
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.MapPerson();
        }
    }
}
