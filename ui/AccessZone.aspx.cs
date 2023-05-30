using Lumex.Project.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DiuAcsCnt.ui
{
    public partial class AccessZone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllDeviceList();
                getZoneDeviceMapList();
            }
            msgbox.Visible = false;
            GridviewHeadStyle();

        }

        private void getZoneDeviceMapList()
        {
            try
            {
                AccessZoneBLL acbll = new AccessZoneBLL();
                DataTable dt = acbll.getZoneDeviceMapList();
                DeviceZoneMapGridView.DataSource = dt;
                DeviceZoneMapGridView.DataBind();
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

        protected void MyAlertBox(string alertScript)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", alertScript, true);
        }

        private void getAllDeviceList()
        {
            try
            {
                DeviceBLL devicebll = new DeviceBLL();
                DataTable dt = devicebll.getDeviceList();
                lstDevices.DataSource = dt;
                lstDevices.DataTextField = "DeviceName";
                lstDevices.DataValueField = "DeviceId";
                lstDevices.DataBind();

                lstDevices.Items.Insert(0, "Select Please");
                lstDevices.SelectedIndex = 0;
                lstDevices.Items[0].Value = "";
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
            if (DeviceZoneMapGridView.Rows.Count > 0)
            {
                DeviceZoneMapGridView.UseAccessibleHeader = true;
                DeviceZoneMapGridView.HeaderRow.TableSection = TableRowSection.TableHeader;

            }
        }

        //protected void btnAccessZoneSave_Click(object sender, EventArgs e)
        //{

        //}

        protected void btnAccessZoneSave_Click1(object sender, EventArgs e)
        {
            AccessZoneBLL acBLL = new AccessZoneBLL();



            try
            {
                if (lstZone.SelectedItem.Value == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = " field is required.";
                }
                else if (lstDevices.SelectedItem.Value == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Device Selection Is required.";
                }
               
                
                else
                {

                    acBLL.AccessName = lstZone.SelectedItem.Value.Trim();
                    acBLL.DeviceID = lstDevices.SelectedItem.Value.Trim();


                    if (btnAccessZoneSave.CommandArgument == "0")
                    {
                        if (!acBLL.CheckDuplicateMapZoneDevice(acBLL.AccessName, acBLL.DeviceID))
                        {
                            //countrybll.countryFlag = uploadCountryFlag(txtbxCurrencyCode.Text.Trim(), 131072, fileUploadFlag);
                            //DataTable dt ;//= user.SaveUser();
                            int execute = acBLL.saveZoneDeviceMapInfo();
                            if (execute > 0)
                            {
                                string message = " <span class='actionTopic'>" + " Data Saved Successfully</span>.";
                                MyAlertBox("var callbackOk = function () { window.location = \"/ui/AccessZone.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");
                            }
                            else
                            {
                                string message = " <span class='actionTopic'>" + "Sorry. Something going wrong. Try later.</span>.";
                                MyAlertBox("var callbackOk = function () { window.location = \"/ui/AccessZone.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");


                            }
                        }
                        else
                        {

                            //statusImg.Visible = true;
                            //statusImg.ImageUrl = "~/content/images/remove.png";
                            //statusImg.ToolTip = "Batch No already exists for this course!!!";
                            msgbox.Visible = true;
                            msgTitleLabel.Text = "Duplicate Data!";
                            msgDetailLabel.Text = "Device Already Exit!!!";
                            msgbox.Attributes.Add("class", "alert alert-warning");

                        }
                    }
                    else
                    {
                        
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

        protected void deleteLinkButton_Click(object sender, EventArgs e)
        {
            LinkButton Btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)Btn.NamingContainer;

            try
            {

                hdnFldSerial.Value = DeviceZoneMapGridView.Rows[row.RowIndex].Cells[0].Text;
                AccessZoneBLL acbll = new AccessZoneBLL();
                acbll.mapSerial = hdnFldSerial.Value;
                int execute = acbll.DeleteDeviceZoneMap();
                if (execute > 0)
                {
                    string message = " <span class='actionTopic'>" + " Data Deleted Successfully</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/AccessZone.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                }
                else
                {
                    string message = " <span class='actionTopic'>" + "Sorry. Something going wrong. Try later.</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/AccessZone.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");

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