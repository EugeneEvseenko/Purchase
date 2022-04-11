using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Purchase.Model;
using Purchase.Enums;

namespace Purchase
{
    public class AppContext : DbContext
    {
        public DbSet<CustomerAccount> CustomerAccounts { get; set; }
        public DbSet<CustomerData> CustomerData { get; set; }
        public DbSet<PartnerAccount> PartnerAccounts { get; set; }
        public DbSet<PartnerData> PartnerData { get; set; }
        public DbSet<Transaction> Transactions { get; set; }

        public AppContext()
        {
            Console.WriteLine("Connecting to database");
            Database.EnsureCreated();
            Console.WriteLine("Database connected\n");
        }
        // https://docs.microsoft.com/en-us/ef/core/modeling/keys?tabs=data-annotations
        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<CustomerAccount>();
            builder.Entity<PartnerAccount>();
            builder.Entity<CustomerData>()
                .Property(e => e.Gender);
            builder.Entity<PartnerData>()
                .Property(e => e.Type);
            builder.Entity<Transaction>()
                .ToTable("Transactions", "TRAN")
                .Property(e => e.Status);
                
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=tcp:kon-test-dbl;Initial Catalog=PurchaseProcessing;UID=KaspiBusinessUser;PWD=k0SX4GFf;Pooling=true;MultipleActiveResultSets=True;");
            //optionsBuilder.UseSqlServer(@"Server=localhost\SQLEXPRESS;Integrated Security=True;Database=PurchaseProcessing;");
        }
    }
}
