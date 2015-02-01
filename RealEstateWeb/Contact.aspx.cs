using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RealEstateBusinessLayer;
using RealEstatePOCO;
using System.Net.Mail;
using System.Net;
using System.Configuration;

namespace RealEstateWeb
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 

                AgencyBLL aBLL=new AgencyBLL();
                Agency agency = aBLL.GetAgency();
                if (agency != null)
                {
                    this.LitAgencyName.Text = agency.AgencyName;
                    this.LitAddressLine1.Text = agency.AddressLine1;
                    this.LitProvinceState.Text = string.Format("{0}, {1}, {2}", agency.City, agency.StateProvince, agency.PostalCode);
                    this.LitPhone1.Text = (!string.IsNullOrEmpty(agency.Phone1))? String.Format("{0:(###) ###-####}", Double.Parse(agency.Phone1)):string.Empty;
                    this.LitFax.Text = (!string.IsNullOrEmpty(agency.Fax))? String.Format("{0:(###) ###-####}", Double.Parse(agency.Fax)):string.Empty;
                    this.rdContact1.Checked = true;
                    this.lblResultMail.Text = String.Empty;
                    
                    
                }

                AgentBLL objAgent = new AgentBLL();
                Agent agent = objAgent.GetAgentInfo();
                if (agent != null)
                {
                    this.LitAgentName.Text = String.Format("{0} {1}", agent.FirstName, agent.LastName);
                    this.LitPhoneCel.Text = String.Format("{0:(###) ###-####}", Double.Parse(agent.CellPhone)); 
                }

            }
            this.txtMailName.Focus();
        }

        private MailClass GetMailConfiguration()
        {
            MailClass objMail = new MailClass();
            //Request.ApplicationPath Retrieves the root of the application
            System.Configuration.Configuration rootWebConfig1 =
                System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);
            //System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/OSL");

            if (0 < rootWebConfig1.AppSettings.Settings.Count)
            {
                //SMPT Server
                System.Configuration.KeyValueConfigurationElement customSettingSMTPSever =
                    rootWebConfig1.AppSettings.Settings["SMPTServer"];
                if (null != customSettingSMTPSever) objMail.SMTPSever = customSettingSMTPSever.Value;

                //MailUser
                System.Configuration.KeyValueConfigurationElement customSettingMailUser =
                    rootWebConfig1.AppSettings.Settings["MailUser"];
                if (null != customSettingMailUser) objMail.Mailuser = customSettingMailUser.Value;

                //MailPassword
                System.Configuration.KeyValueConfigurationElement customSettingMailPassword =
                    rootWebConfig1.AppSettings.Settings["MailPswd"];
                if (null != customSettingMailPassword) objMail.MailPswd = customSettingMailPassword.Value;

                //To Mail
                System.Configuration.KeyValueConfigurationElement customSettingToMail =
                    rootWebConfig1.AppSettings.Settings["ToMail"];
                if (null != customSettingToMail) objMail.ToMail = customSettingToMail.Value;
            }
            return objMail;
        }

        protected void cmdSendMail_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string er;
                try
                {
                    if (((this.txtMailPhone.Text == "") && (this.rdContact2.Checked)))
                    {
                        this.lblResultMail.Text = "Write a phone number";
                        return;
                    }
                    else
                    {
                        this.lblResultMail.Text = "";
                    }
                    
                    SendMail();
                   
                    this.txtMailName.Text = ""; this.txtMailEmail.Text = "";
                    this.txtMailPhone.Text = ""; this.txtMailComment.Text = "";
                    this.drpMailIssue.SelectedIndex = 0;
                    this.lblResultMail.Text = "Your message has been sent. An agent will contact you soon.";
                }
                catch (System.Net.Mail.SmtpException err_mail)
                {
                    er = err_mail.InnerException.ToString();
                    this.lblResultMail.Text = "Error sending Mail. Please call agent.";
                }
                catch (System.Exception gexc)
                {
                    er = gexc.InnerException.ToString();
                    this.lblResultMail.Text = "General Error. Please call agent.";
                }
            }
        }

        public void SendMail()
        {
            MailClass objMail = this.GetMailConfiguration();
            string server = objMail.SMTPSever;
            string pnumber = (this.txtMailPhone.Text == "" ? "<not provided>" : this.txtMailPhone.Text);
            MailAddress to = new MailAddress(objMail.ToMail);
            MailAddress from = new MailAddress(this.txtMailEmail.Text);
            MailMessage message = new MailMessage(from, to);
            string contactform = (this.rdContact1.Checked ? "Email" : "Phone number");
            message.Subject = String.Format("Real Estate:{0}", this.drpMailIssue.SelectedItem.Text);
            string BodyMessage = String.Format("Client: {0}\r\nEmail: {1}\r\nPhone: {2}" +
            "\r\nContact me by: {3} \r\n********************", this.txtMailName.Text, this.txtMailEmail.Text,
            pnumber, contactform);
            message.Body = String.Format("{0}\r\nMessage:\r\n{1}", BodyMessage, this.txtMailComment.Text);
            // Add a carbon copy recipient.
            //MailAddress copy = new MailAddress("flores.hector@getronics.com");
            //message.CC.Add(copy);

            SmtpClient client = new SmtpClient(server);
            // Include credentials if the server requires them.
            client.Credentials = new  NetworkCredential(objMail.Mailuser, objMail.MailPswd);
            client.Send(message);

        }
    }
}