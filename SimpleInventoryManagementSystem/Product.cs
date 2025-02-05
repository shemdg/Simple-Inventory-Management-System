using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace SimpleInventoryManagementSystem
{
    class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int QuantityInStock { get; set; }
        public double Price { get; set; }


        public Product(int id, string name, int quantityInStock, double price)
        {
            Id = id;
            Name = name;
            QuantityInStock = quantityInStock;
            Price = price;
        }
    }


}
