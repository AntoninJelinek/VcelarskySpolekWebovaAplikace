using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class vcelari
    {
        [Key]
        public int IdVcelare { get; set; }
        public string Jmeno { get; set; }
        public string Prijmeni { get; set; }
        public DateTime DatumNarozeni { get; set; }
        public string UzivatelskeJmeno { get; set; }
        public string Heslo { get; set; }
        public string Ulice { get; set; }
        public string Mesto { get; set; }
        public string PSC { get; set; }
        public bool OverenyClen { get; set; }
        public bool JeAdmin { get; set; }
    }
}
