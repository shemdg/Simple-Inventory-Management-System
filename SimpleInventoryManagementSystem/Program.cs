using System.Net.WebSockets;

namespace SimpleInventoryManagementSystem
{
    public class Program

    {
        // list, for dynamic use and for global variable scoping
        // private static List<Product> products = new List<Product>();



        public static void Main(string[] args)
        {
            // task
            // building a simple inventory management system for a retail store using a c# console application

            // create a product class with properties:
            // ProductId (unique identifier)
            // Name
            // QuantityInStock
            // Price

            // implement methods in the InventoryManager class

            // constraints
            // product ids are positive numbers
            // prices are non-negative real numbers
            // quantites are non-negative integers
            // inventory starts at empty without any products

            while (true)
            {
                // display menu
                int userChoice = InventoryManager.DisplayMenu();

                switch (userChoice)
                {
                    case 1:
                        InventoryManager.AddProduct();
                        // mag iincrement ng 1 sa id everytime mag add si user ng product for a unique identifier
                        InventoryManager.id++;
                        break;
                    case 2:
                        InventoryManager.ListProducts();
                        break;
                    case 3:
                        InventoryManager.RemoveProduct();
                        break;
                    case 4:
                        InventoryManager.UpdateProduct();
                        break;
                    case 5:
                        InventoryManager.GetTotalValue();
                        break;
                    case 6:
                        Console.WriteLine("Exiting...");
                        return;
                    default:
                        Console.WriteLine("Please choose only from numbers 1-6.");
                        return;
                }
            }
        }


    }
}
