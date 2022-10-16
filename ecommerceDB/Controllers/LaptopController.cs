using ecommerceDB.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ecommerceDB.Controllers
{
    public class LaptopController : Controller
    {
        // GET: Laptop
        EcommerceDBEntities context;
        static List<MyCart> carts = new List<MyCart>();
        public LaptopController()
        {
            context = new EcommerceDBEntities();
        }
      
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            //string ans = context.LoginDetails1.ToList().Find(temp => temp.userId == Request["userId"]).ToString();
            var ans = context.LoginDetails.ToList().Find(temp => temp.userId == Request["userId"]);
            if (ans.password == Request["password"])
            {
                TempData["user"] = Request["userId"];
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.msg = "Account not found";
                return RedirectToAction("SignUp");
            }
        }
        public ActionResult SignUp()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SignUp(FormCollection collection)
        {
            LoginDetail login = new LoginDetail();
            
            login.userId = Request["userId"];
            login.password = Request["password"];
            context.LoginDetails.Add(login);
            context.SaveChanges();
            return RedirectToAction("Login");
        }
        public ActionResult Index()
        {
            var ans = context.Products1.ToList();
            return View(ans);
        }

    }
}