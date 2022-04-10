using Purchase.Enums;
using Purchase.Model;
using System;
using System.Linq;

namespace Purchase
{
    internal class Program
    {
        static AppContext db = new();
        static void Main(string[] args)
        {
            var customer = new CustomerData
            {
                FullName = "Тестовый чувак",
                IIN = "221007400999",
                Gender = Gender.X,
                Birthday = DateTime.Parse("07.10.1996"),
                PhysicalAddress = "Ақтау облысы, Ақтау қаласы, Кенесары көшесі, 658",
                Phones = "770717549834",
                Emails = "eugene@evseenko.kz",
                IsActive = true
            };
            db.CustomerData.Add(customer);
            db.SaveChanges();
            var customerAcc = new CustomerAccount
            {
                Currency = "KZT",
                IBAN = "KZ86125KZT5004100100",
                BankName = "AO Kaspi Bank",
                BIK = "CASPKZKA",
                ClientId = customer.Id,
                IsActive = true
            };
            db.CustomerAccounts.Add(customerAcc);
            db.SaveChanges();

            var partner = new PartnerData
            {
                Name = "Тестовый партнер",
                BIN = "012345678901",
                Type = PartnerType.LegalPerson,
                PhysicalAddress = "Қостанай облысы, Орал қаласы, Бейбітшілік даңғылы, 428",
                JuridicalAddress = "Атырау облысы, Қызылорда қаласы, Бұқар жырау даңғылы, 994",
                Emails = "setapo1168@xasems.com",
                IsActive = true
            };
            db.PartnerData.Add(partner);
            db.SaveChanges();
            var partnerAcc = new PartnerAccount
            {
                Currency = "KZT",
                IBAN = "KZ86125KZT5004100100",
                BankName = "AO Kaspi Bank",
                BIK = "CASPKZKA",
                PartnerId = partner.Id,
                IsActive = true
            };
            db.PartnerAccounts.Add(partnerAcc);
            db.SaveChanges();

            var transaction = new Transaction
            {
                Date = DateTime.Now,
                CustomerId = customer.Id,
                CustomerAccountId = customerAcc.Id,
                WriteOffCurrency = "KZT",
                CurrencyRate = 1,
                Fee = 200,
                Status = TransactionStates.InProgress,
                PartnerId = partner.Id,
                PartnerAccountId = partnerAcc.Id,
                ReplenishmentAmount = 10000,
                ReplenishmentCurrency = "KZT"
            };
            db.Transactions.Add(transaction);
            db.SaveChanges();
            Console.ReadKey();
        }
    }
}
