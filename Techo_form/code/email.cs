  using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Techo_form
{
    public class email
    {
        public bool SendEmail(string Email1, string subject, string body)
        {

            bool success = false;
            MailMessage mail = new MailMessage();
            mail.To.Add(Email1);
            mail.From = new MailAddress("techo@macrisschool.org");

            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;

            SmtpClient smtp = new SmtpClient();

            smtp.UseDefaultCredentials = false;
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new NetworkCredential("techo@macrisschool.org", "M3CH2023!");

            smtp.EnableSsl = true;
            try
            {
                smtp.Send(mail);
                success = true;
            }catch (Exception ex)
            {
                success = false;
            }
            return success;
        }
    }
}