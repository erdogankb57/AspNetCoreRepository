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