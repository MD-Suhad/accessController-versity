using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lumex.Project.BLL;
using System.Data;

namespace DiuAcsCnt.ui
{
    public partial class devices : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllDeviceList();
            }
            msgbox.Visible = false;
            GridviewHeadStyle();
        }

        private void getAllDeviceList()
        {
            try
            {
                DeviceBLL devicebll = new DeviceBLL();
                DataTable dt = devicebll.getDeviceList();
                DeviceListGridView.DataSource = dt;
                DeviceListGridView.DataBind();
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
        private void GridviewHeadStyle()
        {
            if (DeviceListGridView.Rows.Count > 0)
            {
                DeviceListGridView.UseAccessibleHeader = true;
                DeviceListGridView.HeaderRow.TableSection = TableRowSection.TableHeader;

            }
        }
        protected void MyAlertBox(string alertScript)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", alertScript, true);
        }
        protected void btnDeviceSave_Click(object sender, EventArgs e)
        {
            DeviceBLL devicebll = new DeviceBLL();


            try
            {
                if (txtbxDeviceControllerSN.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Controller Serial No. is required.";
                }
                if (txtbxDeviceName.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Device Name is required.";
                }
                else if (txtbxDeviceIP.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Device Ip is required.";
                }
                else if (txtbxDevicePort.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Device Port is required.";
                }
                //else if (txtbxCurrencyRate.Text == "")
                //{
                //    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Currency Rate field is required.";
                //}
                //else if (txtbxCurrencyCode.Text == "")
                //{
                //    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Currency Code is required.";
                //}
                //else if (!fileUploadFlag.HasFile && btnDeviceSave.CommandArgument == "0")
                //{
                //    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Country Flug is required.";
                //}
                //else if (fileUploadFlag.HasFile && fileUploadFlag.PostedFile.ContentLength > 131072)
                //{
                //    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Country Flug must less then 128 KB.";
                //}
                else
                {
                    devicebll.DeviceControllerSN = txtbxDeviceControllerSN.Text.Trim();
                    devicebll.DeviceName = txtbxDeviceName.Text.Trim();
                    devicebll.DeviceIP = txtbxDeviceIP.Text.Trim();
                    devicebll.DevicePort = txtbxDevicePort.Text.Trim();

                    if (btnDeviceSave.CommandArgument == "0")
                    {
                        if (!devicebll.CheckDuplicateCountry(devicebll.DeviceIP))
                        {
                            //countrybll.countryFlag = uploadCountryFlag(txtbxCurrencyCode.Text.Trim(), 131072, fileUploadFlag);
                            //DataTable dt ;//= user.SaveUser();
                            int execute = devicebll.saveDeviceInfo();
                            if (execute > 0)
                            {
                                string message = " <span class='actionTopic'>" + " Data Saved Successfully</span>.";
                                MyAlertBox("var callbackOk = function () { window.location = \"/ui/devices.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");
                            }
                            else
                            {
                                string message = " <span class='actionTopic'>" + "Sorry. Something going wrong. Try later.</span>.";
                                MyAlertBox("var callbackOk = function () { window.location = \"/ui/devices.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");


                            }
                        }
                        else
                        {

                            //statusImg.Visible = true;
                            //statusImg.ImageUrl = "~/content/images/remove.png";
                            //statusImg.ToolTip = "Batch No already exists for this course!!!";
                            msgbox.Visible = true;
                            msgTitleLabel.Text = "Duplicate Data!";
                            msgDetailLabel.Text = "Same ip exists!!!";
                            msgbox.Attributes.Add("class", "alert alert-warning");

                        }
                    }
                    else
                    {
                        //countrybll.countryFlag = uploadCountryFlag(txtbxCurrencyCode.Text.Trim(), 131072, fileUploadFlag);
                        devicebll.deviceId = hdnFldSerial.Value;
                        int execute = devicebll.updateDeviceInfo();
                        if (execute > 0)
                        {
                            string message = " <span class='actionTopic'>" + " Data Updated Successfully</span>.";
                            MyAlertBox("var callbackOk = function () { window.location = \"/ui/devices.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                        }
                        else
                        {
                            string message = " <span class='actionTopic'>" + "Sorry. Something goind wrong. Try later.</span>.";
                            MyAlertBox("var callbackOk = function () { window.location = \"/ui/devices.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                string message = ex.Message;
                if (ex.InnerException != null) { message += " --> " + ex.InnerException.Message; }
                MyAlertBox("ErrorAlert(\"" + ex.GetType() + "\", \"" + message + "\", \"\");");
            }
            finally
            {
                //string message = " <span class='actionTopic'>" + " Data Saved Successfully</span>.";
                //MyAlertBox("var callbackOk = function () { window.location = \"/ui/country/add.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                //string message = " <span class='actionTopic'>" + " Data Saved Successfully</span>.";
                //MyAlertBox("var callbackOk = function () { window.location = \"/ui/country/add.aspx\"; }; ErrorAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

            }
        }

        protected void editLinkButton_Click(object sender, EventArgs e)
        {
            LinkButton Btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)Btn.NamingContainer;

            try
            {

                hdnFldSerial.Value = DeviceListGridView.Rows[row.RowIndex].Cells[0].Text;
                txtbxDeviceControllerSN.Text = DeviceListGridView.Rows[row.RowIndex].Cells[1].Text;
                txtbxDeviceName.Text = DeviceListGridView.Rows[row.RowIndex].Cells[2].Text;
                txtbxDeviceIP.Text = DeviceListGridView.Rows[row.RowIndex].Cells[3].Text;

                txtbxDevicePort.Text = DeviceListGridView.Rows[row.RowIndex].Cells[4].Text;



                btnDeviceSave.Text = "Update Device";
                btnDeviceSave.CommandArgument = "1";
                //  Label lblUserId = (Label)userListGridView.Rows[row.RowIndex].FindControl("lblUserId");
                // LumexSessionManager.Add("UserIdForUpdate", lblUserId.Text);
                // Response.Redirect("~/setting/User/Update.aspx");

            }
            catch (Exception ex)
            {

                string message = ex.Message;
                if (ex.InnerException != null) { message += " --> " + ex.InnerException.Message; }
                MyAlertBox("ErrorAlert(\"" + ex.GetType() + "\", \"" + message + "\", \"\");");
            }
        }

        protected void deleteLinkButton_Click(object sender, EventArgs e)
        {
            LinkButton Btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)Btn.NamingContainer;

            try
            {

                hdnFldSerial.Value = DeviceListGridView.Rows[row.RowIndex].Cells[0].Text;
                DeviceBLL devicebll = new DeviceBLL();
                devicebll.deviceId = hdnFldSerial.Value;
                int execute = devicebll.DeleteDevice();
                if (execute > 0)
                {
                    string message = " <span class='actionTopic'>" + " Data Deleted Successfully</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/devices.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                }
                else
                {
                    string message = " <span class='actionTopic'>" + "Sorry. Something going wrong. Try later.</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/devices.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");

                }
                //  Label lblUserId = (Label)userListGridView.Rows[row.RowIndex].FindControl("lblUserId");
                // LumexSessionManager.Add("UserIdForUpdate", lblUserId.Text);
                // Response.Redirect("~/setting/User/Update.aspx");

            }
            catch (Exception ex)
            {

                string message = ex.Message;
                if (ex.InnerException != null) { message += " --> " + ex.InnerException.Message; }
                MyAlertBox("ErrorAlert(\"" + ex.GetType() + "\", \"" + message + "\", \"\");");
            }
        }
    }
}