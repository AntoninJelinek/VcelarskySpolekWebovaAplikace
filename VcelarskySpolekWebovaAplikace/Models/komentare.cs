using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class komentare
    {
        [Key]
        public int IdKomentare { get; set; }
        public string Autor { get; set; }
        public DateTime DatumVytvoreni { get; set; }
        public string Komentar { get; set; }
    }
}
