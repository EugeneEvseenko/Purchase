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
    public class CustomerData
    {
        [Required, Column("id")]
        public long Id { get; set; }
        [Required, Column("full_name"), MaxLength(200)]
        public string FullName { get; set; }
        [Required, Column("iin")]
        public long IIN { get; set; }
        [Required, Column("gender")]
        public Gender Gender { get; set; }
        [Required, Column("birthday")]
        public DateTime Birthday { get; set; }
        [Required, Column("physical_address"), MaxLength(200)]
        public string PhysicalAddress { get; set; }
        [Required, Column("phones"), MaxLength(300)]
        public string Phones { get; set; }
        [Required, Column("emails"), MaxLength(300)]
        public string Emails { get; set; }
        [Required, Column("is_active")]
        public bool IsActive { get; set; }
    }
}
