using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using IDAL;
using System.Reflection;
using System.Configuration;

namespace DALFactory
{
    public class DataAccess
    {
        private static string AssemblyName = ConfigurationManager.AppSettings["Path"].ToString();
        private static string db = ConfigurationManager.AppSettings["DB"].ToString();
        public static IUsers CreateUsers()
        {
            string className = AssemblyName + "." + db + "Users";
            return (IUsers)Assembly.Load(AssemblyName).CreateInstance(className);
        }
      
        public static ISales_item CreateSales_item()
        {
            string className = AssemblyName + "." + db + "Sales_item";
            return (ISales_item)Assembly.Load(AssemblyName).CreateInstance(className);
        }
        public static ISales CreateSales()
        {
            string className = AssemblyName + "." + db + "Sales";
            return (ISales)Assembly.Load(AssemblyName).CreateInstance(className);
        }
        public static IProduct CreateProduct()
        {
            string className = AssemblyName + "." + db + "Product";
            return (IProduct)Assembly.Load(AssemblyName).CreateInstance(className);
        }
       
        
        public static IBuyer CreateBuyer()
        {
            string className = AssemblyName + "." + db + "Buyer";
            return (IBuyer)Assembly.Load(AssemblyName).CreateInstance(className);
        }
        
        public static IAdmi CreateAdmi()
        {
            string className = AssemblyName + "." + db + "Admi";
            return (IAdmi)Assembly.Load(AssemblyName).CreateInstance(className);
        }


    }
}

