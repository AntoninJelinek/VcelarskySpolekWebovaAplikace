using Microsoft.EntityFrameworkCore;
using Org.BouncyCastle.Pqc.Crypto.Lms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace VcelarskySpolekWebovaAplikace.Models
{
    public class Repository
    {

        private Contex contex = new Contex();


       
        public void PridatVcelare(vcelari vcelar)
        {
            this.contex.vcelari.Add(vcelar);
            this.contex.SaveChanges();
        }

        public List<stanoviste> ZiskejStanoviste(int id)
        {
            return this.contex.stanoviste.Where(x => x.IdVcelare == id).ToList();
        }

        public List<matky> ZiskejMatky(int id)
        {
            List<matky> matky = this.contex.matky.Where(x => x.IdVcelare == id).ToList();
            return matky;
        }

        public List<matky> ZiskejDostupneMatkyVcelare(int id)
        {
            List<matky> dostupnematky = this.contex.matky.FromSqlRaw("SELECT matky.IdVcelare, matky.IdMatky, matky.NazevMatky, matky.Puvod, matky.Linie, matky.Uhyn FROM matky WHERE matky.IdVcelare = {0} AND matky.Uhyn = 0 AND NOT EXISTS (SELECT * from matkavcelstva WHERE matky.IdMatky = matkavcelstva.IdMatky AND matkavcelstva.JeVUlu=1);", id).ToList();
            return dostupnematky;
        }

        public matkavcelstva ZiskejMatkuVcelstva(int id)
        {
            matkavcelstva matka = this.contex.matkavcelstva.Where(x => x.IdVcelstva == id).Where(y=>y.JeVUlu==true).FirstOrDefault();
            return matka;
        }

        public vcelari ZiskatVcelare(string name)
        {   vcelari vcelar = this.contex.vcelari.FirstOrDefault(x => x.UzivatelskeJmeno == name);
           
            return vcelar;
        }

        public List<komentare> ZiskejKomentare(int offset)
        {
            return this.contex.komentare.FromSqlRaw("SELECT * FROM komentare ORDER BY IdKomentare DESC LIMIT 10 OFFSET "+Convert.ToString(offset)).ToList();
        }

        public List<clanky> ZiskejClanky(int offset)
        {
            return this.contex.clanky.FromSqlRaw("SELECT * FROM clanky ORDER BY IdClanku DESC LIMIT 10 OFFSET " + Convert.ToString(offset)).ToList();
        }


        public List<komentare> ZiskatVsechnyKomentare()
        {
            return this.contex.komentare.ToList();
        }

        public int PocetRadkuKomentare()
        {
            return this.contex.komentare.Count();
        }
        public int PocetRadkuClanky()
        {
            return this.contex.clanky.Count();
        }

        public List<uly> ZiskejUly(int IdStanoviste, int IdVcelare)
        {
            return this.contex.uly.Where(x => x.idStanoviste == IdStanoviste).Where(y => y.IdVcelare == IdVcelare).ToList();
        }

        public vcelstva ZiskejVcelstvo(int id)
        {
          //  return this.contex.vcelstva.FirstOrDefault(x => x.IdUlu == id);
            return this.contex.vcelstva.FromSqlRaw("SELECT vcelstva.IdVcelstva, vcelstva.IdVcelare, vcelstva.IdUlu, vcelstva.NazevVcelstva, vcelstva.TypVcelstva FROM vcelstva INNER JOIN vcelstvauly ON vcelstva.IdVcelstva=vcelstvauly.IdVcelstva WHERE vcelstva.IdUlu = {0} AND vcelstvauly.JeVUlu=1",Convert.ToString(id)).FirstOrDefault();
        }

        public vcelstvauly EvidenceVcelstev(int id)
        {
            return this.contex.vcelstvauly.FirstOrDefault(x => x.IdVcelstva == id);
        }


    }
}
