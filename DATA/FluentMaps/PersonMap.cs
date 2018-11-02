using Microsoft.EntityFrameworkCore;
using MODELS;
using System;
using System.Collections.Generic;
using System.Text;

namespace DATA.FluentMaps
{
    public static class PersonMap
    {
        public static ModelBuilder MapPerson(this ModelBuilder modelBuilder)
        {
            var entity = modelBuilder.Entity<Person>();

            // Primary Key
            entity.HasKey(x => x.PersonId);

            // Properties
            entity.Property(t => t.FirstName)
                .HasMaxLength(30)
                .IsRequired();

            entity.Property(t => t.LastName)
                .HasMaxLength(30)
                .IsRequired();

            entity.Property(t => t.GovId);

            entity.Property(t => t.Created)
                .HasDefaultValue(DateTime.Now);


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
