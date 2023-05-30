using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Text;
using System.Threading.Tasks;
namespace DiuAcsCnt.ui
{
    public class APICallerMaster
    {
        public string ApiCallingforPost(string uri, dynamic data)
        {
            try
            {
                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
                       | SecurityProtocolType.Tls11
                       | SecurityProtocolType.Tls12
                       | SecurityProtocolType.Ssl3;
                ServicePointManager.ServerCertificateValidationCallback = new
RemoteCertificateValidationCallback
(
  delegate { return true; }
);
                HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(uri);



                httpWebRequest.ContentType = "application/json";
                httpWebRequest.Accept = "application/json";
                httpWebRequest.Method = "POST";
                var jsonString = JsonConvert.SerializeObject(data);
                byte[] bytes = Encoding.UTF8.GetBytes(jsonString);
                httpWebRequest.ContentLength = (long)bytes.Length;
                Stream requestStream = httpWebRequest.GetRequestStream();
                requestStream.Write(bytes, 0, bytes.Length);
                requestStream.Flush();
                requestStream.Close();

                using (StreamReader streamReader = new StreamReader(httpWebRequest.GetResponse().GetResponseStream()))
                {
                    return streamReader.ReadLine();
                }
            }
            catch (WebException e)
            {
                using (WebResponse response = e.Response)
                {
                    HttpWebResponse httpResponse = (HttpWebResponse)response;
                    using (var streamReader = new StreamReader(response.GetResponseStream()))
                    {
                        return streamReader.ReadLine();
                    }

                }
            }
        }
    }
}