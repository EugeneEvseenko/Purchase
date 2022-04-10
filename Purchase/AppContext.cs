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
            Database.EnsureCreated();
        }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<CustomerAccount>();
            builder.Entity<PartnerAccount>();
            builder.Entity<CustomerData>()
                .Property(e => e.Gender);
            builder.Entity<PartnerData>()
                .Property(e => e.Type);
            builder.Entity<Transaction>()
                .Property(e => e.Status);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=localhost\SQLEXPRESS;Integrated Security=True;Database=PurchaseProcessing;");
        }
    }
}
