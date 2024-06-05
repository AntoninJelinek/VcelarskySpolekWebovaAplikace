using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class stanoviste
    {
        [Key]
        public int IdStanoviste { get; set; }
        public int IdVcelare { get; set; }
        public string NazevStanoviste { get; set; }
        public string UmisteniStanoviste { get; set; }
        public string TypStanoviste { get; set; }
    }
}
