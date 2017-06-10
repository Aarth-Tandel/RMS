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
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace RstMgn
{
    #region CitySelection   
    public partial class Dashboard : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                //To store the user name and dispay it in the webform
                LblUser.Text = Session["Username"].ToString();
                //Takes the connection string from the web config and stores it in Address string
                string Address = ConfigurationManager.ConnectionStrings["LOGIN"].ConnectionString;

                //This block is used to populate the menu list according to the database
                using (SqlConnection Connection = new SqlConnection(Address))
                {
                    //Query to select Cities
                    using (SqlCommand cmd = new SqlCommand(Constants.SQLQuery.City))
                    {
                        //Mode through which the commands will be implemented on SQL Server
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = Connection;
                        Connection.Open();
                        LstBxCity.DataSource = cmd.ExecuteReader();
                        LstBxCity.DataTextField = "City";
                        LstBxCity.DataValueField = "City";
                        LstBxCity.DataBind();
                    }
                }
                //Value of the list at data value 0
                LstBxCity.Items.Insert(0, new ListItem("--Select City--", "0"));
                LstBxLocation.Items.Insert(0, new ListItem("--Select City--", "0"));
            }
        }
        #endregion

        #region LocationSelection
        /// <summary>
        /// Polulates the location drop down list according to the city selected
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DropDownCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Address = ConfigurationManager.ConnectionStrings["LOGIN"].ConnectionString;
            using (SqlConnection Connection = new SqlConnection(Address))
            {
                //Query to select location from a given city
                using (SqlCommand cmd = new SqlCommand(Constants.SQLQuery.Location))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = Connection;
                    cmd.Parameters.AddWithValue("@City", LstBxCity.SelectedItem.Text);
                    Connection.Open();
                    LstBxLocation.DataSource = cmd.ExecuteReader();
                    LstBxLocation.DataTextField = "Location";
                    LstBxLocation.DataValueField = "Location";
                    LstBxLocation.DataBind();
                }
            }
            //Value of the list at data value 0
            LstBxLocation.Items.Insert(0, new ListItem("--Select Location--", "0"));
        }
        #endregion

        #region Restaurants
        /// <summary>
        /// Shows the gridview conetents according to the city and location selected.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DropDownLocation_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Address = ConfigurationManager.ConnectionStrings["LOGIN"].ConnectionString;
            using (SqlConnection Connection = new SqlConnection(Address))
            {
                //Restaurants available according to given constrains
                using (SqlCommand cmd = new SqlCommand(Constants.SQLQuery.Grid))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = Connection;
                    cmd.Parameters.AddWithValue("@City", LstBxCity.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Location", LstBxLocation.SelectedItem.Text);
                    Connection.Open();
                    SqlDataReader ReadFromTable = cmd.ExecuteReader();
                    GridRestaurants.DataSource = ReadFromTable;
                    GridRestaurants.DataBind();
                }
            }
        }
        #endregion

        #region RestaurantSelected
        /// <summary>
        /// redirects the user to the next webform. When user selects a option from the list
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridSelection_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Details.aspx?Restaurant=" + ((LinkButton)sender).Text);
        }
        #endregion

        #region Logout
        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
        #endregion
    }
}