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
        EcommerceDBEntities1 context;
        static List<MyCart> carts = new List<MyCart>();
        public LaptopController()
        {
            context = new EcommerceDBEntities1();
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
        public ActionResult AddToCart(int Id)
        {
            var p = context.Products1.Where(x => x.prodId == Id).SingleOrDefault();
            return View(p);
        }
        [HttpPost]
        public ActionResult AddToCart(string qty, int Id)
        {
            var find = context.Products1.Where(x => x.prodId == Id).SingleOrDefault();
            MyCart cart = new MyCart();
            cart.productid = Id;
            cart.price = find.price;
            cart.qty = Convert.ToInt32(qty);
            cart.bill = cart.price * cart.qty;
            cart.productname = find.prodName;
            carts.Add(cart);
            return RedirectToAction("Index");

        }
        public ActionResult ViewMyCart()
        {
            return View(carts);
        }
        public ActionResult CheckOut()
        {
            Order order = new Order();
           order.LoginDetail_userId1 = TempData["user"].ToString();
            
            order.Id = new Random().Next(1000, 9999);
           // order.LoginDetails_userId = TempData["user"].ToString();
            double amount = 0;
            // ICollection<Product> plist = null;
            foreach (var item in carts)
            {
                amount += item.price;
                //plist.Add(new Product() { price = amount, prodId = item.productid, prodName = item.productname });
            }

            order.amount = amount;
            // order.Products = plist;
            context.Orders.Add(order);

            context.SaveChanges();
            //var find = context.Orders.ToList().Find(temp => temp.amount == amount && temp.LoginDetail_userId1 == TempData["user"].ToString());
            foreach (var item in carts)
            {
                // context.orderDetails(order.Id, item.productid);
                OrderProduct op = new OrderProduct();
                op.Orders_Id = order.Id;
                op.Products1_prodId = item.productid;
                context.OrderProducts.Add(op);
                context.SaveChanges();
            }
            return RedirectToAction("Index");
        }

    }
}