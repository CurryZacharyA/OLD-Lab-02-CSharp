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

public partial class DriverPage : System.Web.UI.Page {
    SqlDataReader myReader = null;
    string sqlQuery;
    static DateTime today = DateTime.Today;
    static int? identityBookmark = null;
    Driver myDriver;


    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack)
            loadContractors();
        if (!IsPostBack)
            LoadStates();
        if (!IsPostBack)
            LoadCountries();
        

        dateVal25YearsOld.ValueToCompare = today.AddYears(-25).AddDays(1).ToString("MM/dd/yyyy");
        dateVal75YearsOld.ValueToCompare = today.AddYears(-75).ToString("MM/dd/yyyy");
        dateValTodayCDLExperation.ValueToCompare = today.ToString("MM/dd/yyyy");

        if (identityBookmark == null) {
            try {
                sqlQuery = (
                    "SELECT TOP 1 DriverID " +
                    "FROM Driver " +
                    "ORDER BY DriverID DESC;");
                Master.sendDBCommand(sqlQuery);
                myReader = Master.getSqlCommand.ExecuteReader();

                if (myReader.HasRows)
                    while (myReader.Read()) {
                        identityBookmark = (Convert.ToInt32(myReader["DriverID"]) + 1);
                        tbDDriverID.Text = identityBookmark.ToString();
                    }
                else if (identityBookmark == null)
                    tbDDriverID.Text = "1";
                else tbDDriverID.Text = identityBookmark.ToString();
                Master.closeDB();
            }
            catch (Exception) {
                Master.DisplayOnMaster.Text = "Error Selecting DriverID from database";
            }
        }
        else tbDDriverID.Text = identityBookmark.ToString();
    }

    protected Boolean checkForSameDriverName(){
        //check database for exact match of concatenated name
        try{
            sqlQuery = "SELECT FIRSTNAME, LASTNAME, MIDDLEINITIAL FROM DRIVER";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();

            while (myReader.Read()) {
                String dbNameConcatenated = null;
                String tfNameConcatenated = null;
                
                dbNameConcatenated = myReader["FirstName"].ToString().ToUpper();
                if (myReader["MiddleInitial"].ToString() != "")
                    dbNameConcatenated += " " + myReader["MiddleInitial"].ToString().ToUpper();
                dbNameConcatenated += " " + myReader["LastName"].ToString().ToUpper();

                tfNameConcatenated = tbDFirstName.Text.ToUpper();
                if (tbDMI.Text != "")
                    tfNameConcatenated += " " + tbDMI.Text.ToUpper();
                tfNameConcatenated += " " + tbDLastName.Text.ToUpper();

                if (dbNameConcatenated == tfNameConcatenated)
                    return true;
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error Selecting DriverID from database";
        }
        return false;
    }

    protected void btnDCommit_Click(object sender, EventArgs e) {
        Master.DisplayOnMaster.Text = "Insert to db Successfull";
        if (checkForSameDriverName()) {
            //Alert "Driver Name unique"
            Master.DisplayOnMaster.Text = "Driver Name Must be Unique" + Environment.NewLine +
                "Please insert a unique Driver Name";
        }
        else {
            try {
                myDriver = new Driver(
                    tbDDriverID.Text,
                    tbDFirstName.Text,
                    tbDLastName.Text,
                    tbDMI.Text,
                    tbDHouseNumber.Text,
                    tbDStreet.Text,
                    tbDCityCounty.Text,
                    ddDState.SelectedItem.Text.Substring(0, 2),
                    ddDCountry.SelectedItem.Text.Substring(0, 2),
                    tbDZipCode.Text,
                    tbDDOB.Text,
                    tbDCDL.Text,
                    tbDCDLExperationDate.Text,
                    "Zachary Curry",
                    Master.getCurrentTimestamp(),
                    ddDContractor.SelectedItem.Text.Substring(0,
                        ddDContractor.SelectedItem.Text.IndexOf(" ")),
                    tbDHireDate.Text,
                    tbDTerminationDate.Text,
                    tbDSalary.Text);

                insertDriverIntoDB();
                identityBookmark++;
                tbDDriverID.Text = identityBookmark.ToString();
                tbDFirstName.Focus();
            }
            catch (Exception) {
                Master.DisplayOnMaster.Text = "Error adding Driver to database";
            }
        }
    }

    protected void LoadStates() {
        ddDState.Items.Clear();
        try {
            sqlQuery = "SELECT StateAbb, StateName " +
                    "FROM HomeState;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddDState.Items.Add(new ListItem("  "));

            while (myReader.Read()) {
                ddDState.Items.Add(new ListItem(myReader["StateAbb"] + " - " + myReader["StateName"]));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating State dd from database";
        }
    }

    protected void LoadCountries() {
        ddDCountry.Items.Clear();
        try {
            sqlQuery = "SELECT CountryAbb, CountryName " +
                    "FROM Country;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddDCountry.Items.Add(new ListItem("  "));

            while (myReader.Read()) {
                ddDCountry.Items.Add(new ListItem(myReader["CountryAbb"] + " - " + myReader["CountryName"]));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating Country dd from database";
        }
    }

    protected void loadContractors() {
        ddDContractor.Items.Clear();
        try {
            sqlQuery = "SELECT ContractorID, FirstName, MiddleInitial, LastName " +
                    "FROM Contractor;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddDContractor.Items.Add(new ListItem("Please select"));

            while (myReader.Read()) {
                String contractorFullName = "";
                contractorFullName = myReader["FirstName"].ToString();
                if (myReader["MiddleInitial"].ToString() != "")
                    contractorFullName += " " + myReader["MiddleInitial"].ToString();
                contractorFullName += " " + myReader["LastName"].ToString();

                ddDContractor.Items.Add(new ListItem(myReader["ContractorID"] + " - " + contractorFullName));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating Contractor dd from database";
        }
    }

    protected void insertDriverIntoDB() {
        //Format a SQL Statement to insert Driver Values
        sqlQuery = "INSERT INTO DRIVER VALUES(";
        sqlQuery += checkForApostrophe(myDriver.getFirstName()) + ", ";
        sqlQuery += checkForApostrophe(myDriver.getLastName()) + ", ";
        sqlQuery += myDriver.getMiddleInitial() + ", ";
        sqlQuery += myDriver.getHouseNumber() + ", ";
        sqlQuery += checkForApostrophe(myDriver.getStreet()) + ", ";
        sqlQuery += checkForApostrophe(myDriver.getCityCounty()) + ", ";
        sqlQuery += myDriver.getStateAbb() + ", ";
        sqlQuery += myDriver.getCountryAbb() + ", ";
        sqlQuery += myDriver.getZipCode() + ", ";
        sqlQuery += myDriver.getDateOfBirth() + ", ";
        sqlQuery += checkForApostrophe(myDriver.getCDL()) + ", ";
        sqlQuery += myDriver.getCDLDate() + ", ";
        sqlQuery += myDriver.getLastUpdatedBy() + ", ";
        sqlQuery += myDriver.getLastUpdated() + ")";
        Master.sendDBCommand(sqlQuery);
        Master.closeDB();

        //Format a SQL Statement to insert DriverContractor Values
        sqlQuery = "INSERT INTO DRIVERCONTRACTOR VALUES(";
        sqlQuery += myDriver.getContractorID() + ", ";
        sqlQuery += myDriver.getDriverID() + ", ";
        sqlQuery += myDriver.getHireDate() + ", ";
        sqlQuery += myDriver.getTerminationDate() + ", ";
        sqlQuery += myDriver.getSalary() + ", ";
        sqlQuery += myDriver.getLastUpdatedBy() + ", ";
        sqlQuery += myDriver.getLastUpdated() + ")";
        Master.sendDBCommand(sqlQuery);
        Master.closeDB();

        //reset myDriver object
        myDriver.reset();
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