using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class evidenceleceni
    {
        [Key]
        public int idLeciva { get; set; }
        public int idVcelstva { get; set; }
        public double Mnozstvi { get; set; }
        public string TypOsetreni { get; set; }
        public DateTime DatumLeceni { get; set; }
    }
}
