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
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using RstMgn.Constants;

namespace RstMgn.Admin
{
    public partial class UserRegistraion : System.Web.UI.Page
    {
        string Address = ConfigurationManager.ConnectionStrings["LOGIN"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("/Login.aspx");
            }
            using (SqlConnection Connection = new SqlConnection(Address))
            {
                //Query to select location from a given city
                using (SqlCommand cmd = new SqlCommand(Constants.SQLQuery.User))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = Connection;
                    Connection.Open();
                    SqlDataReader ReadFromTable = cmd.ExecuteReader();
                    GridUser.DataSource = ReadFromTable;
                    GridUser.DataBind();
                }
            }
        }


        protected void BtnAdd_Click(object sender, EventArgs e)
        {

            if(TxtUsername.Text.Trim() == "" || TxtPassword.Text.Trim() == "" || TxtRePasword.Text.Trim() == "" )
            {
                LblStatus.Text = Constants.Constants.Enter_All_Details;
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Visible = true;
                return;
            }

            if(!(CheckUser(TxtUsername.Text)))
            {
                LblStatus.Text = Constants.Constants.User_Exits;
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Visible = true;
                return;
            }

            InsertData(Address, TxtUsername.Text.Trim(), TxtPassword.Text.Trim());
            LblStatus.Text = Constants.Constants.User_Added_Successfully;
            LblStatus.ForeColor = System.Drawing.Color.Green;
            LblStatus.Visible = true;
        }

        private bool CheckUser(string Username)
        {
            string Address = ConfigurationManager.ConnectionStrings["LOGIN"].ConnectionString;

            using (SqlConnection Connection = new SqlConnection(Address))
            {
                SqlCommand cmd = new SqlCommand("spCheckUser", Connection);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramUsername = new SqlParameter("@Username", Username);
                //Passing the parameters
                cmd.Parameters.Add(paramUsername);
                Connection.Open();
                //type casting to int 
                int ReturnCode = (int)cmd.ExecuteScalar();
                return ReturnCode == 1;
            }
        }

        private void InsertData(string connection, string name, string password)
        {
            string query = SQLQuery.Insert_User;

            using (SqlConnection Connection = new SqlConnection(connection))
            {
                using (SqlCommand cmd = new SqlCommand(query, Connection))
                {
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@password", password);

                    Connection.Open();
                    cmd.ExecuteNonQuery();
                    Connection.Close();
                }
            }
        }
    }

}