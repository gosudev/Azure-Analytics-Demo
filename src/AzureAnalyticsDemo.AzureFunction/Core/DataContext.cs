using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace AzureAnalyticsDemo.AzureFunction.Core
{
    public class DataContext : DbContext
    {
        public DataContext(string connectionString) : base(connectionString)
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }

        public DbSet<Complaint> Complaints { get; set; }
    }
}
