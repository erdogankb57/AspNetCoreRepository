using Inta.Framework.Logging.Serializer;
using System;
using System.Data.SqlClient;

namespace Inta.Framework.Logging.Log
{
    public static class LogManager
    {
        public static void InsertLog(Exception ex, string message, object objData = null)
        {
            using (LogConnection conn = new LogConnection())
            {
                try
                {
                    if (ex == null)
                        return;
                    JavaScript<object> serializer = new JavaScript<object>();

                    string source = !string.IsNullOrEmpty(ex.Source) ? ex.Source.ToString() : "";
                    string errorMessage = !string.IsNullOrEmpty(ex.Message) ? ex.Message.ToString() : "";
                    string innerException = ex.InnerException == null ? "" : ex.InnerException.Message.ToString();
                    string stackTrace = !string.IsNullOrEmpty(ex.StackTrace) ? ex.StackTrace.ToString() : "";
                    string obj = string.Empty;


                    if (objData != null)
                        obj = serializer.Serializer(objData);

                    if (conn.connection.State == System.Data.ConnectionState.Closed)
                        conn.connection.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[LogMessage](Message,Source,ErrorMessage,InnerException,StackTrace,ObjectSource) values(@Message,@Source,@ErrorMessage,@InnerException,@StackTrace,@ObjectSource)", conn.connection);
                    cmd.Parameters.AddWithValue("Message", message);
                    cmd.Parameters.AddWithValue("Source", source);
                    cmd.Parameters.AddWithValue("ErrorMessage", errorMessage);
                    cmd.Parameters.AddWithValue("InnerException", innerException);
                    cmd.Parameters.AddWithValue("StackTrace", stackTrace);
                    cmd.Parameters.AddWithValue("ObjectSource", obj);


                    int result = cmd.ExecuteNonQuery();

                }
                catch (Exception e)
                {

                }
                finally
                {
                    conn.connection.Close();
                    conn.connection.Dispose();
                }

            }
        }
    }
}
