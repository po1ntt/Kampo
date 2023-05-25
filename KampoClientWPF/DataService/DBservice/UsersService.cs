using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KampoClientWPF.Models;

namespace KampoClientWPF.DataService.DBservice
{
    public class UsersService : MainService
    {
        public KampoDBEntities context = new KampoDBEntities();

        public static Users UserInfo { get; set; }
        public async Task<bool> AuthorizeUser(string username, string userpass, bool isremember)
        {
            var user = await context.Users.FirstOrDefaultAsync(p=> p.Login == username && p.Password == userpass);
            UserInfo = user;
            if(isremember == true)
            {
              
                Properties.Settings.Default.Login = user.Login;
                Properties.Settings.Default.Save();
            }
            return user != null ? true : false;
        }
        
    }
}
