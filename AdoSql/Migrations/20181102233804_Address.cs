using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace AdoSql.Migrations
{
    public partial class Address : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "Created",
                table: "Person",
                nullable: false,
                defaultValue: new DateTime(2018, 11, 2, 23, 38, 3, 691, DateTimeKind.Utc).AddTicks(2703),
                oldClrType: typeof(DateTime),
                oldDefaultValue: new DateTime(2018, 11, 2, 6, 54, 32, 207, DateTimeKind.Utc).AddTicks(4186));

            migrationBuilder.AddColumn<string>(
                name: "Address",
                table: "Person",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Address",
                table: "Person");

            migrationBuilder.AlterColumn<DateTime>(
                name: "Created",
                table: "Person",
                nullable: false,
                defaultValue: new DateTime(2018, 11, 2, 6, 54, 32, 207, DateTimeKind.Utc).AddTicks(4186),
                oldClrType: typeof(DateTime),
                oldDefaultValue: new DateTime(2018, 11, 2, 23, 38, 3, 691, DateTimeKind.Utc).AddTicks(2703));
        }
    }
}
