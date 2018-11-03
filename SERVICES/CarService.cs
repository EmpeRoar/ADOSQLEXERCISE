using System;
using System.Collections.Generic;
using System.Text;
using MODELS;
using REPOSITORIES;

namespace SERVICES
{
    public class CarService : ICarService
    {
        ICarReporitory _repository;
        public CarService(ICarReporitory repository)
        {
            _repository = repository;
        }
        public SaveResult Create(Car car)
        {
            return _repository.Create(car);
        }
    }
}
