using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class soubory
    {
        [Key]
        public int idSouboru { get; set; }
        public int idAutora { get; set; }
        public string NazevSouboru { get; set; }
        public string Cesta { get; set; }
        public DateTime DatumPridani { get; set; }
    }
}
