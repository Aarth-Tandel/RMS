/***************************************************************************
* File Name : Restaurant Managment
* Author : Aarth Tandel
* Date of Creation : 11/ 03 / 2017
* Revision History :
* ____________________________________________________________________________
* 17 / 08 / 2017  Aarth Tandel 
* ____________________________________________________________________________
* 17 / 08 / 2017 Version 1.0
* 21 / 08 / 2017 Version 2.0
* 24 / 08 / 2017 Version 3.0
* 28 / 08 / 2017 Version 4.0
* 30 / 08 / 2017 Version 5.0
* ____________________________________________________________________________
*
*****************************************************************************/
using System;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace RstMgn
{
    public partial class Login : System.Web.UI.Page
    {
      
        #region LoginFunctions
        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            //Takes the connection string from the web config and stores it in Address string
            string Address = ConfigurationManager.ConnectionStrings["LOGIN"].ConnectionString;
            string userType = "";
            using (SqlConnection Connection = new SqlConnection(Address))
            {
                using(SqlCommand cmd = new SqlCommand(Constants.SQLQuery.Authenticate))
                {
                    //Specifing how the way in which the command is written in sql data server
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = Connection;
                    Connection.Open();
                    cmd.Parameters.AddWithValue("@user", txtUseraName.Text);
                    //Authenticating the user with sql database data
                    Session["Username"] = txtUseraName.Text;
                    if (AuthenticatUser(txtUseraName.Text, txtPassword.Text))
                    {
                        //Checking the user type if admin or not
                        userType = cmd.ExecuteScalar().ToString();
                        if (userType == "True")
                        {

                            Response.Redirect("~/Admin/Admin.aspx");
                        }
                        else
                        {
                            //For authentication was used to block the unauthorized users.
                            FormsAuthentication.RedirectFromLoginPage(txtUseraName.Text, RememberCheckBox.Checked);
                        }
                    }
                    else
                    {
                        LblLoginStatus.Text = Constants.Constants.Username_Invalid_Constatnt;
                        LblLoginStatus.ForeColor = System.Drawing.Color.Red;
                        LblLoginStatus.Visible = true;
                    }
                }
            }
        }
        #endregion
        #region Authentication
        /// <summary>
        /// This class returns if the user is valid according to database.
        /// </summary>
        /// <returns> a boolean true or false value if the user is present or not</returns>
        private bool AuthenticatUser(string Username , string Password)
        {
            //Procedure needs to be modified as this program is hitting the database twice
            string Address = ConfigurationManager.ConnectionStrings["LOGIN"].ConnectionString;

            using (SqlConnection Connection = new SqlConnection(Address))
            {
                SqlCommand cmd = new SqlCommand("spAuthenticateUser", Connection);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramUsername = new SqlParameter("@Username", Username);
                SqlParameter paramPassword = new SqlParameter("@Password", Password);
                //Passing the parameters
                cmd.Parameters.Add(paramUsername);
                cmd.Parameters.Add(paramPassword);
                Connection.Open();
                //type casting to int 
                int ReturnCode = (int)cmd.ExecuteScalar();
                return ReturnCode == 1;
            }
        }

    }
    #endregion
}