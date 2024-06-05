using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class zaznamy
    {
        [Key]
        public int IdZaznamu { get; set; }
        public int IdVcelstva { get; set; }
        public DateTime DatumZaznamu { get; set; }
        public string Zaznam { get; set; }
    }
}
