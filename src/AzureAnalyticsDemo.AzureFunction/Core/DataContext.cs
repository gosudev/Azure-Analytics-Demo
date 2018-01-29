using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using AzureAnalyticsDemo.Contracts.Model;

namespace AzureAnalyticsDemo.AzureFunction.Core
{
    public class DataContext : DbContext
    {
        //public DataContext() : base("DefaultConnection")
        //{
        //}

        public DataContext(string connectionString) : base(connectionString)
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            //http://www.entityframeworktutorial.net/code-first/configure-one-to-many-relationship-in-code-first.aspx

        }

        public DbSet<Complaint> Complaints { get; set; }
    }
}
