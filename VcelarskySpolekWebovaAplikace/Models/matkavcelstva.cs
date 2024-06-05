using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class matkavcelstva
    {
        [Key]
        public int IdZaznamu { get; set; }
        public int IdMatky { get; set; }
        public int IdVcelstva { get; set; }
        public DateTime DatumPridani { get; set; }
        public bool JeVUlu { get; set; }
    }
}
