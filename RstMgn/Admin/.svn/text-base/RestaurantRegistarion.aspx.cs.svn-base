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
using System.Data.SqlClient;
using System.Configuration;
using RstMgn.Constants;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using System.Text;

namespace RstMgn.Admin
{
    public partial class RestaurantRegistarion : System.Web.UI.Page
    {
        string Address = ConfigurationManager.ConnectionStrings["LOGIN"].ConnectionString;
        public static string requestID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("/Login.aspx");
                }

                using (SqlConnection Connection = new SqlConnection(Address))
                {
                    //Query to select location from a given city
                    using (SqlCommand cmd = new SqlCommand(SQLQuery.Restaurant))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = Connection;
                        Connection.Open();
                        SqlDataReader ReadFromTable = cmd.ExecuteReader();
                        GridRestaurant.DataSource = ReadFromTable;
                        GridRestaurant.DataBind();
                    }
                }

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
                LstBxLocation.Items.Insert(0, new ListItem("--Select Location--", "0"));
            }

        }

        //protected void DropDownCity_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    using (SqlConnection Connection = new SqlConnection(Address))
        //    {
        //        //Query to select location from a given city
        //        using (SqlCommand cmd = new SqlCommand(SQLQuery.Location))
        //        {
        //            cmd.CommandType = CommandType.Text;
        //            cmd.Connection = Connection;
        //            cmd.Parameters.AddWithValue("@City", LstBxCity.SelectedItem.Text);
        //            Connection.Open();
        //            LstBxLocation.DataSource = cmd.ExecuteReader();
        //            LstBxLocation.DataTextField = "Location";
        //            LstBxLocation.DataValueField = "Location";
        //            LstBxLocation.DataBind();
        //        }
        //    }
        //    //Value of the list at data value 0
        //    LstBxLocation.Items.Insert(0, new ListItem("--Select Location--", "0"));
        //}

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            //To check if any of the textbox is not left blank
            if (TxtBxName.Text.Trim() == "" || TxtBxReviews.Text.Trim() == "")
            {
                LblStatus.Text = Constants.Constants.Enter_All_Details;
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Visible = true;
                return;
            }
            int n;
            bool isNumeric = int.TryParse(TxtBxReviews.Text, out n);
            if (!isNumeric)
            {
                LblStatus.Text = "Please enter an integer value less than 5 in Reviews";
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Visible = true;
                return;
            }

            if (Int32.Parse(TxtBxReviews.Text) > 5)
            {
                LblStatus.Text = "Please enter an integer value less than 5 in Reviews";
                LblStatus.ForeColor = System.Drawing.Color.Red;
                LblStatus.Visible = true;
                return;
            }
            #region ConstantsDeclartions
            string Veg = "", NonVeg = "", Offers = "";

            if (ChkBxVeg.Checked)
            {
                Veg = "Yes";
            }
            else Veg = "No";

            if (ChkBxNonVeg.Checked)
            {
                NonVeg = "Yes";
            }
            else NonVeg = "No";

            if (ChkbxOffers.Checked)
            {
                Offers = "Yes";
            }
            else Offers = "No";
            #endregion

            InsertData(Address, TxtBxName.Text.Trim(), Veg, NonVeg, Offers, LstBxLocation.DataTextField.Trim(), LstBxCity.DataTextField.Trim(), Int32.Parse(TxtBxReviews.Text));
            LblStatus.Text = Constants.Constants.Details_Added_Successfully;
            LblStatus.ForeColor = System.Drawing.Color.Green;
            LblStatus.Visible = true;
        }
        public void GridSelection_Click(object sender, EventArgs e)
        {
            string requestVeg = null;
            string requestCity = null;
            string requestLocation = null;
            string requestNonveg = null;
            string requestReviews = null;
            string requestOffers = null;

            var lb = (LinkButton)sender;
            var row = (GridViewRow)lb.NamingContainer;
            if (row != null)
            {
                var lblRequestorId = row.FindControl("ID") as Label;
                var lblRequestorVeg = row.FindControl("Veg") as Label;
                var lblRequestorNonveg = row.FindControl("Nonveg") as Label;
                var lblRequestorReviews = row.FindControl("Reviews") as Label;
                var lblRequestorOffers = row.FindControl("Offers") as Label;
                var lblRequestorLocation = row.FindControl("Location") as Label;
                var lblRequestorCity = row.FindControl("City") as Label;


                if (lblRequestorId != null || lblRequestorVeg != null || lblRequestorNonveg != null || lblRequestorReviews != null || lblRequestorOffers != null || lblRequestorLocation != null || lblRequestorCity != null)
                {
                    requestID = lblRequestorId.Text;
                    requestVeg = lblRequestorVeg.Text;
                    requestCity = lblRequestorCity.Text;
                    requestLocation = lblRequestorLocation.Text;
                    requestNonveg = lblRequestorNonveg.Text;
                    requestReviews = lblRequestorReviews.Text;
                    requestOffers = lblRequestorOffers.Text;
                }

            }
            ScriptManager.RegisterStartupScript(this, GetType(), "Show Modal Popup", "showmodalpopup();", true);
            LblRestaurantName.Text = ((LinkButton)sender).Text;

            NonvegImg.ImageUrl = "";
            VegImg.ImageUrl = "";
            RadioBtnNonveg.Visible = true;
            RadioBtnVeg.Visible = true;
            if (requestNonveg == "Yes" && requestVeg == "No")
            {
                NonvegImg.ImageUrl = "../Images/non-veg_small.jpg";
                RadioBtnVeg.Visible = false;
            }

            if (requestVeg == "Yes" && requestNonveg == "No")
            {
                VegImg.ImageUrl = "../Images/veg_small.jpg";
                RadioBtnNonveg.Visible = false;
            }

            if (requestVeg == "Yes" && requestNonveg == "Yes")
            {
                NonvegImg.ImageUrl = "../Images/non-veg_small.jpg";
                VegImg.ImageUrl = "../Images/veg_small.jpg";
            }

            LblCity.Text = requestCity;
            LblLocation.Text = requestLocation;
            LblOffers.Text = requestOffers;
            LblReviews.Text = requestReviews;
        }

        protected void BtnAddRestaurant_Click(object sender, EventArgs e)
        {
            bool selectedType = false;
            if (RadioBtnVeg.Checked)
            {
                selectedType = false;
            }
            if (RadioBtnNonveg.Checked)
            {
                selectedType = true;
            }
            using (SqlConnection Connection = new SqlConnection(Address))
            {
                using (SqlCommand cmd = new SqlCommand(SQLQuery.Dish_Insert))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = Connection;
                    cmd.Parameters.AddWithValue("@id", requestID);
                    cmd.Parameters.AddWithValue("@item", TxtDish.Text);
                    cmd.Parameters.AddWithValue("@price", TxtPrice.Text);
                    cmd.Parameters.AddWithValue("@itemtype", selectedType);
                    Connection.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            LblRestaurantAdded.Text = Constants.Constants.Added_Restaurant_Constant;
            LblRestaurantAdded.ForeColor = System.Drawing.Color.Green;
            LblRestaurantAdded.Visible = true;
        }

        private void InsertData(string connection, string name, string veg, string nonveg, string offers, string location, string city, int reviews)
        {
            string query = SQLQuery.Insert;
            using (SqlConnection Connection = new SqlConnection(connection))
            {
                using (SqlCommand cmd = new SqlCommand(query, Connection))
                {
                    cmd.Parameters.AddWithValue("@name", name);
                    cmd.Parameters.AddWithValue("@veg", veg);
                    cmd.Parameters.AddWithValue("@nonveg", nonveg);
                    cmd.Parameters.AddWithValue("@offers", offers);
                    cmd.Parameters.AddWithValue("@location", location);
                    cmd.Parameters.AddWithValue("@city", city);
                    cmd.Parameters.AddWithValue("@reviews", reviews);

                    Connection.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        [System.Web.Services.WebMethod()]
        public static string[] testFunction(string id)
        {
            List<string> Location = new List<string>();
            string str = string.Empty;
            using (SqlConnection Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["LOGIN"].ConnectionString))
            {
                //Query to select location from a given city
                using (SqlCommand cmd = new SqlCommand(SQLQuery.Location))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = Connection;
                    cmd.Parameters.AddWithValue("@City", id);
                    Connection.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach (DataRow dtrow in dt.Rows)
                    {
                        Location.Add(dtrow["Location"].ToString());
                        //str = str + dtrow[0].ToString()+",";
                    }

                }
            }
            return Location.ToArray();
        }

        //[System.Web.Services.WebMethod()]
        //public static string ConvertStringListToJavascriptArrayString(List<string> list)
        //{
        //    StringBuilder stringBuilder = new StringBuilder();
        //    stringBuilder.Append("[");
        //    if (null != list && 0 < list.Count)
        //    {
        //        bool showSeperator = false;
        //        foreach (string word in list)
        //        {
        //            if (showSeperator)
        //            {
        //                stringBuilder.Append(",");
        //            }
        //            stringBuilder.AppendFormat("\"{0}\"", word);
        //            showSeperator = true;
        //        }
        //    }
        //    stringBuilder.Append("]");
        //    return stringBuilder.ToString();
        //}
    }
}