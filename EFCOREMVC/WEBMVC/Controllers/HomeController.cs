using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WEBMVC.Models;

namespace WEBMVC.Controllers
{
    public class HomeController : Controller
    {
        private DataContext context;
        public HomeController(DataContext ctx) => context = ctx;

        public IActionResult Index() => View();

        public IActionResult Respond() => View();

        [HttpPost] public IActionResult Respond(GuestResponse response)
        {
            context.Responses.Add(response);
            context.SaveChanges();
            return RedirectToAction(nameof(Thanks), 
                new {
                    Name = response.Name,
                    WillAttend = response.WillAttend
                });
        }

        public IActionResult Thanks(GuestResponse response) => View(response);

        public IActionResult ListResponses(string searchTerm = "555-123-5678") => 
            View(context.Responses
                .Where(r => r.Phone == searchTerm)
                .Where(r => r.WillAttend == true)
                .OrderByDescending(r => r.WillAttend));

    }
}
