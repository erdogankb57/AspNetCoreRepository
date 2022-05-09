namespace Inta.Kurumsal.Bussiness.Abstract
{
    public interface IAuthenticationData
    {
        int LanguageId { get; }
        string UserName { get; }
        string Password { get; }
        string LoginDate { get; }
        bool HasSession { get; }
    }
}
