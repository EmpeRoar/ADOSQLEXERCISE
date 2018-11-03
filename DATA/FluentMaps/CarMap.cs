using Microsoft.EntityFrameworkCore;
using MODELS;
using System;
using System.Collections.Generic;
using System.Text;

namespace DATA.FluentMaps
{
    public static class CarMap
    {
        public static ModelBuilder MapCar(this ModelBuilder modelBuilder)
        {
            var entity = modelBuilder.Entity<Car>();

            // 1. Keys
            entity.HasKey(x => x.Id);
            entity.HasAlternateKey(x => x.PlateNo);

            // 2. Properties
            entity.Property(t => t.Id)
               .HasColumnName("CarId");

            entity.Property(t => t.PlateNo)
               .HasMaxLength(30);

            entity.Property(t => t.BuildNo)
               .HasMaxLength(30);

            entity.Property(t => t.Color)
               .HasMaxLength(30);

            // 3. Table & Column Mappings
            entity.ToTable("Car");
            entity.Property(t => t.Id).UseSqlServerIdentityColumn();

            // 4. Relationships

            // 5. Indexes
            entity.HasIndex(t => t.Id)
                  .HasName("IX_Car_CarId");

            entity.HasIndex(t => t.BuildNo)
                  .IsUnique()
                  .HasName("UX_Car_BuildNo");

            entity.HasIndex(t => t.PlateNo)
                  .IsUnique()
                  .HasName("UX_Car_PlateNo");

            return modelBuilder;
        }
    }
}
