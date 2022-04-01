var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Json d�nerken camel case �zelli�i pascal case olarak de�i�tirildi.
builder.Services.AddMvc(setupAction =>
{
    setupAction.EnableEndpointRouting = false;
}).AddJsonOptions(jsonOptions =>
{
    jsonOptions.JsonSerializerOptions.PropertyNamingPolicy = null;
});

<<<<<<< HEAD
builder.Services.AddSingleton<IConfiguration>(builder.Configuration);
=======
builder.Services.AddSession();
>>>>>>> 2ce57d848e7650b55e809ec539b67f8ec8fad8c9

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

app.Run();