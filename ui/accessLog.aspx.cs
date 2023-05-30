using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lumex.Project.BLL;
using Lumex.Project.DAL;
using System.Data;
using System.Net;
using Newtonsoft.Json;


namespace DiuAcsCnt.ui
{
    public partial class accessLog : System.Web.UI.Page
    {


        int tableCheck;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

              //  getAccessLogList();

            }
            msgbox.Visible = false;
            GridviewHeadStyle();
        }

        private void getAccessLogList()
        {

            try
            {
                FlapGateComBLL flapgateBll = new FlapGateComBLL();
                DataTable dt = flapgateBll.getAccessLogListToGridView();
                GridViewAccessLog.DataSource = dt;
                GridViewAccessLog.DataBind();
                GridviewHeadStyle();
                // DeviceListGridView.Columns[7].Visible = false;
            }
            catch (Exception ex)
            {
                string message = ex.Message;
                if (ex.InnerException != null) { message += " --> " + ex.InnerException.Message; }
                MyAlertBox("ErrorAlert(\"" + ex.GetType() + "\", \"" + message + "\", \"\");");
            }
        }

        private void getAccessRawLogList()
        {

            try
            {
                FlapGateComBLL flapgateBll = new FlapGateComBLL();
                DataTable dt = flapgateBll.getAccessRawLogListToGridView();
                GridViewRawLog.DataSource = dt;
                GridViewRawLog.DataBind();
               // GridviewHeadStyle();
                // DeviceListGridView.Columns[7].Visible = false;
            }
            catch (Exception ex)
            {
                string message = ex.Message;
                if (ex.InnerException != null) { message += " --> " + ex.InnerException.Message; }
                MyAlertBox("ErrorAlert(\"" + ex.GetType() + "\", \"" + message + "\", \"\");");
            }
        }


        private void GridviewHeadStyle()
        {
            if (GridViewAccessLog.Rows.Count > 0)
            {
                GridViewAccessLog.UseAccessibleHeader = true;
                GridViewAccessLog.HeaderRow.TableSection = TableRowSection.TableHeader;

            }
        }
        private void MyAlertBox(string alertScript)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", alertScript, true);
        }

        protected void btngetAlldevicelog_Click(object sender, EventArgs e)
        {
            headerTitle.Text = "Access Log List";
            tableCheck = 0;
            getAccessLogList();
            GridViewRawLog.Visible = false;

            DeviceBLL devicebll = new DeviceBLL();


            FlapGateComBLL flipbll = new FlapGateComBLL();
            GridViewAccessLog.Visible = true;


            try
            {
                DataTable dt = devicebll.getDeviceList();
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        int execute = flipbll.uploadFlipGateLog(row["DeviceId"].ToString(), row["ControllerSN"].ToString(), row["DeviecIp"].ToString(), row["DevicePort"].ToString());
                       
                    }
                    string message = " <span class='actionTopic'>" + " Updated Successfully</span>.";
                    MyAlertBox("var callbackOk = function () ; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                  //  MyAlertBox("var callbackOk = function () { window.location = \"/ui/accessLog.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");
                }
               

            }
            catch (Exception)
            { 

                string message = " <span class='actionTopic'>" + "Sorry. Something going wrong. Try later.</span>.";
                MyAlertBox("var callbackOk = function () { window.location = \"/ui/accessLog.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");
            }

        }

       

       

        protected void btngetAllRawLog_Click(object sender, EventArgs e)
        {
            tableCheck = 1;

            GridViewAccessLog.Visible = false;
            GridViewRawLog.Visible = true;
            headerTitle.Text = "Access All Raw List";
            
            getAccessRawLogList();

        }

       

        protected void btnSearchLog_Click(object sender, EventArgs e)
        {
            if (tableCheck == 0)
            {
                //search form access log
            }
            else
            {
                //search form raw log

            }

        } 



    }
}