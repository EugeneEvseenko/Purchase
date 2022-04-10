using Purchase.Enums;
using Purchase.Model;
using System;

namespace Purchase
{
    internal class Program
    {
        static AppContext db = new();
        static void Main(string[] args)
        {
            db.CustomerData.Add(new CustomerData
            {
                FullName = "Тестовый чувак",
                IIN = 221007400999,
                Gender = Gender.Male,
                Birthday = DateTime.Parse("07.10.1996"),
                PhysicalAddress = "Ақтау облысы, Ақтау қаласы, Кенесары көшесі, 658",
                Phones = "770717549834",
                Emails = "eugene@evseenko.kz",
                IsActive = true
            });
            db.SaveChanges();
            Console.ReadKey();
        }
    }
}
