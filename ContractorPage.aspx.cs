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

public partial class ContractorPage : System.Web.UI.Page {
    SqlDataReader myReader = null;
    string sqlQuery;
    static int? identityBookmark = null;

    //Create Array
    static int arraySize = 3;
    static Contractor[] arrayContractor = new Contractor[arraySize];


    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack)
            LoadStates();
        if (!IsPostBack)
            LoadCountries();
        if (identityBookmark == null) {
            try {
                sqlQuery = (
                    "SELECT TOP 1 ContractorID " +
                    "FROM Contractor " +
                    "ORDER BY ContractorID DESC;");
                Master.sendDBCommand(sqlQuery);
                myReader = Master.getSqlCommand.ExecuteReader();

                if (myReader.HasRows)
                    while (myReader.Read()) {
                        identityBookmark = (Convert.ToInt32(myReader["ContractorID"]) + 1);
                        tbCContractorID.Text = identityBookmark.ToString();
                    }
                else if (identityBookmark == null)
                    tbCContractorID.Text = "1";
                else tbCContractorID.Text = identityBookmark.ToString();
                Master.closeDB();
            }
            catch (Exception) {
                Master.DisplayOnMaster.Text = "Error Selecting ContractorID from database";
            }
        }
        else tbCContractorID.Text = identityBookmark.ToString();
    }

    protected void btnCInsert_Click(object sender, EventArgs e) {
        Master.DisplayOnMaster.Text = "Insert Button Testing Passed";

        //Check to see if Contractor array last location is empty
        if (arrayContractor[arraySize - 1] != null) {
            Master.DisplayOnMaster.Text = "Contractor Array is Full!" + Environment.NewLine +
                "You must commit the Contractor Array before adding a new Contractor!";
        }
        //Check to see if the Contractor array is empty or has atleast one value
        else if (arrayContractor[0] != null) {
            for (int i = 0; i < arrayContractor.Length; i++) {
                //Check to see if current i location in Contractor Array is empty
                if (arrayContractor[i] != null) {
                    if (checkForSameContractorName()) {
                        //Alert "Contractor Name unique"
                        Master.DisplayOnMaster.Text = "Contractor Name Must be Unique" + Environment.NewLine +
                            "Please insert a unique Contractor Name";
                        break;
                    }
                    else {
                        assignContractorValues();
                        identityBookmark++;
                        tbCContractorID.Text = identityBookmark.ToString();
                        tbCFirstName.Focus();
                        break;
                    }
                }
            }
        }
        else {
            assignContractorValues();
            identityBookmark++;
            tbCContractorID.Text = identityBookmark.ToString();
            tbCFirstName.Focus();
        }
    }

    protected Boolean checkForSameContractorName() {
        String arrayNameConcatenated = null;
        String tfNameConcatenated = null;
        //concatenate names then compare to find exact match
        for (int i = 0; i < arrayContractor.Length - 1; i++) {
            if (arrayContractor[i] != null) {
                arrayNameConcatenated = arrayContractor[i].getFirstName().ToUpper();
                if (arrayContractor[i].getMiddleInitial() != "NULL")
                    arrayNameConcatenated += " " + arrayContractor[i].getMiddleInitial().ToUpper();
                arrayNameConcatenated += " " + arrayContractor[i].getLastName().ToUpper();

                tfNameConcatenated = tbCFirstName.Text.ToUpper();
                if (tbCMI.Text != "")
                    tfNameConcatenated += " " + tbCMI.Text.ToUpper();
                tfNameConcatenated += " " + tbCLastName.Text.ToUpper(); 
                if (arrayNameConcatenated == tfNameConcatenated)
                    return true;
            }
        }
        return false;
    }

    protected void assignContractorValues() {
        //Start at first free location in Contractor Array
        for (int i=0; i<arrayContractor.Length; i++){
            try{
                //Check to see if location is free, if not move to next location in array
                if (arrayContractor[i] == null){
                    //Create Contractor object in Contractor Array
                    arrayContractor[i] = new Contractor(
                        tbCContractorID.Text,
                        tbCFirstName.Text,
                        tbCLastName.Text,
                        tbCMI.Text,
                        tbCHouseNumber.Text,
                        tbCStreet.Text,
                        tbCCityCounty.Text,
                        ddCState.SelectedItem.Text.Substring(0, 2),
                        ddCCountry.SelectedItem.Text.Substring(0, 2),
                        tbCZipCode.Text,
                        tbCFee.Text,
                        "Zachary Curry",
                        Master.getCurrentTimestamp()
                        );
                    //Exit if loop when empty array qualifications are met
                    break;
                }
            }catch (Exception){
                Master.DisplayOnMaster.Text = "Problem adding to array";
            }
        }
    }

    protected void btnCCommit_Click(object sender, EventArgs e) {
        //Check first location in contractor array
        Master.DisplayOnMaster.Text = "Insert to db Successfull";
        if (arrayContractor[0] == null) {
            Master.DisplayOnMaster.Text = "Contractor Array Empty" + Environment.NewLine +
                "Please insert a contractor before Committing";
            tbCFirstName.Focus();
        }
        else {
            //Delete current Equipment Table
            sqlQuery = "DELETE FROM EQUIPMENT";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            Master.closeDB();
            //Delete current DriverContractor Table
            sqlQuery = "DELETE FROM DRIVERCONTRACTOR";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            Master.closeDB();
            //Delete current Driver Table
            sqlQuery = "DELETE FROM DRIVER";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            Master.closeDB();
            //Delete current Contractor Table
            sqlQuery = "DELETE FROM CONTRACTOR";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            Master.closeDB();
            //For every object in Contractor array, add to Contractor Table in database
            for (int i = 0; i < arrayContractor.Length; i++) {
                if (arrayContractor[i] != null) {
                    try {
                        insertContractorValuesIntoDB(i);
                        Master.closeDB();
                    }
                    catch (Exception) { 
                        Master.DisplayOnMaster.Text = "Error inserting data to database";
                    }
                }
            }
         //   driverContractorList.clear();
        //    equipmentDriverList.clear();
        }
    }

    protected void insertContractorValuesIntoDB(int i) {
        //Set up Contractor Array Values into SQL language
        //in order to insert into the Contractor Table in the Database
        sqlQuery = "INSERT INTO CONTRACTOR VALUES(";
        sqlQuery += checkForApostrophe(arrayContractor[i].getFirstName()) + ", ";
        sqlQuery += checkForApostrophe(arrayContractor[i].getLastName()) + ", ";
        sqlQuery += arrayContractor[i].getMiddleInitial() + ", ";
        sqlQuery += arrayContractor[i].getHouseNumber() + ", ";
        sqlQuery += checkForApostrophe(arrayContractor[i].getStreet()) + ", ";
        sqlQuery += checkForApostrophe(arrayContractor[i].getCityCounty()) + ", ";
        sqlQuery += arrayContractor[i].getStateAbb() + ", ";
        sqlQuery += arrayContractor[i].getCountryAbb() + ", ";
        sqlQuery += arrayContractor[i].getZipCode() + ", ";
        sqlQuery += arrayContractor[i].getFee() + ", ";
        sqlQuery += arrayContractor[i].getLastUpdatedBy() + ", ";
        sqlQuery += arrayContractor[i].getLastUpdated() + ")";
        Master.sendDBCommand(sqlQuery);
        //reset contractor array
        arrayContractor[i] = null;
    }

    protected void LoadStates() {
        ddCState.Items.Clear();
        try {
            sqlQuery = "SELECT StateAbb, StateName " +
                    "FROM HomeState;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddCState.Items.Add(new ListItem("  "));

            while (myReader.Read()) {
                ddCState.Items.Add(new ListItem(myReader["StateAbb"] + " - " + myReader["StateName"]));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating State dd from database";
        }
    }

    protected void LoadCountries() {
        ddCCountry.Items.Clear();
        try {
            sqlQuery = "SELECT CountryAbb, CountryName " +
                    "FROM Country;";
            Master.sendDBCommand(sqlQuery);
            myReader = Master.getSqlCommand.ExecuteReader();
            ddCCountry.Items.Add(new ListItem("  "));

            while (myReader.Read()) {
                ddCCountry.Items.Add(new ListItem(myReader["CountryAbb"] + " - " + myReader["CountryName"]));
            }
            Master.closeDB();
        }
        catch (Exception) {
            Master.DisplayOnMaster.Text = "Error populating Country dd from database";
        }
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