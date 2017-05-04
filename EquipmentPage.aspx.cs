using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/*
Zachary Curry

On my honor, I have neither given nor received any unauthorized assistance on
this academic work
*/

public partial class EquipmentPage : System.Web.UI.Page {
    SqlDataReader myReader = null;
    string sqlQuery;
    Equipment myEquipment;
    static int? identityBookmark = null;

    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack)
            loadDrivers();

        if (identityBookmark == null) {
            try {
                sqlQuery = (
                    "SELECT TOP 1 ID " +
                    "FROM Equipment " +
                    "ORDER BY ID DESC;");
                Master.sendDBCommand(sqlQuery);
                myReader = Master.getSqlCommand.ExecuteReader();

                if (myReader.HasRows)
                    while (myReader.Read()) {
                        identityBookmark = (Convert.ToInt32(myReader["ID"]) + 1);
                        tbEEquipmentID.Text = identityBookmark.ToString();
                    }
                else if (identityBookmark == null)
                    tbEEquipmentID.Text = "1";
                else tbEEquipmentID.Text = identityBookmark.ToString();
                Master.closeDB();
            }
            catch (Exception) {
                Master.DisplayOnMaster.Text = "Error Selecting EquipmentID from database";
            }
        }
        else tbEEquipmentID.Text = identityBookmark.ToString();
    }

    protected void loadDrivers() {
        ddEDriver.Items.Clear();
        try {
            sqlQuery = "SELECT DriverID, FirstName, MiddleInitial, LastName " +
                    "FROM Driver;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddEDriver.Items.Add(new ListItem("Please select"));

            while (myReader.Read()) {
                String driverFullName = "";
                driverFullName = myReader["FirstName"].ToString();
                if (myReader["MiddleInitial"].ToString() != "")
                    driverFullName += " " + myReader["MiddleInitial"].ToString();
                driverFullName += " " + myReader["LastName"].ToString();

                ddEDriver.Items.Add(new ListItem(myReader["DriverID"] + " - " + driverFullName));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating Driver dd from database";
        }
    }

    protected void insertEquipmentIntoDB() {
        //Format a SQL Statement to insert Equipment Values
        sqlQuery = "INSERT INTO EQUIPMENT VALUES(";
        sqlQuery += checkForApostrophe(myEquipment.getVinNumber()) + ", ";
        sqlQuery += checkForApostrophe(myEquipment.getMake()) + ", ";
        sqlQuery += checkForApostrophe(myEquipment.getModel()) + ", ";
        sqlQuery += myEquipment.getEquipmentYear() + ", ";
        sqlQuery += myEquipment.getPriceAcquired() + ", ";
        sqlQuery += checkForApostrophe(myEquipment.getLicenseNumber()) + ", ";
        sqlQuery += myEquipment.getDriverID() + ", ";
        sqlQuery += myEquipment.getLastUpdatedBy() + ", ";
        sqlQuery += myEquipment.getLastUpdated() + ")";
        Master.sendDBCommand(sqlQuery);
        Master.closeDB();
        
        //reset myEquipment object
        myEquipment.reset();
    }

    protected void btnECommit_Click(object sender, EventArgs e) {
        Master.DisplayOnMaster.Text = "Insert to db Successfull";
        if (checkForSameVin()) {
            //Alert "Vin unique"
            Master.DisplayOnMaster.Text = "Vin Number Must be Unique" + Environment.NewLine +
                "Please insert a unique Vin";
        }
        else {
            try {
                myEquipment = new Equipment(
                    tbEEquipmentID.Text,
                    tbEVin.Text,
                    tbEMake.Text,
                    tbEModel.Text,
                    tbEYear.Text,
                    tbEPriceAcquired.Text,
                    tbELicensePlate.Text,
                    ddEDriver.SelectedItem.Text.Substring(0,
                        ddEDriver.SelectedItem.Text.IndexOf(" ")),
                    "Zachary Curry",
                    Master.getCurrentTimestamp());
                insertEquipmentIntoDB();
                identityBookmark++;
                tbEEquipmentID.Text = identityBookmark.ToString();
                tbEVin.Focus();
            }
            catch (Exception) {
                Master.DisplayOnMaster.Text = "Error inserting data to database";
            }
        }
    }

    protected Boolean checkForSameVin() {
        //check database for exact match of equipment vin number
        try{
            sqlQuery = "SELECT VINNUMBER FROM EQUIPMENT";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();

            while (myReader.Read()) {
                String dbVinPlaceholder = null;
                String tfVinPlaceholder = null;
                dbVinPlaceholder = myReader["VINNUMBER"].ToString().ToUpper();
                
                tfVinPlaceholder = tbEVin.Text.ToUpper();

                if (tfVinPlaceholder == dbVinPlaceholder)
                    return true;
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error Selecting Vin from database";
        }
        return false;
    }

    protected String checkForApostrophe(String str) {
        String temp = str;
        if (str != "NULL") {
            temp = "'";
            for (int i = 1; i < str.Length - 1; i++) {
                if (str.Substring(i, 1) == "\'")
                    temp += "'";
                temp += str.Substring(i, 1);
            }
            temp += "'";
        }
        return temp;
    }
}