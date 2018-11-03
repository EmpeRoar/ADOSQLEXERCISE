using MODELS;
using System;
using System.Collections.Generic;
using System.Text;

namespace SERVICES
{
    public interface ICarService
    {
        SaveResult Create(Car car);
    }
}
