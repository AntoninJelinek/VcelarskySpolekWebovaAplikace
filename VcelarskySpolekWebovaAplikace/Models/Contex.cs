using Microsoft.EntityFrameworkCore;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class Contex : DbContext
    {
        public DbSet<clanky> clanky { get; set; }
        public DbSet<evidencekrmeni> evidencekrmeni { get; set; }
        public DbSet<evidenceleceni> evidenceleceni { get; set; }
        public DbSet<krmiva> krmiva { get; set; }
        public DbSet<leceni> leceni { get; set; }
        public DbSet<matkavcelstva> matkavcelstva { get; set; }
        public DbSet<matky> matky { get; set; }
        public DbSet<produkcemedu> produkcemedu { get; set; }
        public DbSet<stanoviste> stanoviste { get; set; }
        public DbSet<uly> uly { get; set; }
        public DbSet<vcelari> vcelari { get; set; }
        public DbSet<vcelstva> vcelstva { get; set; }
        public DbSet<zaznamy> zaznamy { get; set; }
        public DbSet<komentare> komentare { get; set; }
        public DbSet<vcelstvauly> vcelstvauly { get; set; }
        public DbSet<soubory> soubory { get; set; }
        public DbSet<prodejmedu> prodejmedu { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseMySQL("server=127.0.0.1;database=dbspolek;user=root;password=root");
        }
    }

}
