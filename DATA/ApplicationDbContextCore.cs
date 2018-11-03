using CORE;
using DATA.FluentMaps;
using Microsoft.EntityFrameworkCore;
using MODELS;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace DATA
{
    public class ApplicationDbContextCore : DbContext, IApplicationDbContextCore
    {
        public ApplicationDbContextCore(DbContextOptions<ApplicationDbContextCore> options) : base(options)
        {

        }

        public DbSet<Car> Cars { get; set; }

        public override async Task<int> SaveChangesAsync(CancellationToken cancellationToken = default(CancellationToken))
        {
            return await base.SaveChangesAsync(cancellationToken);
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=DESKTOP-TDHPB1J\SQLEXPRESS02;Database=ADOSQLEXERCISECONSOLE2;Trusted_Connection=True;MultipleActiveResultSets=true");
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.MapCar();
        }
    }
}
