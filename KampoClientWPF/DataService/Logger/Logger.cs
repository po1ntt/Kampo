using KampoClientWPF.DataService.DBservice;
using KampoClientWPF.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace KampoClientWPF.DataService.Logger
{
   
    public class Logger : MainService
    {
        public async Task<List<LogsUsers>> GetLogs() => await context.LogsUsers.ToListAsync();
        public  void UpdateData(Users users, string objectChanged, string nameObject)
        {
            context.LogsUsers.Add(new LogsUsers()
            {
                ActionType = "Обновление",
                NameObject = nameObject,
                ObjectChanged = objectChanged,
                user_id = users.id_user,
                DateCreated = DateTime.Now
            });
            context.SaveChangesAsync();
        }
        public void DeleteData(Users users, string objectChanged, string nameObject)
        {
            context.LogsUsers.Add(new LogsUsers()
            {
                ActionType = "Удаление",
                NameObject = nameObject,
                ObjectChanged = objectChanged,
                user_id = users.id_user,
                DateCreated = DateTime.Now

            });
            context.SaveChangesAsync();

        }
        public void AddData(Users users, string objectChanged, string nameObject)
        {
            context.LogsUsers.Add(new LogsUsers()
            {
                ActionType = "Добавление",
                NameObject = nameObject,
                ObjectChanged = objectChanged,
                user_id = users.id_user,
                DateCreated = DateTime.Now

            });
            context.SaveChangesAsync();

        }
    }
}
   
  
  


