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

namespace RstMgn.Admin
{
    public partial class LandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Username"]==null)
            {
                Response.Redirect("/Login.aspx");
            }
            LblUser.Text = Session["Username"].ToString();
        }

        protected void Btn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/Login.aspx");
        }
    }
}