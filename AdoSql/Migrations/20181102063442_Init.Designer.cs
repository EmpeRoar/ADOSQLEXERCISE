﻿// <auto-generated />
using System;
using AdoSql;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace AdoSql.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    [Migration("20181102063442_Init")]
    partial class Init
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.2.0-preview3-35497")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("MODELS.Person", b =>
                {
                    b.Property<int>("PersonId")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("Created")
                        .ValueGeneratedOnAdd()
                        .HasDefaultValue(new DateTime(2018, 11, 2, 6, 34, 40, 841, DateTimeKind.Utc).AddTicks(1766));

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasMaxLength(30);

                    b.Property<string>("GovId");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasMaxLength(30);

                    b.HasKey("PersonId");

                    b.HasIndex("GovId")
                        .IsUnique()
                        .HasName("UX_Person_GovId")
                        .HasFilter("[GovId] IS NOT NULL");

                    b.HasIndex("PersonId")
                        .IsUnique()
                        .HasName("UX_Person_PersonId");

                    b.ToTable("Person");
                });
#pragma warning restore 612, 618
        }
    }
}
