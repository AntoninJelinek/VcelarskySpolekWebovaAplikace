using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class vcelstva
    {
        [Key]
        public int IdVcelstva { get; set; }
        public int IdVcelare { get; set; }
        public int IdUlu { get; set; }
        public string NazevVcelstva { get; set; }
        public string TypVcelstva { get; set; }
    }
}
