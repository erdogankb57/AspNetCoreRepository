using Inta.Kurumsal.Entity.ComplexType;
using Inta.Kurumsal.Entity.Concrete;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Configuration;


namespace Inta.Kurumsal.DataAccess.DataContext
{
    public class DefaultDataContext : DbContext
    {

        private readonly IConfiguration _configuration;
        public DefaultDataContext()
        {
            _configuration = new ConfigurationBuilder().AddJsonFile("appsettings.json", true, true).Build();
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(_configuration.GetConnectionString("DefaultDataContext"));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("dbo");
            modelBuilder.Entity<CategoryAndPageType>();

        }

        public DbSet<GeneralSettings> GeneralSettingss { get; set; }

        public DbSet<FirmVariables> FirmVariabless { get; set; }

        public DbSet<FormGroup> FormGroups { get; set; }
        public DbSet<FormElement> FormElements { get; set; }


        public DbSet<FormElementOptions> FormOptionss { get; set; }

        public DbSet<Language> Languages { get; set; }

        public DbSet<MessageType> MessageTypes { get; set; }

        public DbSet<PageType> PageTypes { get; set; }

        public DbSet<SEOIndex> SEOIndexs { get; set; }

        public DbSet<SpecialtyType> SpecialtyTypes { get; set; }

        public DbSet<StaticText> StaticTexts { get; set; }

        public DbSet<SystemMenu> SystemMenus { get; set; }
        public DbSet<SystemMenuRole> systemMenuRoles { get; set; }

        public DbSet<SystemRole> SystemRoles { get; set; }

        public DbSet<SystemUser> SystemUsers { get; set; }

        public DbSet<Record> Contents { get; set; }

        public DbSet<LogMessage> LogMessages { get; set; }

        public DbSet<MessageHistory> MessageHistorys { get; set; }

        public DbSet<SystemAction> SystemActions { get; set; }

        public DbSet<Banner> Banners { get; set; }

        public DbSet<BannerType> BannerTypes { get; set; }

        public DbSet<Category> Categorys { get; set; }

        public DbSet<CategorySpecialty> CategorySpecialtys { get; set; }

        public DbSet<ContactInformation> ContactInformations { get; set; }

        public DbSet<EditorTemplate> EditorTemplates { get; set; }

        public DbSet<RecordImage> ContentSpecialtys { get; set; }

        public DbSet<RecordFile> ContentFiles { get; set; }
        public DbSet<SystemActionRole> SystemActionRole { get; set; }

    }
}