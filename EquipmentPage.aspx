<%@ Page Title="Equipment" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EquipmentPage.aspx.cs" Inherits="EquipmentPage" %>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table background-color: #FFFFFF>
        <tr>
            <td>
                <h2>Equipment</h2>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <asp:Button
                    ID="btnECommit"
                    Text="Commit"
                    style="height: 26px"
                    OnClick="btnECommit_Click"
                    TabIndex="8"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td
                class="align-right">
                Equipment ID:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEEquipmentID"
                    runat="server"
                    BackColor="#D5D5D5"
                    ReadOnly="True" />
            </td>
            <td
                class="align-right">
                <strong>Driver</strong>:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddEDriver"
                    runat="server"
                    TabIndex="4" />
                <asp:RequiredFieldValidator
                    ID="requiredDriver"
                    ControlToValidate="ddEDriver"
                    ErrorMessage="Contractor - REQUIRED"
                    SetFocusOnError="True"
                    InitialValue="Please select"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                <strong>Vin</strong>:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEVin"
                    Placeholder="40 characters max"
                    runat="server"
                    TabIndex="1" />
                <asp:RequiredFieldValidator
                    ID="requiredVin"
                    ControlToValidate="tbEVin"
                    ErrorMessage="Vin - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="constraintVin"
                    ControlToValidate="tbEVin"
                    ErrorMessage="First Name - ONLY ALPHABETIC AND NUMERIC CHARACTERS // ONLY SPECIAL CHARACTERS ALLOWED: ' -"
                    SetFocusOnError="True"
                    ValidationExpression="^[\da-zA-Z'-]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthVin"
                    ControlToValidate="tbEVin"
                    ErrorMessage="First Name - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,40}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesVin"
                    ControlToValidate="tbEVin"
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
                Year:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEYear"
                    runat="server"
                    TabIndex="5" />
                <asp:RegularExpressionValidator
                    ID="constraintYear"
                    ControlToValidate="tbEYear"
                    ErrorMessage="Year - ENTER A YEAR IN YYYY FORMAT"
                    SetFocusOnError="True"
                    ValidationExpression="[\d]{4}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RangeValidator
                    ID="maxValueYear"
                    ControlToValidate="tbEYear"
                    ErrorMessage="Year - ENTER A YEAR BEFORE 2019"
                    SetFocusOnError="True"
                    MinimumValue="0"
                    MaximumValue="2019"
                    Type="Integer"
                    Display="Dynamic"
                    Text="*"
                    Forecolor="Red"
                    runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                Make:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEMake"
                    runat="server"
                    TabIndex="2" />
                 <asp:RegularExpressionValidator
                    ID="constraintMake"
                    ControlToValidate="tbEMake"
                    ErrorMessage="Make - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersMake"
                    ControlToValidate="tbEMake"
                    ErrorMessage="Make - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthMake"
                    ControlToValidate="tbEMake"
                    ErrorMessage="Make - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,35}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                Price Acquired:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEPriceAcquired"
                    runat="server"
                    TabIndex="6" />
                <asp:RegularExpressionValidator
                    ID="constraintPriceAcquired"
                    ControlToValidate="tbEPriceAcquired"
                    ErrorMessage="Price Acquired - MUST BE NUMERIC (2 DECIMALS IF SHOWING CENTS) // NO COMMAS 
                            // INCORRECT FORMAT // MAX VALUE ALLOWED = 999999.99 // POSITIVE VALUES ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="(?!\.?$)\d{0,6}(\.\d{0,2})?$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesPriceAcquired"
                    ControlToValidate="tbEPriceAcquired"
                    ErrorMessage="Price Acquired - NO SPACES ALLOWED" 
                    SetFocusOnError="True"
                    ValidationExpression="[^\s]+"
                    Display="Dynamic"
                    Text="*" 
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                Model:
            </td>
            <td>
                <asp:TextBox
                    ID="tbEModel"
                    runat="server"
                    TabIndex="3" />
                <asp:RegularExpressionValidator
                    ID="constraintModel"
                    ControlToValidate="tbEModel"
                    ErrorMessage="Model - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersModel"
                    ControlToValidate="tbEModel"
                    ErrorMessage="Model - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthModel"
                    ControlToValidate="tbEModel"
                    ErrorMessage="Model - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,30}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td
                class="align-right">
                License Plate:
            </td>
            <td>
                <asp:TextBox
                    ID="tbELicensePlate"
                    runat="server"
                    TabIndex="7" />
                <asp:RegularExpressionValidator
                    ID="constraintLicensePlate"
                    ControlToValidate="tbELicensePlate"
                    ErrorMessage="License Plate - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersLicensePlate"
                    ControlToValidate="tbELicensePlate"
                    ErrorMessage="License Plate - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthLicensePlate"
                    ControlToValidate="tbELicensePlate"
                    ErrorMessage="License Plate - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,10}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="5">
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