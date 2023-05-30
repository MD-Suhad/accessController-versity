using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lumex.Project.BLL;
using System.Data;
using System.Net;

namespace DiuAcsCnt
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkbtnLogin_Click(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            LoginBLL loginbll = new LoginBLL();


            if (txtbxloginId.Text != "" && txtbxPass.Text != "")
            {
                try
                {
                    var userPass = new LoginBLL
                    {
                        loginId = txtbxloginId.Text.Trim(),
                        Password = txtbxPass.Text
                    };

                    var loginBLL = new LoginBLL
                    {
                        Email = txtbxloginId.Text.Trim()
                    };




                }
                catch
                {

                }


            }
        }
    }
}