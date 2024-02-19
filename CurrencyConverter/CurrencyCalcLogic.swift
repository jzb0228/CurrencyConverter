//
//  CurrencyCalcLogic.swift
//  CurrencyConverter
//
//  Created by Justin Baik on 2/17/24.
//

import Foundation

struct CurrencyCalcLogic {
    
    //variable declarations to compute conversions.
    var amountInUSD : Int?
    var currencyOther : String?
    var conversionRate : Double?
    var convertedCurrency : Double?
    
    //passes in the target currency String from the main view and outputs the converted currency as String
    //conversion rate variable is set using the ConversionRateData
    mutating func convertCurrency(_ currencyType: String) -> Double {
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
            break
        }
        convertedCurrency = Double(amountInUSD!) * conversionRate!
        return convertedCurrency!
    }
}

//currency conversion rates as of 02/17/24
enum ConversionRateData : Double{
    case Won = 1332.58
    case Peso = 17.05
    case Euro = 0.93
    case Yen = 150.22
}

