namespace Inta.EntityFramework.Core.Model
{
    public class DataResult<T>
    {
        public T Data { get; set; }
        public string ErrorMessage { get; set; }
        public string ResultMessage { get; set; }
        public MessageType ResultType { get; set; }
    }

    public enum MessageType
    {
        Success = 0,
        Error = 1,
        Warning = 2
    }
}
