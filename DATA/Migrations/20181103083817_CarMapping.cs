using Microsoft.EntityFrameworkCore.Migrations;

namespace DATA.Migrations
{
    public partial class CarMapping : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Cars",
                table: "Cars");

            migrationBuilder.RenameTable(
                name: "Cars",
                newName: "Car");

            migrationBuilder.RenameColumn(
                name: "Id",
                table: "Car",
                newName: "CarId");

            migrationBuilder.AlterColumn<string>(
                name: "PlateNo",
                table: "Car",
                maxLength: 30,
                nullable: false,
                oldClrType: typeof(string),
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "Color",
                table: "Car",
                maxLength: 30,
                nullable: true,
                oldClrType: typeof(string),
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "BuildNo",
                table: "Car",
                maxLength: 30,
                nullable: true,
                oldClrType: typeof(string),
                oldNullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Car",
                table: "Car",
                column: "CarId");

            migrationBuilder.AddUniqueConstraint(
                name: "AK_Car_PlateNo",
                table: "Car",
                column: "PlateNo");

            migrationBuilder.CreateIndex(
                name: "UX_Car_BuildNo",
                table: "Car",
                column: "BuildNo",
                unique: true,
                filter: "[BuildNo] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Car_CarId",
                table: "Car",
                column: "CarId");

            migrationBuilder.CreateIndex(
                name: "UX_Car_PlateNo",
                table: "Car",
                column: "PlateNo",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Car",
                table: "Car");

            migrationBuilder.DropUniqueConstraint(
                name: "AK_Car_PlateNo",
                table: "Car");

            migrationBuilder.DropIndex(
                name: "UX_Car_BuildNo",
                table: "Car");

            migrationBuilder.DropIndex(
                name: "IX_Car_CarId",
                table: "Car");

            migrationBuilder.DropIndex(
                name: "UX_Car_PlateNo",
                table: "Car");

            migrationBuilder.RenameTable(
                name: "Car",
                newName: "Cars");

            migrationBuilder.RenameColumn(
                name: "CarId",
                table: "Cars",
                newName: "Id");

            migrationBuilder.AlterColumn<string>(
                name: "PlateNo",
                table: "Cars",
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 30);

            migrationBuilder.AlterColumn<string>(
                name: "Color",
                table: "Cars",
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 30,
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "BuildNo",
                table: "Cars",
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 30,
                oldNullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Cars",
                table: "Cars",
                column: "Id");
        }
    }
}
