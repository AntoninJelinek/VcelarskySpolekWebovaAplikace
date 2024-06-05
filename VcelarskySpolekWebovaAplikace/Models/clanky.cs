

using System.ComponentModel.DataAnnotations;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class clanky
    {
        [Key]
        public int idClanku { get; set; }
        public int IdAutora { get; set; }
        public string NazevClanku { get; set; }
        public string Prefix { get; set; }
        public string Obsah { get; set; } 
        public DateTime DatumPridani { get; set; }

        public clanky()
        {
            Prefix = "";
            Obsah = "";
        }
    }
}
