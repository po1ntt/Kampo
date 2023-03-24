using System.ComponentModel.DataAnnotations;

namespace KampoAPI.Models
{
    public partial class LogUser
    {
        [Key]
        public int id_logs { get; set; }
        public Nullable<int> user_id { get; set; }
        public string ActionType { get; set; }
        public string ObjectChanged { get; set; }
        public string NameObject { get; set; }

        public virtual User Users { get; set; }
    }
}
