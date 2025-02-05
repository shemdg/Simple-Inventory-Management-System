using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpleInventoryManagementSystem
{
    public static class InventoryManager
    {
        private static List<Product> products = new List<Product>();

        // unique id
        internal static int id = 1;

        public static void AddProduct()
        {
            Console.WriteLine("---Add Product---");

            Console.Write("Enter Product Name: ");
            string name = Console.ReadLine();

            Console.Write("Enter Quantity in Stock: ");
            int quantity = 0;
            while (true)
            {
                quantity = Convert.ToInt32(Console.ReadLine());

                // for negative numbers
                if (quantity < 0)
                {
                    Console.WriteLine("Quantity should not be negative number.");
                    Console.Write("Enter Quantity in Stock: ");
                    continue;
                }
                break;
            }

            Console.Write("Enter Product Price: ");
            double price = 0;
            while (true)
            {
                price = Convert.ToDouble(Console.ReadLine());

                // for negative numbers
                if (price < 0)
                {
                    Console.WriteLine("Price should not be negative number.");
                    Console.Write("Enter product price: ");
                    continue;
                }
                break;
            }

            Product newProduct = new Product(id, name, quantity, price);
            products.Add(newProduct);

            Console.WriteLine("Product added successfully!");
        }

        public static void RemoveProduct()
        {
            if (products.Count == 0)
            {
                Console.WriteLine("No products found. Add more products to remove.");
            }
            else
            {
                Console.WriteLine("---Remove Product---");
                Console.Write("Enter Product ID to remove: ");
                int id = Convert.ToInt32(Console.ReadLine());

                Product productToRemove = null;
                foreach (var product in products)
                {
                    if (product.Id == id)
                    {
                        productToRemove = product;
                        break;
                    }
                }

                if (productToRemove != null)
                {
                    products.Remove(productToRemove);
                    Console.WriteLine("Product removed successfully.");
                }
                else
                {
                    Console.WriteLine("Product not found.");
                }
            }
        }

        public static void UpdateProduct()
        {
            Console.WriteLine("---Update Product---");

            if (products.Count == 0)
            {
                Console.WriteLine("No products found. Add more products to update.");
            }
            else
            {
                Console.Write("Enter Product ID to update: ");
                int id = Convert.ToInt32(Console.ReadLine());

                Product productToUpdate = null;
                foreach (var product in products)
                {
                    if (product.Id == id)
                    {
                        productToUpdate = product;
                        break;
                    }
                }

                if (productToUpdate != null)
                {
                    Console.Write("Enter new Quantity: ");
                    int newQuantity = Convert.ToInt32(Console.ReadLine());

                    Console.Write("Enter new Price: ");
                    double newPrice = Convert.ToDouble(Console.ReadLine());

                    if (newQuantity >= 0 && newPrice >= 0)
                    {
                        productToUpdate.QuantityInStock = newQuantity;
                        productToUpdate.Price = newPrice;

                        Console.WriteLine("Product updated successfully.");
                    }
                    else
                    {
                        Console.WriteLine("Quantity and Price should not be negative numbers.");
                    }
                }
                else
                {
                    Console.WriteLine("Product not found.");
                }
            }
        }

        public static void ListProducts()
        {
            Console.WriteLine("---Product List---");
            if (products.Count == 0)
            {
                Console.WriteLine("No products found.");
            }
            else
            {
                foreach (var product in products)
                {
                    Console.WriteLine($"ID: {product.Id}, Name: {product.Name}, Price: {product.Price}, Quantity in Stock: {product.QuantityInStock}");
                }
            }
        }

        public static void GetTotalValue()
        {
            if (products.Count == 0)
            {
                Console.WriteLine("No products found.");
            }
            else
            {
                double totalValue = 0;
                int totalQuantityInStock = 0;
                foreach (var product in products)
                {
                    Console.WriteLine($"ID: {product.Id}, Name: {product.Name}, Price: {product.Price}, Quantity in Stock: {product.QuantityInStock}");
                    totalValue += product.Price;
                    totalQuantityInStock += product.QuantityInStock;
                }
                Console.WriteLine($"Total Quantity In Stock: {totalQuantityInStock}");
                Console.WriteLine($"Total Value: {totalValue}");
            }
        }

        public static int DisplayMenu()
        {
            Console.WriteLine("Inventory Management System");
            Console.WriteLine("1. Add Products");
            Console.WriteLine("2. View Products");
            Console.WriteLine("3. Remove Product");
            Console.WriteLine("4. Update Product");
            Console.WriteLine("5. Get Total Value");
            Console.WriteLine("6. Exit");
            Console.Write("> ");
            int choice = Convert.ToInt32(Console.ReadLine());
            return choice;
        }
    }
}
