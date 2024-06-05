using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class uly
    {
        [Key]
        public int IdUlu { get; set; }
        public int idStanoviste { get; set; }
        public int IdVcelare { get; set; }

        public string OznaceniUlu { get; set; }

        public string TypUlu { get; set; }
        public double? HmotnostUlu { get; set; }
        public double PocetNastavku { get; set; }
        public string TypRamku { get; set; }
    }
}
