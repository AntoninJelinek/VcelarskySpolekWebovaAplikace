using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class vcelstvauly
    {
        [Key]
        public int IdVcelstva { get; set; }
        public int IdUlu { get; set; }
        public DateTime DatumPridani { get; set; }
        public bool JeVUlu { get; set; }
    }
}
