using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace AdoSql.Migrations
{
    public partial class BloodType : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "Created",
                table: "Person",
                nullable: false,
                defaultValue: new DateTime(2018, 11, 3, 0, 15, 39, 928, DateTimeKind.Utc).AddTicks(850),
                oldClrType: typeof(DateTime),
                oldDefaultValue: new DateTime(2018, 11, 2, 23, 38, 3, 691, DateTimeKind.Utc).AddTicks(2703));

            migrationBuilder.AddColumn<string>(
                name: "BloodType",
                table: "Person",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "BloodType",
                table: "Person");

            migrationBuilder.AlterColumn<DateTime>(
                name: "Created",
                table: "Person",
                nullable: false,
                defaultValue: new DateTime(2018, 11, 2, 23, 38, 3, 691, DateTimeKind.Utc).AddTicks(2703),
                oldClrType: typeof(DateTime),
                oldDefaultValue: new DateTime(2018, 11, 3, 0, 15, 39, 928, DateTimeKind.Utc).AddTicks(850));
        }
    }
}
