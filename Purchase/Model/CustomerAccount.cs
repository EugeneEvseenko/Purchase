using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Purchase.Model
{
    public class CustomerAccount
    {
        [Required, Column("id")]
        public long Id { get; set; }
        [Required, Column("currency"), MaxLength(3)]
        public string Currency { get; set; }
        [Required, Column("iban"), MaxLength(34)]
        public string IBAN { get; set; }
        [Required, Column("bank_name"), MaxLength(150)]
        public string BankName { get; set; }
        [Required, Column("bik"), MaxLength(9)]
        public string BIK { get; set; }
        [Required, Column("client_id")]
        public long ClientId { get; set; }
        [Required, Column("is_active")]
        public bool IsActive { get; set; }
    }
}
