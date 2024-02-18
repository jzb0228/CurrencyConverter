//
//  CurrencyCalcLogic.swift
//  CurrencyConverter
//
//  Created by Justin Baik on 2/17/24.
//

import Foundation

struct CurrencyCalcLogic {
    
    var currencySwitch = true
    var amountInUSD : Int?
    var convertedCurrency : Double?
    var conversionRate : Double?
    var currencyOther : String?
    
    
    mutating func setSwitch(_ switchValue: Bool) {
        if switchValue {
            currencySwitch = true
        } else {
            currencySwitch = false
        }
    }
    
    mutating func convertCurrency(_ currencyType: String) -> String {
        switch currencyType {
        case "Won":
            conversionRate = ConversionRateData.Won.rawValue
        case "Peso":
            conversionRate = ConversionRateData.Peso.rawValue
        case "Euro":
            conversionRate = ConversionRateData.Euro.rawValue
        case "Yen":
            conversionRate = ConversionRateData.Yen.rawValue
        default:
            return "No conversion available"
        }
        convertedCurrency = Double(amountInUSD!) * conversionRate!
        return String(convertedCurrency!)
    }
}

enum ConversionRateData : Double{
    case Won = 1332.58
    case Peso = 17.05
    case Euro = 0.93
    case Yen = 150.22
}

