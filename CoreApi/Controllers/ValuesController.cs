using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SERVICES;

namespace CoreApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        ICarService _carService;
        public ValuesController(ICarService carService)
        {
            _carService = carService;
        }
        
        [HttpGet]
        public ActionResult<string> Get()
        {
            var result = _carService.Create(new MODELS.Car()
            {
                BuildNo = "BUILD12",
                PlateNo = "EOL092x",
                Brand = "Zander Ford",
                Created = DateTime.Now,
                Price = 20000

            });
            return Ok(result);
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public ActionResult<string> Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
