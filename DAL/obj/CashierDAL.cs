using System;
using MySql.Data.MySqlClient;
using Persistence;

namespace DAL
{
    public class CashierDAL
    {
        public int Login(Cashier cashier)
        {
            int login = 0;
            Console.WriteLine(cashier.UserName + " - " + cashier.Password);
            try
            {
                MySqlConnection connection = DbHelper.GetConnection();
                connection.Open();
                MySqlCommand command = connection.CreateCommand();
                command.CommandText = "select * from Cashier where user_name='" + 
                    cashier.UserName + "' and user_pass='" + 
                    MD5Algorithsm.CreateMD5(cashier.Password)+" ';";
                MySqlDataReader reader = command.ExecuteReader();
                if(reader.Read())
                {
                    login = reader.GetInt32("role");
                }else{
                    login = 0;
                }
            }catch{
                login = -1;
            }
            Console.WriteLine(login);
            return login;
        }
    }
}
