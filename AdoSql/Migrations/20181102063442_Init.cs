using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace AdoSql.Migrations
{
    public partial class Init : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Person",
                columns: table => new
                {
                    PersonId = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    GovId = table.Column<string>(nullable: true),
                    FirstName = table.Column<string>(maxLength: 30, nullable: false),
                    LastName = table.Column<string>(maxLength: 30, nullable: false),
                    Created = table.Column<DateTime>(nullable: false, defaultValue: new DateTime(2018, 11, 2, 6, 34, 40, 841, DateTimeKind.Utc).AddTicks(1766))
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Person", x => x.PersonId);
                });

            migrationBuilder.CreateIndex(
                name: "UX_Person_GovId",
                table: "Person",
                column: "GovId",
                unique: true,
                filter: "[GovId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "UX_Person_PersonId",
                table: "Person",
                column: "PersonId",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Person");
        }
    }
}
