<%@ Page Title="Driver" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DriverPage.aspx.cs" Inherits="DriverPage" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!--
Zachary Curry

On my honor, I have neither given nor received any unauthorized assistance on
this academic work
-->
    <style type="text/css">
        .align-right {
            text-align: right;
        }
        .middleInitial {
            width: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table background-color: #FFFFFF>
        <tr>
            <td>
                <h2>Driver</h2>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <asp:Button
                    ID="btnDCommit"
                    Text="Commit"
                    OnClick="btnDCommit_Click"
                    TabIndex="17"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td
                class="align-right">
                Driver:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDDriverID"
                    runat="server"
                    BackColor="#D5D5D5"
                    ReadOnly="True" />
            </td>
            <td
                class="align-right">
                <strong>Contractor</strong>:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddDContractor"
                    runat="server"
                    TabIndex="8" />
                <asp:RequiredFieldValidator
                    ID="requiredContractor"
                    ControlToValidate="ddDContractor"
                    ErrorMessage="Contractor - REQUIRED"
                    SetFocusOnError="True"
                    InitialValue="Please select"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                <strong>First</strong> <strong>Name</strong>:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDFirstName"
                    placeholder="20 characters max"
                    runat="server"
                    TabIndex="1" />
                <asp:RequiredFieldValidator
                    ID="requiredFN"
                    ControlToValidate="tbDFirstName"
                    ErrorMessage="First Name - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="constraintFN"
                    ControlToValidate="tbDFirstName"
                    ErrorMessage="First Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z'-]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthFN"
                    ControlToValidate="tbDFirstName"
                    ErrorMessage="First Name - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,20}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesFN"
                    ControlToValidate="tbDFirstName"
                    ErrorMessage="First Name - NO SPACES ALLOWED"
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                House Number:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDHouseNumber"
                    Placeholder="Positive Integer"
                    runat="server" Height="22px"
                    TabIndex="9" />
                <asp:RegularExpressionValidator
                    ID="positiveHN"
                    ControlToValidate="tbDHouseNumber"
                    ErrorMessage="House Number - MUST BE POSITIVE INTEGER"
                    SetFocusOnError="True"
                    ValidationExpression="^\d+$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RangeValidator
                    ID="maxValueHN"
                    ControlToValidate="tbDHouseNumber"
                    ErrorMessage="House Number - MAX VALUE ALLOWED IS 2,147,483,647"
                    SetFocusOnError="True"
                    MinimumValue="0"
                    MaximumValue="2147483647"
                    Type="Integer"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthHN"
                    ControlToValidate="tbDHouseNumber"
                    ErrorMessage="House Number - NO SPACES ALLOWED" 
                    ValidationExpression="[^\s]+"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Hire Date:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDHireDate"
                    Placeholder="MM/DD/YYYY"
                    runat="server"
                    TabIndex="15" />
                <asp:CompareValidator
                    ID="dateValHireDate"
                    ControlToValidate="tbDHireDate"
                    ErrorMessage="Hire Date - MUST BE A VALID DATE"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="DataTypeCheck"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="formatHireDate"
                    ControlToValidate="tbDHireDate"
                    ErrorMessage="Hire Date - INCORRECT FORMAT"
                    SetFocusOnError="True"
                    ValidationExpression="^\d{2}/\d{2}/\d{4}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateValHireAfterDOB"
                    ControlToValidate="tbDHireDate"
                    ErrorMessage="Hire Date - HIRE DATE MUST BE AFTER DATE OF BIRTH"
                    SetFocusOnError="True"
                    ControlToCompare="tbDDOB"
                    Type="Date"
                    Operator="GreaterThan"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
               
            </td>
        </tr>
        <tr>
            <td
                class="align-right">
                MI:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDMI"
                    runat="server"
                    CssClass="middleInitial"
                    TabIndex="2" />
                <asp:RegularExpressionValidator
                    ID="constraintMI"
                    ControlToValidate="tbDMI"
                    ErrorMessage="Middle Initial - ALPHABETIC CHARACTER ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z]{1,25}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthMI"
                    ControlToValidate="tbDMI"
                    ErrorMessage="Middle Initial - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{1}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Street:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDStreet"
                    Placeholder="50 characters max"
                    runat="server"
                    TabIndex="10" />
                <asp:RegularExpressionValidator
                    ID="constraintStreet"
                    ControlToValidate="tbDStreet"
                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersStreet"
                    ControlToValidate="tbDStreet"
                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthStreet"
                    ControlToValidate="tbDStreet"
                    ErrorMessage="Street - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,50}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Termination Date:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDTerminationDate"
                    Placeholder="MM/DD/YYYY"
                    runat="server"
                    TabIndex="16" />
                <asp:CompareValidator
                    ID="dateValTerminationDate"
                    ControlToValidate="tbDTerminationDate"
                    ErrorMessage="Termination Date - MUST BE A VALID DATE"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="DataTypeCheck"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="formatTerminationDate"
                    ControlToValidate="tbDTerminationDate"
                    ErrorMessage="Termination Date - INCORRECT FORMAT"
                    SetFocusOnError="True"
                    ValidationExpression="^\d{2}/\d{2}/\d{4}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateValTerminateAfterHire"
                    ControlToValidate="tbDTerminationDate"
                    ErrorMessage="Termination Date - TERMINATION DATE MUST BE AFTER HIRE DATE"
                    SetFocusOnError="True"
                    ControlToCompare="tbDHireDate"
                    Type="Date"
                    Operator="GreaterThan"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateValTerminateAfterDOB"
                    ControlToValidate="tbDHireDate"
                    ErrorMessage="Termination Date - TERMINATION DATE MUST BE AFTER DATE OF BIRTH"
                    SetFocusOnError="True"
                    ControlToCompare="tbDDOB"
                    Type="Date"
                    Operator="GreaterThan"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td
                class="align-right">
                <strong>Last</strong> <strong>Name</strong>:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDLastName"
                    Placeholder="20 characters Max"
                    runat="server"
                    TabIndex="3" />
                <asp:RequiredFieldValidator
                    ID="requiredLN"
                    ControlToValidate="tbDLastName"
                    ErrorMessage="Last Name - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="constraintLN"
                    ControlToValidate="tbDLastName"
                    ErrorMessage="Last Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z'-]{1,999}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthLN"
                    ControlToValidate="tbDLastName"
                    ErrorMessage="Last Name - TOO LONG"
                    ValidationExpression="^[\s\S]{0,20}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesLN"
                    ControlToValidate="tbDLastName"
                    ErrorMessage="Last Name - NO SPACES ALLOWED" 
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                City or County:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDCityCounty"
                    Placeholder="40 characters max"
                    runat="server"
                    TabIndex="11" />
                <asp:RegularExpressionValidator
                    ID="lengthCityCountry"
                    ControlToValidate="tbDCityCounty"
                    ErrorMessage="City/County - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{1,40}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                 <asp:RegularExpressionValidator
                    ID="constraintCityCounty"
                    ControlToValidate="tbDCityCounty"
                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - /&"
                    SetFocusOnError="True"
                    ValidationExpression="^[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersCityCounty"
                    ControlToValidate="tbDCityCounty"
                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td ></td>
            <td></td>
            <td
                class="align-right">
                State:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddDState"
                    runat="server"
                    TabIndex="12" />
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                Salary:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDSalary"
                    Placeholder="99999999.99 max"
                    runat="server"
                    TabIndex="4" />
                <asp:RegularExpressionValidator
                    ID="constraintSalary"
                    ControlToValidate="tbDSalary"
                    ErrorMessage="Salary - MUST BE NUMERIC (2 DECIMALS IF SHOWING CENTS) // NO COMMAS 
                            // INCORRECT FORMAT // MAX VALUE ALLOWED = 99999999.99 // POSITIVE VALUES ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="(?!\.?$)\d{0,8}(\.\d{0,2})?$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesSalary"
                    ControlToValidate="tbDSalary"
                    ErrorMessage="Salary - NO SPACES ALLOWED" 
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Zip Code:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDZipCode"
                    Placeholder="5 Digits"
                    runat="server"
                    TabIndex="13" />
                <asp:RegularExpressionValidator
                    ID="constraintFee"
                    ControlToValidate="tbDZipCode"
                    ErrorMessage="Fee - MUST BE NUMERIC (2 DECIMALS IF SHOWING CENTS) // NO COMMAS 
                            // INCORRECT FORMAT // MAX VALUE ALLOWED = 999999.99 // POSITIVE VALUES ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="(?!\.?$)\d{0,6}(\.\d{0,2})?$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator1"
                    ControlToValidate="tbDZipCode"
                    ErrorMessage="Fee - NO SPACES ALLOWED" 
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                <strong>Date of Birth: </strong>
            </td>
            <td>
                <asp:TextBox
                    ID="tbDDOB"
                    Placeholder="MM/DD/YYYY"
                    runat="server"
                    TabIndex="5" />
                <asp:RequiredFieldValidator
                    ID="requiredDOB"
                    ControlToValidate="tbDDOB"
                    ErrorMessage="Date of Birth - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateValDOB"
                    ControlToValidate="tbDDOB"
                    ErrorMessage="Date of Birth - MUST BE A VALID DATE"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="DataTypeCheck"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="formatDOB"
                    ControlToValidate="tbDDOB"
                    ErrorMessage="Date of Birth - INCORRECT FORMAT"
                    SetFocusOnError="True"
                    ValidationExpression="^\d{2}/\d{2}/\d{4}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateVal25YearsOld"
                    ControlToValidate="tbDDOB"
                    ErrorMessage="Date of Birth - DRIVER TOO YOUNG / MUST BE ATLEAST 25 YEARS OLD"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="LessThan"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
                <asp:CompareValidator
                    ID="dateVal75YearsOld"
                    ControlToValidate="tbDDOB"
                    ErrorMessage="Date of Birth - DRIVER TOO OLD / MUST YOUNGER THAN 75 YEARS OLD"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="GreaterThan"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Country:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddDCountry"
                    runat="server"
                    TabIndex="14" />
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                CDL ID:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDCDL"
                    runat="server"
                    TabIndex="6" />
                <asp:RegularExpressionValidator
                    ID="lengthCDL"
                    ControlToValidate="tbDCDL"
                    ErrorMessage="City/County - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{1,40}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                 <asp:RegularExpressionValidator
                    ID="constraintCDL"
                    ControlToValidate="tbDCDL"
                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE:  -"
                    SetFocusOnError="True"
                    ValidationExpression="^[\d\sa-zA-Z-]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="RegularExpressionValidator4"
                    ControlToValidate="tbDCDL"
                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: -"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                CDL Experation Date:
            </td>
            <td>
                <asp:TextBox
                    ID="tbDCDLExperationDate"
                    Placeholder="MM/DD/YYYY"
                    runat="server"
                    TabIndex="7" />
                <asp:CompareValidator
                    ID="dateValCDLExperation1"
                    ControlToValidate="tbDCDLExperationDate"
                    ErrorMessage="CDL Experation Date - MUST BE A VALID DATE"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="DataTypeCheck"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="formatCDLExperation"
                    ControlToValidate="tbDCDLExperationDate"
                    ErrorMessage="CDL Experation Date - INCORRECT FORMAT"
                    SetFocusOnError="True"
                    ValidationExpression="^\d{2}/\d{2}/\d{4}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                 <asp:CompareValidator
                    ID="dateValTodayCDLExperation"
                    ControlToValidate="tbDCDLExperationDate"
                    ErrorMessage="CDL Experation Date - CDL CANNOT BE EXPIRED"
                    SetFocusOnError="True"
                    Type="Date"
                    Operator="GreaterThan"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:ValidationSummary
                    ID="valSum"
                    DisplayMode="BulletList"
                    ShowMessageBox="false"
                    ShowSummary="true" 
                    HeaderText="Please correct these errors on the form:"
                    Font-Names="verdana" 
                    Font-Size="12"
                    runat="server" />
                </td>
        </tr>
    </table>
</asp:Content>