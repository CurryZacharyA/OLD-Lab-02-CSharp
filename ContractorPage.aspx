<%@ Page Title="Contractor" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContractorPage.aspx.cs" Inherits="ContractorPage" %>
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
        .inputError { 
         border: 1px solid red; 
        }
    </style>
</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    Runat="Server">
    <table background-color: #FFFFFF>
        <tr>
            <td>
                <h2>Contractor</h2>
            </td>
            <td></td>
            <td></td>
            <td></td>
            <td>
                <asp:Button
                    ID="btnCInsert"
                    Text="Insert"
                    style="height: 26px"
                    OnClick="btnCInsert_Click"
                    runat="server"
                    TabIndex="12" />
            </td>
            <td>
                <asp:Button
                    ID="btnCCommit"
                    Text="Commit"
                    Style="height: 26px"
                    OnClick="btnCCommit_Click"
                    TabIndex="13"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td
                class="align-right">
                <strong>Contractor ID:
            </strong>
            </td>
            <td>
                <asp:TextBox
                    ID="tbCContractorID"
                    BackColor="#D5D5D5"
                    ReadOnly="True"
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
                <strong>First Name:
            </strong>
            </td>
            <td>
                <asp:TextBox
                    ID="tbCFirstName"
                    Placeholder="20 characters max"
                    runat="server"
                    TabIndex="1" />
                <asp:RequiredFieldValidator
                    ID="requiredFN"
                    ControlToValidate="tbCFirstName"
                    ErrorMessage="First Name - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="constraintFN"
                    ControlToValidate="tbCFirstName"
                    ErrorMessage="First Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z'-]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthFN"
                    ControlToValidate="tbCFirstName"
                    ErrorMessage="First Name - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,20}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesFN"
                    ControlToValidate="tbCFirstName"
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
                    ID="tbCHouseNumber"
                    Placeholder="Positive Integer"
                    runat="server"
                    TabIndex="5" />
                <asp:RegularExpressionValidator
                    ID="positiveHN"
                    ControlToValidate="tbCHouseNumber"
                    ErrorMessage="House Number - MUST BE POSITIVE INTEGER"
                    SetFocusOnError="True"
                    ValidationExpression="^\d+$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RangeValidator
                    ID="maxValueHN"
                    ControlToValidate="tbCHouseNumber"
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
                    ID="noSpacesHouseNumber"
                    ControlToValidate="tbCHouseNumber"
                    ErrorMessage="House Number - NO SPACES ALLOWED" 
                    ValidationExpression="[^\s]+"
                    SetFocusOnError="True"
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
                MI:
            </td>
            <td>
                <asp:TextBox
                    ID="tbCMI"
                    runat="server"
                    CssClass="middleInitial"
                    TabIndex="2" />
                <asp:RegularExpressionValidator
                    ID="constraintMI"
                    ControlToValidate="tbCMI"
                    ErrorMessage="Middle Initial - ALPHABETIC CHARACTER ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z]{1,25}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthMI"
                    ControlToValidate="tbCMI"
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
                    ID="tbCStreet"
                    Placeholder="50 characters max"
                    runat="server"
                    TabIndex="6" />
                <asp:RegularExpressionValidator
                    ID="constraintStreet"
                    ControlToValidate="tbCStreet"
                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic" 
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersStreet"
                    ControlToValidate="tbCStreet"
                    ErrorMessage="Street - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - / &"
                    SetFocusOnError="True"
                    ValidationExpression="[^\*\(\)]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthStreet"
                    ControlToValidate="tbCStreet"
                    ErrorMessage="Street - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{0,50}$"
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
                <strong>Last Name:</strong>
            </td>
            <td>
                <asp:TextBox
                    ID="tbCLastName"
                    Placeholder="20 characters Max"
                    runat="server"
                    TabIndex="3" />
                <asp:RequiredFieldValidator
                    ID="requiredLN"
                    ControlToValidate="tbCLastName"
                    ErrorMessage="Last Name - REQUIRED"
                    SetFocusOnError="True"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="constraintLN"
                    ControlToValidate="tbCLastName"
                    ErrorMessage="Last Name - ONLY ALPHABETIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' -"
                    SetFocusOnError="True"
                    ValidationExpression="^[a-zA-Z'-]{1,999}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="lengthLN"
                    ControlToValidate="tbCLastName"
                    ErrorMessage="Last Name - TOO LONG"
                    ValidationExpression="^[\s\S]{0,20}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesLN"
                    ControlToValidate="tbCLastName"
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
                    ID="tbCCityCounty"
                    Placeholder="40 characters max"
                    runat="server"
                    TabIndex="7" />
                <asp:RegularExpressionValidator
                    ID="lengthCityCountry"
                    ControlToValidate="tbCCityCounty"
                    ErrorMessage="City/County - TOO LONG"
                    SetFocusOnError="True"
                    ValidationExpression="^[\s\S]{1,40}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                 <asp:RegularExpressionValidator
                    ID="constraintCityCounty"
                    ControlToValidate="tbCCityCounty"
                    ErrorMessage="City/County - ONLY ALPHABETIC AND NUMBERIC CHARACTERS // SPECIAL CHARACTERS ALLOWED INCLUDE: ' - /&"
                    SetFocusOnError="True"
                    ValidationExpression="^[\d\sa-zA-Z'-/&]{1,99}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="validateCertainSpecialCharactersCityCounty"
                    ControlToValidate="tbCCityCounty"
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
            <td></td>
            <td></td>
            <td
                class="align-right">
                State:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddCState"
                    runat="server" TabIndex="8" />
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td
                class="align-right">
                Fee:
            </td>
            <td>
                <asp:TextBox
                    ID="tbCFee"
                    Placeholder="999999.99 max"
                    runat="server"
                    TabIndex="4"/>
                <asp:RegularExpressionValidator
                    ID="constraintFee"
                    ControlToValidate="tbCFee"
                    ErrorMessage="Fee - MUST BE NUMERIC (2 DECIMALS IF SHOWING CENTS) // NO COMMAS 
                            // INCORRECT FORMAT // MAX VALUE ALLOWED = 999999.99 // POSITIVE VALUES ONLY"
                    SetFocusOnError="True"
                    ValidationExpression="(?!\.?$)\d{0,6}(\.\d{0,2})?$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red" 
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesFee"
                    ControlToValidate="tbCFee"
                    ErrorMessage="Fee - NO SPACES ALLOWED" 
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
                    ID="tbCZipCode"
                    Placeholder="5 Digits"
                    runat="server"
                    TabIndex="9" /> 
                <asp:RegularExpressionValidator
                    ID="constraintZipCode"
                    ControlToValidate="tbCZipCode"
                    ErrorMessage="ZipCode - MUST BE 5 DIGIT INTEGER"
                    SetFocusOnError="True"
                    ValidationExpression="^\d{5}$"
                    Display="Dynamic"
                    Text="*"
                    ForeColor="Red"
                    runat="server" />
                <asp:RegularExpressionValidator
                    ID="noSpacesZipCode"
                    ControlToValidate="tbCZipCode"
                    ErrorMessage="ZipCode - NO SPACES ALLOWED"
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
            <td></td>
            <td></td>
            <td
                class="align-right">
                Country:
            </td>
            <td>
                <asp:DropDownList
                    ID="ddCCountry"
                    runat="server" TabIndex="10" />
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td colspan="6">
                <asp:ValidationSummary
                    ID="valSummary"
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