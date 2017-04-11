using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebCommandLaucher
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                labelReperibile.Text = recuperaReperibile();

                string listPath = Server.MapPath(string.Format("~/{0}", ConfigurationManager.AppSettings["get.reperibile.list"]));
                if (File.Exists(listPath))
                {
                    dropDownReperibili.Items.Clear();

                    foreach (string line in File.ReadLines(listPath))
                    {
                        var arr = line.Split(';');

                        ListItem li = new ListItem(string.Format("{0} - {1}", arr[0], arr[1]), arr[1]);
                        dropDownReperibili.Items.Add(li);

                    }

                    dropDownReperibili.SelectedValue = labelReperibile.Text;
                }
            }
        }



        private void setReperibile(string num)
        {
            ProcessStartInfo pinfo = new ProcessStartInfo(
                                            ConfigurationManager.AppSettings["set.reperibile.exe"],
                                            ConfigurationManager.AppSettings["set.reperibile.parameters"].Replace("%CELL%", num)
                                         );

            pinfo.RedirectStandardError = true;
            pinfo.RedirectStandardOutput = true;
            pinfo.UseShellExecute = false;

            using (Process process = Process.Start(pinfo))
            {
                process.WaitForExit();
            }
        }

        private string recuperaReperibile()
        {
            string ret = string.Empty;

            ProcessStartInfo pinfo = new ProcessStartInfo(ConfigurationManager.AppSettings["get.reperibile.exe"], ConfigurationManager.AppSettings["get.reperibile.parameters"]);
            pinfo.RedirectStandardError = true;
            pinfo.RedirectStandardOutput = true;
            pinfo.UseShellExecute = false;

            //
            // Start the process.
            //
            using (Process process = Process.Start(pinfo))
            {
                process.WaitForExit();
                //
                // Read in all the text from the process with the StreamReader.
                //

                int num = 0;
                if (!int.TryParse(ConfigurationManager.AppSettings["get.reperibile.linevalue"], out num))
                {
                    num = 0;
                }
                using (StreamReader reader = process.StandardOutput)
                {
                    int index = 0;
                    while (!reader.EndOfStream) {
                        string result = reader.ReadLine();
                        //labelReperibile.Text = result.Replace("\n", "<br/>");

                        if (num == index)
                        {
                            var arraVal = result.Split(':');
                            ret = arraVal[arraVal.Length - 1].Split('@')[0];
                            break;
                        }

                        index++;
                    }
                
                }
            }

            return ret;

        }

        protected void buttonSet_Click(object sender, EventArgs e)
        {
            setReperibile(dropDownReperibili.SelectedValue);
        }

        protected void buttonGet_Click(object sender, EventArgs e)
        {
            labelReperibile.Text = recuperaReperibile();
        }
    }
}