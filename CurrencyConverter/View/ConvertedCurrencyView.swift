//
//  ConvertedCurrencyView.swift
//  CurrencyConverter
//
//  Created by Justin Baik on 2/17/24.
//

import UIKit

class ConvertedCurrencyView: UIViewController {

    @IBOutlet weak var amountInUSD: UILabel!
    @IBOutlet weak var convertedCurrency1: UILabel!
    @IBOutlet weak var convertedCurrency2: UILabel!
    @IBOutlet weak var convertedCurrency3: UILabel!
    @IBOutlet weak var convertedCurrency4: UILabel!
    
    @IBOutlet weak var convertedCurrency1Stack: UIStackView!
    @IBOutlet weak var convertedCurrency2Stack: UIStackView!
    @IBOutlet weak var convertedCurrency3Stack: UIStackView!
    @IBOutlet weak var convertedCurrency4Stack: UIStackView!
    
    var amount : Int = 0
    var convertedAmount1 : Double?
    var convertedAmount2 : Double?
    var convertedAmount3 : Double?
    var convertedAmount4 : Double?
    
    let currencyFormat: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.maximumFractionDigits = 2
        return currencyFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayConversion()
    }
    
    func displayConversion() {
        currencyFormat.currencyCode = "USD"
        amountInUSD.text = currencyFormat.string(from: amount as NSNumber)
        if(convertedAmount1 == nil) {
            convertedCurrency1Stack.isHidden = true
        } else {
            currencyFormat.currencyCode = "KRW"
            convertedCurrency1.text = currencyFormat.string(from: convertedAmount1! as NSNumber)
        }
        if(convertedAmount2 == nil) {
            convertedCurrency2Stack.isHidden = true
        } else {
            currencyFormat.currencyCode = "MXN"
            convertedCurrency2.text = currencyFormat.string(from: convertedAmount2! as NSNumber)
        }
        if(convertedAmount3 == nil) {
            convertedCurrency3Stack.isHidden = true
        } else {
            currencyFormat.currencyCode = "EUR"
            convertedCurrency3.text = currencyFormat.string(from: convertedAmount3! as NSNumber)
        }
        if(convertedAmount4 == nil) {
            convertedCurrency4Stack.isHidden = true
        } else {
            currencyFormat.currencyCode = "JPY"
            convertedCurrency4.text = currencyFormat.string(from: convertedAmount4! as NSNumber)
        }
    }
}
