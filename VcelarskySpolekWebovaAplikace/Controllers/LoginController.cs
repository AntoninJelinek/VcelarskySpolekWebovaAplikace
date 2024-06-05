using Microsoft.AspNetCore.Mvc;
using Mysqlx.Datatypes;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Text;
using System.Text.Json;
using System.Linq;
using VcelarskySpolekWebovaAplikace.Models;
using Org.BouncyCastle.Tls;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json;
using System.IO;
using Microsoft.DotNet.Scaffolding.Shared.T4Templating;
using Mysqlx.Resultset;
using Microsoft.AspNetCore.StaticFiles;
using System.Diagnostics.Metrics;
using System.Net.Mime;

namespace VcelarskySpolekWebovaAplikace.Controllers
{
    public class LoginController : Controller
    {
        private Repository repository = new Repository();
        private Contex contex = new Contex();
        public string FilePath;
        private IHostEnvironment _hostingEnvironment;


        public LoginController(IHostEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }

        public IActionResult Index()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }

            vcelari vcelar = this.contex.vcelari.Find(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            this.ViewBag.vcelar = vcelar;
            return View();

            
        }
        public IActionResult MyBees()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
           
                return View();

            
        }
        public IActionResult Logout()
        {
            this.HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }
        [HttpGet]
        public IActionResult Chat(int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            this.ViewBag.PocetKomentaru = this.repository.PocetRadkuKomentare();
            List<komentare> VsechnyKomentare = this.repository.ZiskejKomentare(id);
            this.ViewBag.Vkomentare = VsechnyKomentare;
            this.ViewBag.counter = id;
            this.ViewBag.CelkemKomentaru = id+10;
            this.ViewBag.counterNext = id + 10;
            this.ViewBag.counterPrevious = id - 10;
            return View(); 
        }

        [HttpPost]
        public IActionResult Chat(komentare prvnikomentar)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            this.ViewBag.PocetKomentaru = this.repository.PocetRadkuKomentare();
            prvnikomentar.Autor = this.HttpContext.Session.GetString("login");
            prvnikomentar.DatumVytvoreni = DateTime.Now;
            this.contex.komentare.Add(prvnikomentar);
            this.contex.SaveChanges();
            this.ViewBag.EmptyValue = true;
            List<komentare> VsechnyKomentare = this.repository.ZiskejKomentare(0);
            this.ViewBag.Vkomentare = VsechnyKomentare;
            int counter = 0;
            this.ViewBag.counter = counter;
            this.ViewBag.CelkemKomentaru =  10;

            this.ViewBag.counterNext = 0 + 10;
            return View();

        }

        public IActionResult Location()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            this.ViewBag.Stanoviste = this.repository.ZiskejStanoviste(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            return View();
        }

        [HttpPost]
        public IActionResult Location(stanoviste stan)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            stan.IdVcelare = Convert.ToInt32(this.HttpContext.Session.GetString("ID"));
                this.contex.stanoviste.Add(stan);
                this.contex.SaveChanges();
                this.ViewBag.Stanoviste = this.repository.ZiskejStanoviste(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
                return View();
            
        }
        [HttpGet]
        public IActionResult Hive(int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            stanoviste stan = this.contex.stanoviste.Find(id);
            if (Convert.ToString(stan.IdVcelare) != this.HttpContext.Session.GetString("ID"))
            {
                return RedirectToAction("Restricted");
            }
            this.ViewBag.Stanoviste = stan;
           this.ViewBag.ID = id;
            this.HttpContext.Session.SetString("StanID", Convert.ToString(stan.IdStanoviste));
            //Zabezpečení, aby nedošlo k možnosti upravovat úly ostatním včelařům.
           this.ViewBag.UlyVcelare = this.repository.ZiskejUly(id,Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            return View();
        }

        [Route("HiveEdit/{id:int}")]
        [HttpPost]
        public IActionResult HiveEdit(HiveDetailModel hdm, int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            hdm.uly.IdVcelare = Convert.ToInt32(this.HttpContext.Session.GetString("ID"));
            this.contex.uly.Update(hdm.uly);
            this.contex.SaveChanges();
            return RedirectToAction("HiveDetail", new { id });
        }

        [Route("BeehiveEdit/{id:int}")]
        [HttpPost]
        public IActionResult BeehiveEdit(HiveDetailModel hdm, int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            vcelstva  vcelstvo = this.repository.ZiskejVcelstvo(id);
            if (vcelstvo==null)
            {
                hdm.vcelstva.IdVcelare = Convert.ToInt32(this.HttpContext.Session.GetString("ID"));
                this.contex.vcelstva.Add(hdm.vcelstva);
                this.contex.SaveChanges();
                vcelstvauly vu = new vcelstvauly();
                vu.IdVcelstva = hdm.vcelstva.IdVcelstva;
                vu.IdUlu = hdm.vcelstva.IdUlu;
                vu.DatumPridani = hdm.vcelstvauly.DatumPridani;
                vu.JeVUlu = true;
                this.contex.vcelstvauly.Add(vu);
                this.contex.SaveChanges();
            }
            else
            {
                hdm.vcelstva.IdVcelstva = vcelstvo.IdVcelstva;
                this.contex.vcelstva.Update(hdm.vcelstva);
                this.contex.SaveChanges();
                hdm.vcelstvauly.IdVcelstva = hdm.vcelstva.IdVcelstva;
                hdm.vcelstvauly.IdUlu = hdm.vcelstva.IdUlu;
                hdm.vcelstvauly.DatumPridani = hdm.vcelstvauly.DatumPridani;
                hdm.vcelstvauly.JeVUlu = true;
                this.contex.vcelstvauly.Update(hdm.vcelstvauly);
                this.contex.SaveChanges();
            }
            
            
         
          
            return RedirectToAction("HiveDetail", new { id });
        }

        [HttpPost]
        public IActionResult AddHive(UlyModel ul)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            ul.uly.IdVcelare = Convert.ToInt32(this.HttpContext.Session.GetString("ID"));
            ul.uly.idStanoviste = Convert.ToInt32(this.HttpContext.Session.GetString("StanID"));
            this.contex.uly.Add(ul.uly);
            this.contex.SaveChanges();
            return RedirectToAction("Hive", new { id = Convert.ToInt32(this.HttpContext.Session.GetString("StanID")) });
        }

        [HttpPost]
        public IActionResult UpdateLocation(UlyModel um)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            um.stanoviste.IdStanoviste = Convert.ToInt32(this.HttpContext.Session.GetString("StanID"));
            um.stanoviste.IdVcelare = Convert.ToInt32(this.HttpContext.Session.GetString("ID"));
            this.contex.stanoviste.Update(um.stanoviste);
            this.contex.SaveChanges();
            this.HttpContext.Session.Remove("StanId");
            return RedirectToAction("Location", "Login");
        }

        public IActionResult Restricted()
        {
            return View();
        }
        [HttpGet]
        public IActionResult HiveDetail(int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }

            uly ul = this.contex.uly.Find(id);
            stanoviste stan = this.contex.stanoviste.Where(x => x.IdStanoviste == ul.idStanoviste).FirstOrDefault();
            this.ViewBag.stan = stan;
            vcelstva vcelstvo = this.repository.ZiskejVcelstvo(id);
            if (vcelstvo != null)
            {
                vcelstvauly vu = this.repository.EvidenceVcelstev(vcelstvo.IdVcelstva);
                this.ViewBag.vu = vu;
                matkavcelstva mv = this.repository.ZiskejMatkuVcelstva(vcelstvo.IdVcelstva);
                if(mv!=null)
                {
                    this.ViewBag.mv = mv;
                    matky matka = this.contex.matky.Find(mv.IdMatky);
                    this.ViewBag.matka = matka;
                }
                List<evidencekrmeni> ek = this.contex.evidencekrmeni.Where(x => x.idVcelstva == vcelstvo.IdVcelstva).ToList();
                this.ViewBag.ek = ek;
                List<evidenceleceni> el = this.contex.evidenceleceni.Where(x => x.idVcelstva == vcelstvo.IdVcelstva).ToList();
                this.ViewBag.el = el;
                List<produkcemedu> pm = this.contex.produkcemedu.Where(x => x.idVcelstva == vcelstvo.IdVcelstva).ToList();
                this.ViewBag.pm = pm;
                List<zaznamy> zaznamy = this.contex.zaznamy.Where(x => x.IdVcelstva == vcelstvo.IdVcelstva).ToList();
                this.ViewBag.zaznamy = zaznamy;
            }
            this.ViewBag.vcelstvo = vcelstvo;
            this.ViewBag.ul = ul;
            List<matky> DostupneMatky = this.repository.ZiskejDostupneMatkyVcelare(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            this.ViewBag.DostupneMatky = new SelectList(DostupneMatky,"IdMatky","NazevMatky");
            List<krmiva> KrmivaList = this.contex.krmiva.ToList();
            this.ViewBag.k = KrmivaList;
            this.ViewBag.Krmiva = new SelectList(KrmivaList,"idKrmiva","NazevKrmiva");
            List<leceni> leciva = this.contex.leceni.ToList();
            this.ViewBag.l = leciva;
            this.ViewBag.Leciva = new SelectList(leciva, "idLeciva", "NazevLeceni");



            return View();
        }

        public IActionResult Mother()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            List<matky> matky = this.repository.ZiskejMatky(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            this.ViewBag.matka = matky;
            return View();
        }

        [HttpPost]
        public IActionResult Mother(matky matka)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            matka.IdVcelare = Convert.ToInt32(this.HttpContext.Session.GetString("ID"));
            this.contex.matky.Add(matka);
            this.contex.SaveChanges();
            List<matky> matky = this.repository.ZiskejMatky(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            this.ViewBag.matka = matky;
            return View();
        }

        [Route("MotherForm/{id:int}")]
        [HttpPost]
        public IActionResult MotherForm(HiveDetailModel hdm, int id, int idUlu)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            vcelstva vcelstvo = this.contex.vcelstva.Where(x => x.IdUlu == id).FirstOrDefault();
            hdm.matkavcelstva.JeVUlu = true;
            hdm.matkavcelstva.IdVcelstva = vcelstvo.IdVcelstva;
            this.contex.matkavcelstva.Add(hdm.matkavcelstva);
            this.contex.SaveChanges();
            return RedirectToAction("HiveDetail", new { id });


        }

        [Route("HoneyAdd/{idVcelstva:int}/{id:int}")]
        [HttpPost]
        public IActionResult HoneyAdd(HiveDetailModel hdm, int idVcelstva, int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            vcelstva vcelstvo = this.contex.vcelstva.Where(x => x.IdUlu == id).FirstOrDefault();
            hdm.produkcemedu.idVcelstva = vcelstvo.IdVcelstva;
            hdm.produkcemedu.idVcelare = Convert.ToInt32(this.HttpContext.Session.GetString("ID"));
            this.contex.produkcemedu.Add(hdm.produkcemedu);
            this.contex.SaveChanges();
            return RedirectToAction("HiveDetail", new { id });
        }

        [Route("FeedAdd/{idVcelstva:int}/{id:int}")]
        [HttpPost] 
        public IActionResult FeedAdd(HiveDetailModel hdm, int id, int idVcelstva)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            hdm.evidencekrmeni.idVcelstva = idVcelstva;
            this.contex.evidencekrmeni.Add(hdm.evidencekrmeni);
            this.contex.SaveChanges();
            return RedirectToAction("HiveDetail", new { id });

        }
        [Route("MedicineAdd/{idVcelstva:int}/{id:int}")]
        [HttpPost]
        public IActionResult MedicineAdd(HiveDetailModel hdm, int id, int idVcelstva)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            hdm.evidenceleceni.idVcelstva = idVcelstva;
            this.contex.evidenceleceni.Add(hdm.evidenceleceni);
            this.contex.SaveChanges();
            return RedirectToAction("HiveDetail", new { id });

        }

        [Route("NoteAdd/{idVcelstva:int}/{id:int}")]
        [HttpPost]
        public IActionResult NoteAdd(HiveDetailModel hdm, int id, int idVcelstva)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            hdm.zaznamy.IdVcelstva = idVcelstva;
            this.contex.zaznamy.Add(hdm.zaznamy);
            this.contex.SaveChanges();
            return RedirectToAction("HiveDetail", new { id });

        }
        [Route("MotherEdit/{idMatky:int}")]
        [HttpGet]
        public IActionResult MotherEdit(int idMatky)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            matky matka = this.contex.matky.Find(idMatky);
            this.ViewBag.matka = matka;
            return View();

        }

        [Route("MotherEdit/{idMatky:int}")]
        [HttpPost]
        public IActionResult MotherEdit(matky matka, int idMatky)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            matka.IdMatky = idMatky;
            matka.IdVcelare = Convert.ToInt32(this.HttpContext.Session.GetString("ID"));
            if(matka.Uhyn == true)
            {
                matkavcelstva mv = this.contex.matkavcelstva.Where(x=>x.IdMatky==matka.IdMatky).FirstOrDefault();
                if(mv!=null)
                {
                    mv.JeVUlu = false;
                    this.contex.matkavcelstva.Update(mv);
                    this.contex.SaveChanges();
                }
               
            }
            this.contex.matky.Update(matka);
            this.contex.SaveChanges();
            return RedirectToAction("Mother");

        }

        [Route("RemoveMother/{idMatky:int}/{id:int}")]
        [HttpPost]
        public IActionResult RemoveMother(int id, int idMatky)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            matkavcelstva mv = this.contex.matkavcelstva.Where(x => x.IdMatky == idMatky).Where(y => y.JeVUlu == true).FirstOrDefault();
            mv.JeVUlu = false;
            this.contex.matkavcelstva.Update(mv);
            this.contex.SaveChanges();
            return RedirectToAction("HiveDetail", new { id });

        }

        public IActionResult Feed()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            List<krmiva> krmiva = this.contex.krmiva.ToList();
            this.ViewBag.krmeni = krmiva;
            return View();
        }

        public IActionResult Stats()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }


            List<vcelstva> Vcelstva = this.contex.vcelstva.Where(x => x.IdVcelare == Convert.ToInt32(this.HttpContext.Session.GetString("ID"))).ToList();

			this.ViewBag.Vcelstva = new SelectList(Vcelstva, "IdVcelstva", "NazevVcelstva");
			return View();
		}
        [HttpPost]
		public IActionResult Stats(DateTime first, DateTime last,  vcelstva vc)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            List<vcelstva> Vcelstva = this.contex.vcelstva.Where(x => x.IdVcelare == Convert.ToInt32(this.HttpContext.Session.GetString("ID"))).ToList();
			this.ViewBag.Vcelstva = new SelectList(Vcelstva, "IdVcelstva", "NazevVcelstva");
			List<DataPoint> dataPoints = new List<DataPoint>();
            List<ExportList> ep = new List<ExportList>();

			using (var db = new Contex())
			{
				var select = (from pm in db.produkcemedu
							  from v in db.vcelstva
							  where pm.idVcelstva == v.IdVcelstva 
							  where v.IdVcelstva == vc.IdVcelstva &&
                              (pm.DatumVytaceni >= first && pm.DatumVytaceni <= last)
							  select new
							  {
								  Mnozstvi = pm.Mnozstvi,
								  DatumFiltr = pm.DatumVytaceni,
								  Datum = Convert.ToString(pm.DatumVytaceni.Day) + ". " + Convert.ToString(pm.DatumVytaceni.Month) + ". " + Convert.ToString(pm.DatumVytaceni.Year),
								  Vcelstvo = v.NazevVcelstva

							  }).OrderBy(d => d.DatumFiltr);

				foreach (var result in select)
				{
					dataPoints.Add(new DataPoint(Convert.ToString(result.Datum), result.Mnozstvi));
                    ep.Add(new ExportList { Datum = Convert.ToDateTime(result.Datum), Mnozstvi = result.Mnozstvi });
				}
             
			}


			
            string test = JsonConvert.SerializeObject(dataPoints);
			ViewBag.DataPoints = JsonConvert.SerializeObject(dataPoints);
            this.HttpContext.Session.SetString("ExportList", JsonConvert.SerializeObject(ep));
			ViewBag.popisek = JsonConvert.SerializeObject("Graf vytočeného medu podle zadaného včelstva");

			return View();
		}



		[HttpPost]
        public IActionResult Feed(krmiva krmivo)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            this.contex.krmiva.Add(krmivo);
            this.contex.SaveChanges();
            List<krmiva> krmiva = this.contex.krmiva.ToList();
            this.ViewBag.krmeni = krmiva;
            return View();
        }
        public async Task<IActionResult> Export(string type)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            string pathname = "";

            int counter = 0;
            List<ExportList> export_list = new List<ExportList>();

            if (type == "csv")
            {
                export_list = JsonConvert.DeserializeObject<List<ExportList>>(this.HttpContext.Session.GetString("ExportList"));

                pathname = "file.csv";
                using (StreamWriter writer = new StreamWriter(@"wwwroot\file\temp\file.csv"))
                {
                    foreach (ExportList zaznam in export_list)
                    {
                        if (counter == 0)
                        {
                            writer.WriteLine("{0};{1}", nameof(zaznam.Mnozstvi), nameof(zaznam.Datum));
                            writer.WriteLine("{0};{1}", zaznam.Mnozstvi, zaznam.Datum);
                            counter = counter + 1;
                        }
                        else
                        {
                            writer.WriteLine("{0};{1}", zaznam.Mnozstvi, zaznam.Datum);

                        }
                    }

                }
            }
            else if (type == "json")
            {
                pathname = "file.json";

                using (StreamWriter writer = new StreamWriter(@"wwwroot\file\temp\file.json"))
                {

                    writer.Write(this.HttpContext.Session.GetString("ExportList"));

                }
            }
            var filepath = Path.Combine(Directory.GetCurrentDirectory(), @"wwwroot\file\temp", pathname);
				var provider = new FileExtensionContentTypeProvider();
				if (!provider.TryGetContentType(filepath, out var contenttype))
				{
					contenttype = "application/octet-stream";
				}
				var bytes = await System.IO.File.ReadAllBytesAsync(filepath);
                System.IO.File.Delete(filepath);
            return File(bytes, contenttype, Path.GetFileName(filepath));
            
			
          
           
		}
		public IActionResult Medicine()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            List<leceni> leceni = this.contex.leceni.ToList();
            this.ViewBag.leceni = leceni;
            return View();
        }

        [HttpPost]
        public IActionResult Medicine(leceni lecivo)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            this.contex.leceni.Add(lecivo);
            this.contex.SaveChanges();
            List<leceni> leceni = this.contex.leceni.ToList();
            this.ViewBag.leceni = leceni;
            return View();
        }

        public IActionResult ArticleAdd()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            vcelari vcelar = this.contex.vcelari.Find(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            if(vcelar.OverenyClen==false)
            {
                return RedirectToAction("Restricted");
            }
            return View();
        }
        
        public IActionResult ArticleEdit(int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            vcelari vcelar = this.contex.vcelari.Find(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            if (vcelar.OverenyClen == false)
            {
                return RedirectToAction("Restricted");
            }
            clanky clanek = this.contex.clanky.Find(id);
            this.ViewBag.clanek = clanek;
            return View();
        }


        [HttpPost]
        public IActionResult ArticleAdd(clanky clanek)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            clanek.DatumPridani = DateTime.Now;
            clanek.IdAutora = Convert.ToInt32(this.HttpContext.Session.GetString("ID"));
            this.contex.clanky.Add(clanek);
            this.contex.SaveChanges();
            return RedirectToAction("ArticleList","Home");
        }
        [HttpPost]
        public IActionResult ArticleEdit(clanky clanek, int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            clanky old = this.contex.clanky.Find(id);
            old.NazevClanku = clanek.NazevClanku;
            old.Prefix = clanek.Prefix;
            old.Obsah = clanek.Obsah;
            this.contex.clanky.Update(old);
            this.contex.SaveChanges();
            return RedirectToAction("ArticleList", "Home");
        }
        public IActionResult ArticleDelete(int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            this.contex.clanky.Remove(this.contex.clanky.Find(id));
            return RedirectToAction("ArticleList", "Home");
        }
        public IActionResult EditBeekeeper()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            vcelari vcelar = this.contex.vcelari.Find(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            this.ViewBag.vcelar = vcelar;
            return View();
        }

        [HttpPost]
        public IActionResult EditBeekeeperSave(vcelari vcelarForm)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            vcelari vcelar = this.contex.vcelari.Find(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            vcelar.Ulice = vcelarForm.Ulice;
            vcelar.Mesto = vcelarForm.Mesto;
            vcelar.PSC = vcelarForm.PSC;
            this.contex.vcelari.Update(vcelar);
            this.contex.SaveChanges();
            return RedirectToAction("EditBeekeeper");
        }

        

        public IActionResult AdminMenu()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            vcelari vcelar = this.contex.vcelari.Find(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            this.ViewBag.vcelar = vcelar;
            return View();
        }

        public IActionResult BeekeeperSetRoles()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            vcelari vcelar = this.contex.vcelari.Find(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            if(vcelar.JeAdmin == false)
            {
                return RedirectToAction("Restricted");
            }
            List<vcelari> vcelari = this.contex.vcelari.ToList();
            this.ViewBag.vcelari = vcelari;
            return View();
        }

        public IActionResult Verify(int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            vcelari aktualniVcelar = this.contex.vcelari.Find(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            if(aktualniVcelar.JeAdmin==true)
            {
                vcelari vcelar = this.contex.vcelari.Find(id);
                vcelar.OverenyClen = true;
                this.contex.vcelari.Update(vcelar);
                this.contex.SaveChanges();
            }
           
            return RedirectToAction("BeekeeperSetRoles");

        }

        public IActionResult AdminAdd(int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            vcelari aktualniVcelar = this.contex.vcelari.Find(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
            if (aktualniVcelar.JeAdmin == true)
            {
                vcelari vcelar = this.contex.vcelari.Find(id);
                vcelar.JeAdmin = true;
                this.contex.vcelari.Update(vcelar);
                this.contex.SaveChanges();
            }
              
            return RedirectToAction("BeekeeperSetRoles");

        }

        public IActionResult Files()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            List <soubory> soubory_list = this.contex.soubory.ToList();
            List<vcelari> vcelari = this.contex.vcelari.ToList();
            ViewBag.soubory_list = soubory_list;
            ViewBag.vcelari = vcelari;
            return View();
        }

       
        public async Task<IActionResult> Download(int id)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            soubory soubor = this.contex.soubory.Find(id);
            var bytes = await System.IO.File.ReadAllBytesAsync(soubor.Cesta);
            string contenttype = "application/octet-stream";
            return File(bytes, contenttype, Path.GetFileName(soubor.Cesta));
        }

        [HttpPost]
        [Route("Upload")]
        public async Task<IActionResult> Upload(IFormFile? file)
        {
            if(file==null)
            {
                return RedirectToAction("Files");
            }

            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            soubory soubor = new soubory();
            soubor.idAutora = Convert.ToInt32(this.HttpContext.Session.GetString("ID"));
            soubor.NazevSouboru = file.FileName;
            soubor.DatumPridani = DateTime.Now;


            string uploads = Path.Combine(Directory.GetCurrentDirectory(), @"wwwroot\file\storage");
            if (file.Length > 0)
            {
                string filePath = Path.Combine(uploads, file.FileName);
                soubor.Cesta = filePath;
                using (Stream fileStream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(fileStream);
                }
            }
            this.contex.soubory.Add(soubor);
            this.contex.SaveChanges();
            return RedirectToAction("Files");
        }

        public IActionResult HoneySale()
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            List<prodejmedu> pm = this.contex.prodejmedu.Where(x => x.IdVcelare == Convert.ToInt32(this.HttpContext.Session.GetString("ID"))).ToList();
            ViewBag.Prodejmedu = pm;
            return View();
        }

        [HttpPost]
        public IActionResult HoneySale(prodejmedu pm)
        {
            if (this.HttpContext.Session.GetString("login") == null)
            {
                return RedirectToAction("Login", "Home");
            }
            pm.IdVcelare = Convert.ToInt32(this.HttpContext.Session.GetString("ID"));
            this.contex.prodejmedu.Add(pm);
            this.contex.SaveChanges();
            List<prodejmedu> pme = this.contex.prodejmedu.Where(x => x.IdVcelare == Convert.ToInt32(this.HttpContext.Session.GetString("ID"))).ToList();
            ViewBag.Prodejmedu = pme;
            return View();
        }


      
    }
}
      

       
       

       

