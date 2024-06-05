using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Text;
using System.Security.Cryptography;
using VcelarskySpolekWebovaAplikace.Models;
using Microsoft.DotNet.Scaffolding.Shared.T4Templating;
using Microsoft.EntityFrameworkCore;

namespace VcelarskySpolekWebovaAplikace.Controllers
{
    public class HomeController : Controller
    {
        private Repository repository = new Repository();
        private readonly ILogger<HomeController> _logger;
        Contex contex = new Contex();
        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            List<clanky> VsechnyClanky = this.contex.clanky.FromSqlRaw("SELECT * FROM clanky LIMIT 5").ToList();
            List<vcelari> vcelari = this.contex.vcelari.ToList();
            this.ViewBag.vcelari = vcelari;
            this.ViewBag.clanky = VsechnyClanky;
            return View();
        }
       

      

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login(vcelari vcelar)
        {
            if (vcelar.UzivatelskeJmeno == null && vcelar.Heslo == null)
            {
                ViewBag.ErrorMsg = "Nebyly zad�ny p�ihla�ovac� �daje.";
                return View();
            }

            vcelari vcelarDB = this.repository.ZiskatVcelare(vcelar.UzivatelskeJmeno);
            if (vcelarDB == null)
            {
                ViewBag.ErrorMsg = "V�ela� nebyl nalezen.";
                return View();
            }
            if (vcelar.Heslo == null)
            {
                ViewBag.ErrorMsg = "Nebylo zad�no heslo";
                return View();
            }
            if (Hash(vcelar.Heslo) == vcelarDB.Heslo)
            {
                this.HttpContext.Session.SetString("login", vcelar.UzivatelskeJmeno);
                this.HttpContext.Session.SetString("ID", vcelarDB.IdVcelare.ToString());
                return RedirectToAction("Index", "Login");
            }
            else
            {
                ViewBag.ErrorMsg = "Heslo nen� spr�vn�";
                return View();
            }


        }
        public IActionResult Register()
        {
            return View();
        }


        [HttpPost]
        public IActionResult Register(vcelari vcelar)
        {
            bool IsValidationCorrect = true;
            if (vcelar.UzivatelskeJmeno == null)
            {
                ViewBag.ErrorUsername = "Nebylo zad�no u�ivatelsk� jm�no.";
                IsValidationCorrect = false;
            }

            if (vcelar.Heslo == null)
            {
                ViewBag.ErrorPassword = "Nebylo zad�no heslo.";
                IsValidationCorrect = false;
            }

            if (vcelar.Jmeno == null)
            {
                ViewBag.ErrorName = "Nebylo zad�no k�estn� jm�no.";
                IsValidationCorrect = false;
            }

            if (vcelar.Prijmeni == null)
            {
                ViewBag.ErrorName = "Nebylo zad�no p��jmen�.";
                IsValidationCorrect = false;
            }
            if (Convert.ToString(vcelar.DatumNarozeni) == "01.01.0001 0:00:00")
            {
                ViewBag.ErrorBirthdate = "Nebylo zad�no datum narozen�.";
                IsValidationCorrect = false;
            }
            if (vcelar.Ulice == null)
            {
                ViewBag.ErrorStreet = "Nebyla zad�na ulice.";
                IsValidationCorrect = false;
            }
            if (vcelar.Mesto == null)
            {
                ViewBag.ErrorCity = "Nebylo zad�no m�sto.";
                IsValidationCorrect = false;
            }
            if (vcelar.PSC == null)
            {
                ViewBag.ErrorZip = "Nebylo zad�no PS�.";
                IsValidationCorrect = false;
            }





            vcelari vcelarDB = this.repository.ZiskatVcelare(vcelar.UzivatelskeJmeno);
            if (vcelarDB != null)
            {
                ViewBag.ErrorUsername = "U�ivatel s t�mhle jm�nem ji� existuje.";
                IsValidationCorrect = false;


            }

            if (IsValidationCorrect == true)
            {
                string hashHeslo = Hash(vcelar.Heslo);
                vcelar.Heslo = hashHeslo;
                this.repository.PridatVcelare(vcelar);
                return RedirectToAction("Index");
            }

            else
            {
                return View();
            }






        }

        public IActionResult ArticleList(int id)
        {
            if(this.HttpContext.Session.GetString("ID")!=null)
            {
                vcelari prihlasenyvcelar = this.contex.vcelari.Find(Convert.ToInt32(this.HttpContext.Session.GetString("ID")));
                this.ViewBag.vcelarAdminTrue = prihlasenyvcelar.JeAdmin;
            }
            this.ViewBag.PocetKomentaru = this.repository.PocetRadkuKomentare();
            List<clanky> VsechnyClanky = this.repository.ZiskejClanky(id);
            List<vcelari> vcelari = this.contex.vcelari.ToList();
            this.ViewBag.PocetClanku = this.repository.PocetRadkuClanky();
            this.ViewBag.vcelari = vcelari;
            this.ViewBag.clanky = VsechnyClanky;
            this.ViewBag.counter = id;
            this.ViewBag.CelkemClanku = id + 10;
            this.ViewBag.counterNext = id + 10;
            this.ViewBag.counterPrevious = id - 10;
            return View();
         
        }

        [HttpGet]
        public IActionResult Article(int id)
        {
            clanky clanek = this.contex.clanky.Find(id);
            vcelari vcelar = this.contex.vcelari.Find(clanek.IdAutora);
            this.ViewBag.Autor = vcelar.UzivatelskeJmeno;
            this.ViewBag.clanek = clanek;
            return View();
        }


        public string Hash(string password)
        {
            SHA256 hash = SHA256.Create();
            var passwordB = Encoding.Default.GetBytes(password);
            var hashheslo = hash.ComputeHash(passwordB);
            string returnPassword = Convert.ToHexString(hashheslo);
            return returnPassword;

        }
    }
}

