using Inta.Framework.Logging.Log;
using System;
using System.Collections.Generic;
using System.Net.Mail;

namespace Inta.Framework.Extension.Common
{
    public class MailManager
    {
        private string _SenderEmail { get; set; }
        private string _SenderPasword { get; set; }
        private string _AttachmentFilePath { get; set; }
        private int _Port { get; set; }
        private string _Host { get; set; }
        public MailManager(string SenderEmail, string SenderPasword, string AttachmentFilePath, int Port, string Host)
        {
            _SenderEmail = SenderEmail;
            _SenderPasword = SenderPasword;
            _AttachmentFilePath = AttachmentFilePath;
            _Port = Port;
            _Host = Host;

        }

        public bool Send(List<string> Mails, string Message, string Subject)
        {
            bool isSend = false;
            try
            {
                MailMessage eMailSettings = new MailMessage();
                eMailSettings.From = new MailAddress(_SenderEmail);
                foreach (var item in Mails)
                    eMailSettings.To.Add(item);

                if (!String.IsNullOrEmpty(_AttachmentFilePath))
                    eMailSettings.Attachments.Add(new Attachment(_AttachmentFilePath));

                eMailSettings.Subject = Subject;
                eMailSettings.Body = Message;

                SmtpClient smtp = new SmtpClient();
                smtp.Credentials = new System.Net.NetworkCredential(_SenderEmail, _SenderPasword);
                smtp.Port = _Port;
                smtp.Host = _Host;
                smtp.EnableSsl = true;
                object userState = eMailSettings;

                smtp.Send(eMailSettings);
                isSend = true;
            }
            catch (Exception ex)
            {
                isSend = false;
                LogManager.InsertLog(ex, "Mail gönderilirken hata oluştu", (object)_SenderEmail);
            }

            return isSend;
        }
    }
}
