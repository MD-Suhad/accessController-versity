using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lumex.Project.BLL;
using System.Data;
using System.Net;
using Newtonsoft.Json;
using Lumex.Project.DAL;
using Lumex.Tech;
namespace DiuAcsCnt.ui
{
    public partial class studentInfo : System.Web.UI.Page
    {
        //

        APICallerMaster aPICallerMaster = new APICallerMaster();
        StudentBLL userInfo = new StudentBLL();
        List<StudentBLL> userInfos = new List<StudentBLL>();



      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getAllStudentList();
                showTotalStudent();
            }
            msgbox.Visible = false;
            GridviewHeadStyle();
           //  showTotalStudent();
        }

        private void showTotalStudent()
        {
            StudentBLL studentbll = new StudentBLL();

            int execute = studentbll.showTotalStd();

          


        }

        private void GridviewHeadStyle()
        {
            if (StudentListGridView.Rows.Count > 0)
            {
                StudentListGridView.UseAccessibleHeader = true;
                StudentListGridView.HeaderRow.TableSection = TableRowSection.TableHeader;

            }
        }

        private void getAllStudentList()
        {
            try
            {
                StudentBLL studentbll = new StudentBLL();
                DataTable dt = studentbll.getStudentList();
                StudentListGridView.DataSource = dt;
                StudentListGridView.DataBind();
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



        protected void editLinkButton_Click(object sender, EventArgs e)
        {
            LinkButton Btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)Btn.NamingContainer;

            try
            {

                hdnFldSerial.Value = StudentListGridView.Rows[row.RowIndex].Cells[0].Text;
                txtbxStudentID.Text = StudentListGridView.Rows[row.RowIndex].Cells[1].Text;
                txtbxStudentName.Text = StudentListGridView.Rows[row.RowIndex].Cells[2].Text;
                txtbxDeptName.Text = StudentListGridView.Rows[row.RowIndex].Cells[3].Text;
                txtbxDiuCardId.Text = StudentListGridView.Rows[row.RowIndex].Cells[5].Text;
                txtbxIcCard.Text = StudentListGridView.Rows[row.RowIndex].Cells[6].Text;
                txtbxIssueDate.Text = StudentListGridView.Rows[row.RowIndex].Cells[7].Text;
                txtbExpireDate.Text = StudentListGridView.Rows[row.RowIndex].Cells[8].Text;
                DefaultZone.Text = StudentListGridView.Rows[row.RowIndex].Cells[4].Text;





                btnStudentAdd.Text = "Update Student to Access Manage";
                btnStudentAdd.CommandArgument = "1";
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

                hdnFldSerial.Value = StudentListGridView.Rows[row.RowIndex].Cells[0].Text;
                StudentBLL studentbll = new StudentBLL();
                // studentbll.SerialNo = hdnFldSerial.Value;
                studentbll.StudentId = StudentListGridView.Rows[row.RowIndex].Cells[1].Text;
                int execute = studentbll.DeleteStudentFromManageQueue();
                if (execute > 0)
                {
                    
                    //Delete From Device Also
                    string message = " <span class='actionTopic'>" + " Data Deleted Successfully</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/studentInfo.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                }
                else
                {
                    string message = " <span class='actionTopic'>" + "Sorry. Something going wrong. Try later.</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/studentInfo.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");

                }


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


                status = "btn-sm btn-warning btn-flat  ";


            }
            else
            {
                status = " btn-sm btn-success btn-flat";

            }
            return status;

        }

        protected void btnStudentAdd_Click(object sender, EventArgs e)
        {

            StudentBLL studentbll = new StudentBLL();


            try
            {
                if (txtbxStudentName.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Student Name field is required.";
                }
                else if (txtbxDeptName.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Dept Name field is required.";
                }
                else if (txtbxDiuCardId.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Diu Card field is required.";
                }
                else if (txtbxIcCard.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Ic Card field is required.";
                }
                else if (DefaultZone.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Default Zone field is required.";
                }
                else if (txtbxIssueDate.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Issue Date field is required.";
                }

                else if (txtbExpireDate.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Expire Date field is required.";
                }

                else
                {

                    studentbll.StudentId = txtbxStudentID.Text.Trim();
                    studentbll.StudentName = txtbxStudentName.Text.Trim();
                    studentbll.DiuCardId = txtbxDiuCardId.Text.Trim();
                    studentbll.IcCard = txtbxIcCard.Text.Trim();
                    studentbll.DeptName = txtbxDeptName.Text.Trim();
                    studentbll.DefaultZone = DefaultZone.Text.Trim();
                    studentbll.CreatedDate = txtbxIssueDate.Text.Trim();
                    studentbll.CardExpire = txtbExpireDate.Text.Trim();
                    studentbll.IsSync = "0";


                    if (btnStudentAdd.CommandArgument == "0")
                    {
                        if (!studentbll.CheckDuplicateStudent(studentbll.StudentId, studentbll.IcCard))
                        {
                            //countrybll.countryFlag = uploadCountryFlag(txtbxCurrencyCode.Text.Trim(), 131072, fileUploadFlag);
                            //DataTable dt ;//= user.SaveUser();
                            int execute = studentbll.saveStudentInfo();
                            if (execute > 0)
                            {
                                string message = " <span class='actionTopic'>" + "Data Saved Successfully</span>.";
                                MyAlertBox("var callbackOk = function () { window.location = \"/ui/studentInfo.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");
                            }
                            else
                            {
                                string message = " <span class='actionTopic'>" + "Sorry. Something going wrong. Try later.</span>.";
                                MyAlertBox("var callbackOk = function () { window.location = \"/ui/studentInfo.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");


                            }
                        }
                        else
                        {

                            //statusImg.Visible = true;
                            //statusImg.ImageUrl = "~/content/images/remove.png";
                            //statusImg.ToolTip = "Batch No already exists for this course!!!";
                            msgbox.Visible = true;
                            msgTitleLabel.Text = "Duplicate Data!";
                            msgDetailLabel.Text = "Data already Maped by Student ID or ICCard !!!";
                            msgbox.Attributes.Add("class", "alert alert-warning");

                        }
                    }
                    else
                    {
                        //countrybll.countryFlag = uploadCountryFlag(txtbxCurrencyCode.Text.Trim(), 131072, fileUploadFlag);
                        studentbll.SerialNo = hdnFldSerial.Value;
                        int execute = studentbll.updateStudentInfo();
                        if (execute > 0)
                        {
                            string message = " <span class='actionTopic'>" + " Data Updated Successfully</span>.";
                            MyAlertBox("var callbackOk = function () { window.location = \"/ui/studentInfo.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                        }
                        else
                        {
                            string message = " <span class='actionTopic'>" + "Sorry. Something goind wrong. Try later.</span>.";
                            MyAlertBox("var callbackOk = function () { window.location = \"/ui/studentInfo.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");

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

        private void MyAlertBox(string alertScript)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ServerControlScript", alertScript, true);
        }



        protected void btnStudentSearch_Click(object sender, EventArgs e)
        {
            try
            {

                if (txtbxStudentID.Text == "")
                {
                    msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Student ID is required.";
                }
                else
                {


                    string id = txtbxStudentID.Text;
                    string uri = "https://api.1card.com.bd/diu-hall/user-info";
                    var body = new
                    {
                        api_key = "441cb55b346d228799k67f5fb4f880a7",
                        user_id = id
                    };

                    string val = aPICallerMaster.ApiCallingforPost(uri, body);
                    if (val != null)
                    {

                        dynamic user = JsonConvert.DeserializeObject(val);

                        userInfo.user_id = user.user_id;
                        userInfo.name = user.name;
                        userInfo.department = user.department;
                        userInfo.expiry_date = user.expiry_date;
                        userInfo.card_NFC = user.phone;
                        txtbxDiuCardId.Text = user.card_NFC;
                        txtbxStudentID.Text = user.user_id;
                        txtbxStudentName.Text = user.name;
                        txtbxDeptName.Text = user.department;
                        string str1 = user.expiry_date;
                        DateTime dt = Convert.ToDateTime(str1);
                        string expireTime = Lumex.Tech.LumexLibraryManager.ParseAppDateTime(str1);
                        txtbExpireDate.Text = dt.ToString("dd/M/yyyy");
                        userInfos.Add(userInfo);

                        txtbxIssueDate.Text = DateTime.Now.ToString("dd/M/yyyy");
                        //   dataGridView1.DataSource = userInfos;

                        if (txtbxStudentName.Text == "")
                        {
                            msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "No Data Found for this ID.";

                        }



                    }

                    else
                    {
                        msgbox.Visible = true; msgTitleLabel.Text = "Warning!!!"; msgDetailLabel.Text = "Something went wrong.";

                    }
                }
            }
            catch
            {
                msgbox.Visible = true; msgTitleLabel.Text = "Validation!!!"; msgDetailLabel.Text = "Something went wrong.";

            }


        }

        protected void addStudentCardToDeviceButton_Click(object sender, EventArgs e)
        {
            LinkButton Btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)Btn.NamingContainer;

            try
            {

                hdnFldSerial.Value = StudentListGridView.Rows[row.RowIndex].Cells[1].Text;
                StudentBLL studentbll = new StudentBLL();
                //studentbll.SerialNo = hdnFldSerial.Value;
                studentbll.StudentId = StudentListGridView.Rows[row.RowIndex].Cells[1].Text;
                //studentbll.DefaultZone = StudentListGridView.Rows[row.RowIndex].Cells[4].Text;
                //studentbll.IcCard= StudentListGridView.Rows[row.RowIndex].Cells[6].Text;
                //studentbll.CreatedDate = StudentListGridView.Rows[row.RowIndex].Cells[7].Text;
                //studentbll.CardExpire = StudentListGridView.Rows[row.RowIndex].Cells[8].Text;
                int execute = studentbll.addStudentCardToDeviceByZone();
                if (execute > 0)
                {
                    //Delete From Device Also
                    string message = " <span class='actionTopic'>" + "Card Added to Device Successfully</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/studentInfo.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                }
                else
                {
                    string message = " <span class='actionTopic'>" + "Sorry. Something is going wrong. Try later.</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/studentInfo.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");

                }


            }
            catch (Exception ex)
            {

                string message = ex.Message;
                if (ex.InnerException != null) { message += " --> " + ex.InnerException.Message; }
                MyAlertBox("ErrorAlert(\"" + ex.GetType() + "\", \"" + message + "\", \"\");");
            }
        }

        protected void removeStudentCardfromDeviceButton_Click(object sender, EventArgs e)
        {
            LinkButton Btn = (LinkButton)sender;
            GridViewRow row = (GridViewRow)Btn.NamingContainer;

            try
            {

                hdnFldSerial.Value = StudentListGridView.Rows[row.RowIndex].Cells[1].Text;
                StudentBLL studentbll = new StudentBLL();
                //studentbll.SerialNo = hdnFldSerial.Value;
                studentbll.StudentId = StudentListGridView.Rows[row.RowIndex].Cells[1].Text;
                //studentbll.DefaultZone = StudentListGridView.Rows[row.RowIndex].Cells[4].Text;
                //studentbll.IcCard= StudentListGridView.Rows[row.RowIndex].Cells[6].Text;
                //studentbll.CreatedDate = StudentListGridView.Rows[row.RowIndex].Cells[7].Text;
                //studentbll.CardExpire = StudentListGridView.Rows[row.RowIndex].Cells[8].Text;
                int execute = studentbll.unSyncStudentFromManageQueue();
                if (execute > 0)
                {
                    //Delete From Device Also
                    string message = " <span class='actionTopic'>" + "Student Card removed from Device Successfully</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/studentInfo.aspx\"; }; SuccessAlert(\"" + "Process Succeed" + "\", \"" + message + "\", callbackOk);");

                }
                else
                {
                    string message = " <span class='actionTopic'>" + "Sorry. Something is going wrong. Try later.</span>.";
                    MyAlertBox("var callbackOk = function () { window.location = \"/ui/studentInfo.aspx\"; }; WarningsAlert(\"" + "Process Failed" + "\", \"" + message + "\", callbackOk);");

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