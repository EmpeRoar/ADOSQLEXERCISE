using AdoSql;
using CORE;
using DATA;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using MODELS;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace REPOSITORIES
{
    public class CarReporitory : ICarReporitory
    {
       
        IServiceProvider _serviceProvider;
        public CarReporitory(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public SaveResult Create(Car car)
        {
            using (var context = new ApplicationDbContextCore(
                _serviceProvider.GetRequiredService<DbContextOptions<ApplicationDbContextCore>>()))
            {
                try
                {
                    context.Cars.Add(car);
                    var result = context.SaveChanges();

                    return new SaveResult()
                    {
                        Status = result,
                        Message = "Success"
                    };
                }
                catch (DbUpdateException ex)
                {
                    return new SaveResult()
                    {
                        Status = 0,
                        Message = $"{ex.Message} {ex.InnerException}"
                    };
                }
                
            }
        }

        public Car GetCar(int id)
        {
            throw new NotImplementedException();
        }
    }
}
