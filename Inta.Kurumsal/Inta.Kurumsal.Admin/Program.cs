using Inta.Framework.Logging.Log;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.Bussiness.Common;
using Inta.Kurumsal.Bussiness.Service;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.Extensions.Caching.Memory;

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
builder.Services.AddSingleton(typeof(AuthenticationData));

/*Bussiness katmanýndaki classlar otomatik olarak enjecte edilir.*/
var allProviderTypes = System.Reflection.Assembly.GetEntryAssembly().GetReferencedAssemblies()
    .Select(a => System.Reflection.Assembly.Load(a)).SelectMany(t => t.GetTypes())
    .Where(t => t.Namespace != null);

foreach (var intfc in allProviderTypes.Where(t => t.IsInterface && t.Namespace.Contains("Inta.Kurumsal.Bussiness")))
{
    var impl = allProviderTypes.FirstOrDefault(c => c.IsClass && intfc.Name.Substring(1) == c.Name);
    if (impl != null) builder.Services.AddScoped(intfc, impl);
}
/*Bussiness katmanýndaki classlar otomatik olarak enjecte edilir.*/
builder.Services.AddSession();
builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
builder.Services.AddHttpContextAccessor();
builder.Services.AddMemoryCache();

var app = builder.Build();

Html.SetHttpContext(app?.Services?.GetService<IHttpContextAccessor>());


//var cache = app?.Services.GetService<IMemoryCache>();
//var cacheEntryOptions = new MemoryCacheEntryOptions()
//            .SetAbsoluteExpiration(TimeSpan.FromSeconds(5));
//cache.Set<string>("Deneme", "Deneme", cacheEntryOptions);


//if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler(c => c.Run(async context =>
    {
        var exception = context.Features?
            .Get<IExceptionHandlerPathFeature>()?
            .Error;
        var response = new { error = exception?.Message };

        //Yapýlan istek bir ajax isteði deðil ise
        if (context.Request.Headers["x-requested-with"] != "XMLHttpRequest")
            context.Response.Redirect("/ErrorPage/Index");
        if (exception != null)
            LogManager.InsertLog(exception, "Application Error", null);
    }));

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

app.UseCookiePolicy();

app.Run();