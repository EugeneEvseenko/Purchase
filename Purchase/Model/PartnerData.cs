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
    public class PartnerData
    {
        [Required, Column("id")]
        public long Id { get; set; }
        [Required, Column("name"), MaxLength(200)]
        public string Name { get; set; }
        [Required, Column("bin")]
        public int BIN { get; set; }
        [Required, Column("gender")]
        public PartnerType Type { get; set; }
        [Required, Column("phys_address"), MaxLength(200)]
        public string PhysicalAddress { get; set; }
        [Required, Column("jur_address"), MaxLength(200)]
        public string JuridicalAddress { get; set; }
        [Required, Column("emails"), MaxLength(300)]
        public string Emails { get; set; }
        [Required, Column("is_active")]
        public bool IsActive { get; set; }
    }
}
