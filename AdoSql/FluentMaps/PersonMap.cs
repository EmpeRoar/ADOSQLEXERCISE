using AdoSql.Models;
using Microsoft.EntityFrameworkCore;
using System;

namespace DATA.FluentMaps
{
    public static class PersonMap
    {
        public static ModelBuilder MapPerson(this ModelBuilder modelBuilder)
        {
            var entity = modelBuilder.Entity<Person>();

            // Keys
            entity.HasKey(x => x.PersonId); // Surrogate Key
            entity.HasAlternateKey(t => t.GovId); // Alternate Key

            // Properties
            entity.Property(t => t.FirstName)
                .HasMaxLength(30)
                .IsRequired();

            entity.Property(t => t.LastName)
                .HasMaxLength(30)
                .IsRequired();

            entity.Property(t => t.Address);

            entity.Property(t => t.Created)
                .HasDefaultValue(DateTime.UtcNow);


            // Table & Column Mappings
            entity.ToTable("Person");
            entity.Property(t => t.PersonId).UseSqlServerIdentityColumn();

            // Relationships
            //entity.HasMany(a => a.Items)
            //    .WithOne(i => i.Agent)
            //    .HasForeignKey(i => i.AgentId);

            // Indexes
            entity.HasIndex(t => t.PersonId)
                .IsUnique()
                .HasName("UX_Person_PersonId");

            entity.HasIndex(t => t.GovId)
                .IsUnique()
                .HasName("UX_Person_GovId");

            return modelBuilder;

        }
    }
}
