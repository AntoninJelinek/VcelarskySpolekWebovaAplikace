using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class evidencekrmeni
    {
        [Key]
        public int idZaznamu { get; set; }
        public int idKrmeni { get; set; }
        public int idVcelstva { get; set; }
        public double Mnozstvi { get; set; }
        public DateTime DatumKrmeni { get; set; }
    }
}
