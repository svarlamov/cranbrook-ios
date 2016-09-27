
//
//  SetupSearchResultDetailDat.swift
//  Cranbrook Kingswood
//
//  Created by Stefan DeClerck on 9/27/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation

struct SearchDetailDataStructure {
    var headerLabelText: String
    var subTitleLabelText: String
    var phoneNumberOneText: String
    var phoneNumberTwoText: String
    var addressText: String
    
    init (headerLabelText: String, subTitleLabelText: String, phoneNumberOneText: String, phoneNumberTwoText: String, addressText: String) {
        self.headerLabelText = headerLabelText
        self.subTitleLabelText = subTitleLabelText
        self.phoneNumberOneText = phoneNumberOneText
        self.phoneNumberTwoText = phoneNumberTwoText
        self.addressText = addressText
    }
    
}

extension DirectorySearchViewController {
    
    internal func setupDetailViewData() -> SearchDetailDataStructure {
        let dataToParse: SearchResultResponse? = selectedSearchResult
        let headerLabelText: String = self.getHeaderLabelText(dataToParse!)
        let subTitleLabelText: String = self.getSubTitleLabelText(dataToParse!)
        let phoneNumberOneText: String = self.getPhoneNumberOneText(dataToParse!)
        let phoneNumberTwoText: String = self.getPhoneNumberTwoText(dataToParse!)
        let addressText: String = self.getAddressText(dataToParse!)
        let returnData: SearchDetailDataStructure = SearchDetailDataStructure(headerLabelText: headerLabelText, subTitleLabelText: subTitleLabelText, phoneNumberOneText: phoneNumberOneText, phoneNumberTwoText: phoneNumberTwoText, addressText: addressText)
        return returnData
        
    }
    
    private func getAddressText(inputData: SearchResultResponse) -> String {
        var outputString: String = ""
        /*
         self.addressLine1           = unboxer.unbox("AddressLine1")
         self.addressLine2           = unboxer.unbox("AddressLine2")
         self.city                   = unboxer.unbox("City")
         self.state                  = unboxer.unbox("State")
         self.zip                    = unboxer.unbox("Zip")
        */
        if let addressLineOne = inputData.addressLine1 {
            outputString = addressLineOne
        }
        if let addressLineTwo = inputData.addressLine2 {
            if outputString == "" {
                outputString = addressLineTwo
            } else {
                outputString = outputString + ", \(addressLineTwo)"
            }
        }
        if let city = inputData.city {
            if outputString == "" {
                outputString = city
            } else {
                outputString = outputString + ", \(city)"
            }
        }
        if let state = inputData.state {
            if outputString == "" {
                outputString = state
            } else {
                outputString = outputString + ", \(state)"
            }
        }
        if let zipCode = inputData.zip {
            if outputString == "" {
                outputString = zipCode
            } else {
                outputString = outputString + ", \(zipCode)"
            }
        }
        return outputString
    }
    
    private func getPhoneNumberOneText(inputData: SearchResultResponse) -> String {
        var outputString: String = ""
        if let cellPhone = inputData.cellPhone {
            outputString = "\(cellPhone)"
        } else {
            outputString = "--"
        }
        return outputString
    }
    
    private func getPhoneNumberTwoText(inputData: SearchResultResponse) -> String {
        var outputString: String = ""
        if let officePhone = inputData.officePhone {
            outputString = "\(officePhone)"
        } else {
            outputString = "--"
        }
        return outputString
    }
    
    private func getSubTitleLabelText(inputData: SearchResultResponse) -> String {
        var outputString: String = ""
        if let email = inputData.email {
            outputString = email
        } else {
            outputString = "No email"
        }
        return outputString
    }
    
    private func getHeaderLabelText(inputData: SearchResultResponse) -> String {
        var outputString: String = ""
        
        if let firstName = inputData.firstName {
            outputString = firstName
        }
        
        if let middleName = inputData.middleName {
            outputString = outputString + " \(middleName)"
        }
        
        if let lastName = inputData.lastName {
            outputString = outputString + " \(lastName)"
        }
        
        if let graduationYear = inputData.gradYear {
            if graduationYear != "" && graduationYear.characters.count == 4 {
                let characters = [Character](graduationYear.characters)
                let finalGraduationString: String = " '\(characters[2])\(characters[3])"
                outputString = outputString + finalGraduationString
            }
        }
        return outputString
    }
    
    
}
