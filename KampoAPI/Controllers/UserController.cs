using KampoAPI.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace KampoAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]

    public class UserController : Controller
    {
        private ApplicationDBcontext db;

        public UserController(ApplicationDBcontext db)
        {
            this.db = db;
        }

        [HttpGet("GetUsers")]
        public async Task<List<User>> GetUsersAsync()
        {
            List<User> users = await db.Users.Include(e => e.LogsUsers).ToListAsync(); ;
            return users;
        }
      
    }
}
