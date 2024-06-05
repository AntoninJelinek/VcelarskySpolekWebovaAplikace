using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class leceni
    {
        [Key]
        public int idLeciva { get; set; }
        public string NazevLeceni { get; set; }
        public string Jednotky { get; set; }

    }
}
