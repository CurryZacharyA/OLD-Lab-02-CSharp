using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/*
Zachary Curry

On my honor, I have neither given nor received any unauthorized assistance on
this academic work
*/

public class Contractor{
    String ContractorID, FirstName, LastName, MiddleInitial, HouseNumber, Street, CityCounty, StateAbb,
            CountryAbb, ZipCode, Fee, LastUpdatedBy, LastUpdated;

    //Constructor
    public Contractor(String ContractorID, String FirstName, String LastName, String MiddleInitial, String HouseNumber,
                String Street, String CityCounty, String StateAbb, String CountryAbb, String ZipCode, String Fee,
                String LastUpdatedBy, String LastUpdated) {
        setContractorID(ContractorID);
        setFirstName(FirstName);
        setLastName(LastName);
        setMiddleInitial(MiddleInitial);
        setHouseNumber(HouseNumber);
        setStreet(Street);
        setCityCounty(CityCounty);
        setStateAbb(StateAbb);
        setCountryAbb(CountryAbb);
        setZipCode(ZipCode);
        setFee(Fee);
        setLastUpdatedBy(LastUpdatedBy);
        setLastUpdated(LastUpdated);
    }

    //Setter Methods
    public void setContractorID(String a){
        this.ContractorID = a;
    }
    public void setFirstName(String a){
        this.FirstName = "'" + a + "'";
    }
    public void setLastName(String a){
        this.LastName = "'" + a + "'";
    }
    public void setMiddleInitial(String a){
        if (a.Trim() == "")
            this.MiddleInitial = "NULL";
        else this.MiddleInitial = "'" + a + "'";
    }
    public void setHouseNumber(String a){
        if (a == "")
            this.HouseNumber = "NULL";
        else this.HouseNumber = "'" + a + "'";
    }
    public void setStreet(String a){
        if (a == "")
            this.Street = "NULL";
        else this.Street = "'" + a + "'";
    }
    public void setCityCounty(String a){
        if (a == "")
            this.CityCounty = "NULL";
        else this.CityCounty = "'" + a + "'";
    }
    public void setStateAbb(String a){
        if (a.Trim() == "")
            this.StateAbb = "NULL";
        else this.StateAbb = "'" + a + "'";
    }
    public void setCountryAbb(String a){
        if (a.Trim() == "")
            this.CountryAbb = "NULL";
        else this.CountryAbb = "'" + a + "'";
    }
    public void setZipCode(String a){
        if (a == "")
            this.ZipCode = "NULL";
        else this.ZipCode = "'" + a + "'";
    }
    public void setFee(String a){
        if (a == "")
            this.Fee = "NULL";
        else this.Fee = "'" + a + "'";
    }
    public void setLastUpdatedBy(String a){
        this.LastUpdatedBy = "'" + a + "'";
    }
    public void setLastUpdated(String a){
        this.LastUpdated = "'" + a + "'";
    }

    //Getter Methods
    public String getContractorID(){
        return this.ContractorID;
    }
    public String getFirstName(){
        return this.FirstName;
    }
    public String getLastName(){
        return this.LastName;
    }
    public String getMiddleInitial(){
        return this.MiddleInitial;
    }
    public String getHouseNumber(){
        return this.HouseNumber;
    }
    public String getStreet(){
        return this.Street;
    }
    public String getCityCounty(){
        return this.CityCounty;
    }
    public String getStateAbb(){
        return this.StateAbb;
    }
    public String getCountryAbb(){
        return this.CountryAbb;
    }
    public String getZipCode(){
        return this.ZipCode;
    }
    public String getFee(){
        return this.Fee;
    }
    public String getLastUpdatedBy(){
        return this.LastUpdatedBy;
    }
    public String getLastUpdated(){
        return this.LastUpdated;
    }
}