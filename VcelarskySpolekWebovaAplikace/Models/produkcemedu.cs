using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class produkcemedu
    {
        [Key]
        public int idProdukce { get; set; }
        public int idVcelstva { get; set; }
        public int idVcelare { get; set; }
        public DateTime DatumVytaceni { get; set; }
        public string TypMedu { get; set; }
        public double Mnozstvi { get; set; }
    }
}
