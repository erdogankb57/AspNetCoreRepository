using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Json;
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Inta.Framework.Logging.Log
{
    public class LogConnection : IDisposable
    {
        //Singleton design pattern eklendi.
        public static SqlConnection? Connection { get; private set; } = null;
        private SqlConnection? _connection;

        private static LogConnection logConnection = null;
        static object lockKontrol = new object();
        private LogConnection()
        {
            lock (lockKontrol)
            {
                IConfigurationBuilder builder = new ConfigurationBuilder().AddJsonFile("appsettings.json");
                IConfigurationRoot configuration = builder.Build();

                if (_connection == null || _connection.State == System.Data.ConnectionState.Closed)
                    _connection = new SqlConnection(configuration.GetConnectionString("DefaultDataContext"));

                Connection = _connection;
            }
        }

        public static LogConnection GetLogConnection()
        {
            if (logConnection == null || Connection == null || Connection.State == System.Data.ConnectionState.Closed)
                logConnection = new LogConnection();

            return logConnection;
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}
