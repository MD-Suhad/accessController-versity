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
    public partial class AccessManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllDeviceList();
                getAllAccessManageList();
            }


        }

        private void getAllAccessManageList()
        {
            try
            {
                AccManageBLL acMbll = new AccManageBLL();
                DataTable dt = acMbll.getAllAccessManageList();
                grdViewAccessMange.DataSource = dt;
                grdViewAccessMange.DataBind();
                GridviewHeadStyle();

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
            if (grdViewAccessMange.Rows.Count > 0)
            {
                grdViewAccessMange.UseAccessibleHeader = true;
                grdViewAccessMange.HeaderRow.TableSection = TableRowSection.TableHeader;

            }
        }

        protected void editAccessButton_Click(object sender, EventArgs e)
        {

            LinkButton Btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)Btn.NamingContainer;

            try
            {

                hdnFldSerial.Value = grdViewAccessMange.Rows[row.RowIndex].Cells[0].Text;
                txtbxStudentId.Text = grdViewAccessMange.Rows[row.RowIndex].Cells[1].Text;
                txtbxIcCard.Text = grdViewAccessMange.Rows[row.RowIndex].Cells[2].Text;

                txtbxIssueDate.Text = grdViewAccessMange.Rows[row.RowIndex].Cells[5].Text;
                txtbxExpireDate.Text = grdViewAccessMange.Rows[row.RowIndex].Cells[6].Text;

                lstDevices.SelectedValue = grdViewAccessMange.Rows[row.RowIndex].Cells[3].Text;


                btnAcManageUpdate.Text = "Update to  Access Management Map";
                btnAcManageUpdate.CommandArgument = "1";
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
        protected string getStatusMening(string issync)
        {
            string status = "";
            if (issync == "0")
            {

                //if (!row.IsNewRow && int.Parse(row.Cells[2].Value.ToString()) < 0)
                //    row.Cells[2].Style.BackColor = Color.Red;



                status = "btn btn-sm btn-warning btn-flat  ";


            }
            else
            {
                status = "btn btn-sm btn-success btn-flat";

            }
            return status;

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

        private void MyAlertBox(string alertScript)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", alertScript, true);
        }

        protected void btnAcManageUpdate_Click(object sender, EventArgs e)
        {
            AccManageBLL accManagebll = new AccManageBLL();


            



            try
            {
               
                

                
              {
                    accManagebll.IcCard = txtbxIcCard.Text.Trim();
                    accManagebll.IssueDate = txtbxIssueDate.Text.Trim();
                    accManagebll.ExpireDate = txtbxExpireDate.Text.Trim();
                    accManagebll.DeviceId = lstDevices.SelectedValue.ToString();
                    accManagebll.StudentId = txtbxStudentId.Text.Trim();

                    {
                        //countrybll.countryFlag = uploadCountryFlag(txtbxCurrencyCode.Text.Trim(), 131072, fileUploadFlag);
                        accManagebll.SerialID = hdnFldSerial.Value;
                        int execute = accManagebll.updateAccManageInfo();
                        if (execute > 0)
                        {
                            string message = " <span class='actionTopic'>" + " Data Updated Successfully</span>.";
                            MyAlertBox("var callbackOk = function () { window.location = \"/ui/AccessManage.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                        }
                        else
                        {
                            string message = " <span class='actionTopic'>" + "Sorry. Something goind wrong. Try later.</span>.";
                            MyAlertBox("var callbackOk = function () { window.location = \"/ui/AccessManage.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");

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


            }
        }

        protected void syncDeviceAccessButton_Click(object sender, EventArgs e)
        {

            LinkButton Btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)Btn.NamingContainer;

            try
            {

                hdnFldSerial.Value = grdViewAccessMange.Rows[row.RowIndex].Cells[1].Text;
                AccManageBLL accBLL = new AccManageBLL();
                //studentbll.SerialNo = hdnFldSerial.Value;
                accBLL.SerialID = grdViewAccessMange.Rows[row.RowIndex].Cells[0].Text;
                //studentbll.DefaultZone = StudentListGridView.Rows[row.RowIndex].Cells[4].Text;
                //studentbll.IcCard= StudentListGridView.Rows[row.RowIndex].Cells[6].Text;
                //studentbll.CreatedDate = StudentListGridView.Rows[row.RowIndex].Cells[7].Text;
                //studentbll.CardExpire = StudentListGridView.Rows[row.RowIndex].Cells[8].Text;
                int execute = accBLL.addStudentCardToDeviceBySerial();
                if (execute > 0)
                {
                    //Delete From Device Also
                    string message = " <span class='actionTopic'>" + "Card Added Successfully</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/AccessManage.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                }
                else
                {
                    string message = " <span class='actionTopic'>" + "Sorry. Something is going wrong. Try later.</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/AccessManage.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");

                }


            }
            catch (Exception ex)
            {

                string message = ex.Message;
                if (ex.InnerException != null) { message += " --> " + ex.InnerException.Message; }
                MyAlertBox("ErrorAlert(\"" + ex.GetType() + "\", \"" + message + "\", \"\");");
            }
        }


        protected void removeCardfromDeviceButton_Click(object sender, EventArgs e)
        {

            LinkButton Btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)Btn.NamingContainer;

            try
            {

                hdnFldSerial.Value = grdViewAccessMange.Rows[row.RowIndex].Cells[1].Text;
                AccManageBLL accBLL = new AccManageBLL();
                //studentbll.SerialNo = hdnFldSerial.Value;
                accBLL.SerialID = grdViewAccessMange.Rows[row.RowIndex].Cells[0].Text;
                //studentbll.DefaultZone = StudentListGridView.Rows[row.RowIndex].Cells[4].Text;
                //studentbll.IcCard= StudentListGridView.Rows[row.RowIndex].Cells[6].Text;
                //studentbll.CreatedDate = StudentListGridView.Rows[row.RowIndex].Cells[7].Text;
                //studentbll.CardExpire = StudentListGridView.Rows[row.RowIndex].Cells[8].Text;
                int execute = accBLL.removeStudentCardToDeviceBySerial();
                if (execute > 0)
                {
                    //Delete From Device Also
                    string message = " <span class='actionTopic'>" + "Student Card removed from Device Successfully</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/AccessManage.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                }
                else
                {
                    string message = " <span class='actionTopic'>" + "Sorry. Something is going wrong. Try later.</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/AccessManage.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");

                }


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