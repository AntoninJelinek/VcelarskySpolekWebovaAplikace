using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class prodejmedu
    {
        [Key]
        public int IdZaznamu { get; set; }
        public int IdVcelare { get; set; }
        public string DruhMedu { get; set; }
        public double Mnozstvi { get; set; }
        public double Cena { get; set; }
        public DateTime DatumProdeje { get; set; }
    }
}
