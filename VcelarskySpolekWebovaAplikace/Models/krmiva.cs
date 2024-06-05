using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class krmiva
    {
        [Key]
        public int idKrmiva { get; set; }
        public string NazevKrmiva { get; set; }
        public string Jednotky { get; set; }


    }
}
