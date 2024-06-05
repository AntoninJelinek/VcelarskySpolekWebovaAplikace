using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class matky
    {
        [Key]
        public int IdMatky { get; set; }
        public int IdVcelare { get; set; }
        public string NazevMatky { get; set; }
        public string Puvod { get; set; }
        public string Linie { get; set; }
        public bool Uhyn { get; set; }

    }
}
