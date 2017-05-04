using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/*
Zachary Curry

On my honor, I have neither given nor received any unauthorized assistance on
this academic work
*/

public class Equipment{
    String ID, VinNumber, Make, Model, EquipmentYear, PriceAcquired, LicenseNumber, DriverID,
        LastUpdatedBy, LastUpdated;

    //Constructor
    public Equipment(String ID, String VinNumber, String Make, String Model, String EquipmentYear,
                String PriceAcquired, String LicenseNumber,  String DriverID, String LastUpdatedBy,
                String LastUpdated) {
                    setID(ID);
                    setVinNumber(VinNumber);
                    setMake(Make);
                    setModel(Model);
                    setEquipmentYear(EquipmentYear);
                    setPriceAcquired(PriceAcquired);
                    setLicenseNumber(LicenseNumber);
                    setDriverID(DriverID);
                    setLastUpdatedBy(LastUpdatedBy);
                    setLastUpdated(LastUpdated);
    }

    //Setter Methods
    public void setID(String a) {
        this.ID = "'" + a + "'";
    }
    public void setVinNumber(String a) {
        this.VinNumber = "'" + a + "'";
    }
    public void setMake(String a) {
        if (a.Trim() == "")
            this.Make = "NULL";
        else this.Make = "'" + a + "'";
    }
    public void setModel(String a) {
        if (a.Trim() == "")
            this.Model = "NULL";
        else this.Model = "'" + a + "'";
    }
    public void setEquipmentYear(String a) {
        if (a.Trim() == "")
            this.EquipmentYear = "NULL";
        else this.EquipmentYear = "'" + a + "'";
    }
    public void setPriceAcquired(String a) {
        if (a == "")
            this.PriceAcquired = "NULL";
        else this.PriceAcquired = "'" + a + "'";
    }
    public void setLicenseNumber(String a) {
        if (a.Trim() == "")
            this.LicenseNumber = "NULL";
        else this.LicenseNumber = "'" + a + "'";
    }
    public void setDriverID(String a) {
        this.DriverID = "'" + a + "'";
    }
    public void setLastUpdatedBy(String a) {
        this.LastUpdatedBy = "'" + a + "'";
    }
    public void setLastUpdated(String a) {
        this.LastUpdated = "'" + a + "'";
    }

    //Getter Methods
    public String getID() {
        return this.ID;
    }
    public String getVinNumber() {
        return this.VinNumber;
    }
    public String getMake() {
        return this.Make;
    }
    public String getModel() {
        return this.Model;
    }
    public String getEquipmentYear() {
        return this.EquipmentYear;
    }
    public String getPriceAcquired() {
        return this.PriceAcquired;
    }
    public String getLicenseNumber() {
        return this.LicenseNumber;
    }
    public String getDriverID() {
        return this.DriverID;
    }
    public String getLastUpdatedBy() {
        return this.LastUpdatedBy;
    }
    public String getLastUpdated() {
        return this.LastUpdated;
    }

    public void reset() {
        ID = null;
        VinNumber = null;
        Make = null;
        Model = null;
        EquipmentYear = null;
        PriceAcquired = null;
        LicenseNumber = null;
        DriverID = null;
        LastUpdatedBy = null;
        LastUpdated = null;
    }
}