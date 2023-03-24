using System.ComponentModel.DataAnnotations;

namespace KampoAPI.Models
{
    public partial class User
    {
        public User()
        {
            this.LogsUsers = new HashSet<LogUser>();
        }
        [Key]
        public int id_user { get; set; }
        public string FirstName { get; set; }
        public string SecondName { get; set; }
        public string Partronumic { get; set; }
        public string NumberPhone { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }

        public virtual ICollection<LogUser> LogsUsers { get; set; }

    }
}
