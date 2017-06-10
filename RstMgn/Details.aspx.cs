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
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace RstMgn
{
    public partial class Details : System.Web.UI.Page
    {
        #region RestaurantDetails
        /// <summary>
        /// Loads the restaurants details
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                //Uses restaurant name from the query string passed on from the previous URL
                string RestaurantName = Request.QueryString["Restaurant"];
                LblName.Text = RestaurantName;
                string Veg = "", NonVeg = "";
                //Takes the connection string from the web config
                string Address = ConfigurationManager.ConnectionStrings["LOGIN"].ConnectionString;
                using (SqlConnection Connection = new SqlConnection(Address))
                {
                    using (SqlCommand cmd = new SqlCommand(Constants.SQLQuery.Select_Restaurant))
                    {

                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = Connection;
                        Connection.Open();
                        cmd.Parameters.AddWithValue("@Rest", LblName.Text);
                        //Reads the required data from the data base and display's them
                        SqlDataReader sqlReader = cmd.ExecuteReader();
                        while (sqlReader.Read())
                        {
                            LblLocation.Text = sqlReader.GetValue(0).ToString();
                            Veg = sqlReader.GetValue(1).ToString();
                            NonVeg = sqlReader.GetValue(2).ToString();
                            LblReview.Text = sqlReader.GetValue(3).ToString() + "/5";
                        }
                        Connection.Close();
                    }

                    //Display's menu according to the menu type available
                    if (Veg == "Yes" && NonVeg == "No")
                    {
                        SQLconnections(Veg, NonVeg, Constants.SQLQuery.Select_Veg, Address);
                    }

                    //Display's menu according to the menu type available
                    else if (Veg == "Yes" && NonVeg == "Yes")
                    {
                        SQLconnections(Veg, NonVeg, Constants.SQLQuery.Select_Nonveg_Veg, Address);
                    }

                    //Display's menu according to the menu type available
                    else if (Veg == "No" && NonVeg == "Yes")
                    {
                        SQLconnections(Veg, NonVeg, Constants.SQLQuery.Select_Nonveg, Address);
                    }
                }
            }
        }
        #endregion

        public void SQLconnections(string veg, string nonveg, string query, string Address)
        {
            using (SqlConnection connection = new SqlConnection(Address))
            {
                //Selects query accourding to conditions
                using (SqlCommand menuCmd = new SqlCommand(query))
                {
                    menuCmd.CommandType = CommandType.Text;
                    menuCmd.Connection = connection;
                    connection.Open();
                    menuCmd.Parameters.AddWithValue("@Rest", LblName.Text);
                    SqlDataReader ReadFromTable = menuCmd.ExecuteReader();
                    GridMenu.DataSource = ReadFromTable;
                    GridMenu.DataBind();
                }
            }
        }
        #region Logout
        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
        #endregion

        #region Back
        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }
        #endregion
    }
}