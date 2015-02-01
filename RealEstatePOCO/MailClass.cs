using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace RealEstatePOCO
{
    public class MailClass
    {
        private string _ToMail;
        private string _SMTPServer;
        private string _Mailuser;
        private string _Mailpswd;

        public string ToMail
        {
            get
            {
                return _ToMail;
            }
            set
            {
                _ToMail = value;
            }
        }

        public string SMTPSever
        {
            get
            {
                return _SMTPServer;
            }
            set
            {
                _SMTPServer = value;
            }
        }

        public string Mailuser
        {
            get
            {
                return _Mailuser;
            }
            set
            {
                _Mailuser = value;
            }
        }

        public string MailPswd
        {
            get
            {
                return _Mailpswd;
            }
            set
            {
                _Mailpswd = value;
            }
        }
    
    }
}
