using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/*
Zachary Curry

On my honor, I have neither given nor received any unauthorized assistance on
this academic work
*/


public class Driver{
    String DriverID, FirstName, LastName, MiddleInitial, HouseNumber, Street, CityCounty, StateAbb,
            CountryAbb, ZipCode, DateOfBirth, CDL, CDLDate, LastUpdatedBy, LastUpdated, ContractorID, 
            HireDate, TerminationDate, Salary;

    //Constructor
	public Driver(String DriverID, String FirstName, String LastName, String MiddleInitial, String HouseNumber,
                String Street, String CityCounty,  String StateAbb, String CountryAbb, String ZipCode,  String DateOfBirth,
                String CDL, String CDLDate, String LastUpdatedBy, String LastUpdated, String ContractorID, String HireDate,
                String TerminationDate, String Salary) {
            setDriverID(DriverID);
            setFirstName(FirstName);
            setLastName(LastName);
            setMiddleInitial(MiddleInitial);
            setHouseNumber(HouseNumber);
            setStreet(Street);
            setCityCounty(CityCounty);
            setStateAbb(StateAbb);
            setCountryAbb(CountryAbb);
            setZipCode(ZipCode);
            setDateOfBirth(DateOfBirth);
            setCDL(CDL);
            setCDLDate(CDLDate);
            setLastUpdatedBy(LastUpdatedBy);
            setLastUpdated(LastUpdated);
            setContractorID(ContractorID);
            setHireDate(HireDate);
            setTerminationDate(TerminationDate);
            setSalary(Salary);
	}

    //Setter Methods
    public void setDriverID(String a){
        this.DriverID = "'" + a +"'";
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
    public void setHouseNumber(String a) {
        if (a == "")
            this.HouseNumber = "NULL";
        else this.HouseNumber = "'" + a + "'";
    }
    public void setStreet(String a) {
        if (a == "")
            this.Street = "NULL";
        else this.Street = "'" + a + "'";
    }
    public void setCityCounty(String a) {
        if (a == "")
            this.CityCounty = "NULL";
        else this.CityCounty = "'" + a + "'";
    }
    public void setStateAbb(String a) {
        if (a.Trim() == "")
            this.StateAbb = "NULL";
        else this.StateAbb = "'" + a + "'";
    }
    public void setCountryAbb(String a) {
        if (a.Trim() == "")
            this.CountryAbb = "NULL";
        else this.CountryAbb = "'" + a + "'";
    }
    public void setZipCode(String a) {
        if (a == "")
            this.ZipCode = "NULL";
        else this.ZipCode = "'" + a + "'";
    }
    public void setDateOfBirth(String a){
        this.DateOfBirth = "'" + a + "'";
    }
    public void setCDL(String a){
        if (a.Trim() == "")
            this.CDL = "NULL";
        else this.CDL = "'" + a + "'";
    }
    public void setCDLDate(String a){
        if (a == "")
            this.CDLDate = "NULL";
        else this.CDLDate = "'" + a + "'";
    }
    public void setHireDate(String a){
        if (a == "")
            this.HireDate = "NULL";
        else this.HireDate = "'" + a + "'";
    }
    public void setTerminationDate(String a){
        if (a == "")
            this.TerminationDate = "NULL";
        else this.TerminationDate = "'" + a + "'";
    }
    public void setLastUpdatedBy(String a) {
        this.LastUpdatedBy = "'" + a + "'";
    }
    public void setLastUpdated(String a) {
        this.LastUpdated = "'" + a + "'";
    }
    public void setContractorID(String a) {
        this.ContractorID = "'" + a + "'";
    }
    public void setSalary(String a) {
        if (a == "")
            this.Salary = "NULL";
        else this.Salary = "'" + a + "'";
    }

    //Getter Methods
    public String getDriverID(){
        return this.DriverID;
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
    public String getSalary(){
        return this.Salary;
    }
    public String getContractorID(){
        return this.ContractorID;
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
    public String getDateOfBirth(){
        return this.DateOfBirth;
    }
    public String getCDL(){
        return this.CDL;
    }
    public String getCDLDate(){
        return this.CDLDate;
    }
    public String getHireDate(){
        return this.HireDate;
    }
    public String getTerminationDate(){
        return this.TerminationDate;
    }
    public String getLastUpdatedBy(){
        return this.LastUpdatedBy;
    }
    public String getLastUpdated(){
        return this.LastUpdated;
    }

    public void reset() {
        DriverID = null;
        FirstName = null;
        LastName = null;
        MiddleInitial = null;
        Salary = null;
        ContractorID = null;
        HouseNumber = null;
        Street = null;
        CityCounty = null;
        StateAbb = null;
        CountryAbb = null;
        ZipCode = null;
        DateOfBirth = null;
        CDL = null;
        CDLDate = null;
        HireDate = null;
        TerminationDate = null;
        LastUpdatedBy = null;
        LastUpdated = null;
    }
}