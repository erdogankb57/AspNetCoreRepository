using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.Service;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Json dönerken camel case özelliði pascal case olarak deðiþtirildi.
builder.Services.AddMvc(setupAction =>
{
    setupAction.EnableEndpointRouting = false;
}).AddJsonOptions(jsonOptions =>
{
    jsonOptions.JsonSerializerOptions.PropertyNamingPolicy = null;
});

builder.Services.AddSingleton<IConfiguration>(builder.Configuration);
builder.Services.AddTransient<IBannerTypeService, BannerTypeService>();
builder.Services.AddTransient<IBannerService, BannerService>();
builder.Services.AddTransient<ICategoryService, CategoryService>();
builder.Services.AddTransient<IContactInformationService, ContactInformationService>();
builder.Services.AddTransient<IEditorTemplateService, EditorTemplateService>();
builder.Services.AddTransient<IFileUploadService, FileUploadService>();
builder.Services.AddTransient<IFirmVariablesService, FirmVariablesService>();
builder.Services.AddTransient<IFormElementService, FormElementService>();
builder.Services.AddTransient<IFormElementOptionsService, FormElementOptionsService>();
builder.Services.AddTransient<IFormGroupService, FormGroupService>();
builder.Services.AddTransient<IGeneralSettingsService, GeneralSettingsService>();
builder.Services.AddTransient<ILanguageService, LanguageService>();
builder.Services.AddTransient<IMessageHistoryService, MessageHistoryService>();
builder.Services.AddTransient<IMessageTypeService, MessageTypeService>();
builder.Services.AddTransient<IPageTypeService, PageTypeService>();
builder.Services.AddTransient<IRecordService, RecordService>();
builder.Services.AddTransient<IRecordFileService, RecordFileService>();
builder.Services.AddTransient<IRecordImageService, RecordImageService>();
builder.Services.AddTransient<ISeoIndexService, SEOIndexService>();
builder.Services.AddTransient<IStaticTextService, StaticTextService>();
builder.Services.AddTransient<ISystemActionService, SystemActionService>();
builder.Services.AddTransient<ISystemActionRoleService, SystemActionRoleService>();
builder.Services.AddTransient<ISystemMenuService, SystemMenuService>();
builder.Services.AddTransient<ISystemMenuRoleService, SystemMenuRoleService>();
builder.Services.AddTransient<ISystemRoleService, SystemRoleService>();
builder.Services.AddTransient<ISystemUserService, SystemUserService>();

builder.Services.AddSession();
builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

var app = builder.Build();


// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();
app.UseSession();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "file",
    pattern: "{controller=File}/{action=Image}/{Id}/{width}/{filename}");


app.Run();