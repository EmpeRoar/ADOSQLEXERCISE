using System;

namespace ConsoleAppx
{
    public class Planet
    {
        private string _name, _address;
        public Planet(string Name, string Address)
        {
            _name = Name;
            _address = Address;
        }
        public string GetName() => _name;
        public string GetAddress() => _address;
    }
    class Program
    {
        static void Main(string[] args)
        {
            var planet = new Planet("Earth", "3rd Ring");
            Console.WriteLine($"{planet.GetName()} : {planet.GetAddress()}");
            Console.ReadLine();
        }
    }
}
