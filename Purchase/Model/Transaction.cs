using Purchase.Enums;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Purchase.Model
{
    public class Transaction
    {
        [Required, Column("id")]
        public long Id { get; set; }
        [Required, Column("date")]
        public DateTime Date { get; set; }
        [Required, Column("customer_id")]
        public long CustomerId { get; set; }
        [Required, Column("customer_acc_id")]
        public long CustomerAccountId { get; set; }
        [Required, Column("write_off_currency"), MaxLength(3)]
        public string WriteOffCurrency { get; set; }
        [Required, Column("currency_rate")]
        public float CurrencyRate { get; set; }
        [Required, Column("fee")]
        public float Fee { get; set; }
        [Required, Column("status")]
        public TransactionError Status { get; set; }
        [Required, Column("parntner_id")]
        public long PartnerId { get; set; }
        [Required, Column("partner_acc_id")]
        public long PartnerAccountId { get; set; }
        [Required, Column("replenishment_amount")]
        public decimal ReplenishmentAmount { get; set; }
        [Required, Column("replenishment_currency"), MaxLength(3)]
        public string ReplenishmentCurrency { get; set; }
    }
}
