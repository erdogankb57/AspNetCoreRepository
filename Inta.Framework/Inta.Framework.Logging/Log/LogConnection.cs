using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Inta.Framework.Logging.Log
{
    public class LogConnection : IDisposable
    {
        private static SqlConnection _connection;
        static object lockKontrol = new object();

        public LogConnection()
        {

        }
        public SqlConnection connection
        {
            get
            {
                lock (lockKontrol)
                {
                    IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
                    IConfigurationRoot configuration = builder.Build();

                    if (_connection == null || _connection.State == System.Data.ConnectionState.Closed)
                        _connection = new SqlConnection(configuration.GetConnectionString("DefaultDataContext"));

                    return _connection;
                }
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}
