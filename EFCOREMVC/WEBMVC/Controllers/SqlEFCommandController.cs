using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WEBMVC.Models;

namespace WEBMVC.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SqlEFCommandController : ControllerBase
    {
        private DataContext context;
        public SqlEFCommandController(DataContext ctx) => context = ctx;

        [HttpGet]
        public async Task<ActionResult<string>> Go()
        {
            context.Database.ExecuteSqlCommand($@"Insert into Responses(Name) values ('julius')");
            return "Go!";
        }
    }
}
