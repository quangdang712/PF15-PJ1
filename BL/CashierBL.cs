using System;
using Persistence;
using DAL;

namespace BL
{
    public class CashierBL
    {
        private CashierDAL dal = new CashierDAL();
        public int Login(Cashier cashier)
        {
            return dal.Login(cashier);
        }
    }
}
