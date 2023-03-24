using Microsoft.EntityFrameworkCore;
using System.Reflection.Metadata;

namespace KampoAPI.Models
{
    public class ApplicationDBcontext : DbContext
    {
        public ApplicationDBcontext()
        {

        }
        public ApplicationDBcontext(DbContextOptions<ApplicationDBcontext> options) : base(options)
        { }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
         
        }
        public virtual DbSet<LogUser> LogsUsers { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductCategory> ProductsCategory { get; set; }
        public virtual DbSet<ProductProperties> ProductsProperties { get; set; }
        public virtual DbSet<Properties> Properties { get; set; }
        public virtual DbSet<User> Users { get; set; }

    }
}
