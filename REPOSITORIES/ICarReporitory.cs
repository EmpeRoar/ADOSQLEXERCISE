using MODELS;
using System;
using System.Collections.Generic;
using System.Text;

namespace REPOSITORIES
{
    public interface ICarReporitory
    {
        SaveResult Create(Car car);
        Car GetCar(int id);
    }
}
