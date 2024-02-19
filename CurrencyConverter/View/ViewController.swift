//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Justin Baik on 2/17/24.
//

import UIKit

class ViewController: UIViewController {

    //UITextField to input amount to convert in USD
    @IBOutlet weak var amountInput: UITextField!
    //target currency UILabels
    @IBOutlet weak var currency1: UILabel!
    @IBOutlet weak var currency2: UILabel!
    @IBOutlet weak var currency3: UILabel!
    @IBOutlet weak var currency4: UILabel!
    
    //amount in USD
    var amount : Int?
    //amount in target currency
    var convertedAmount1 : Double?
    var convertedAmount2 : Double?
    var convertedAmount3 : Double?
    var convertedAmount4 : Double?
    
    //holds boolean values for state of switch(on or off)
    var switch1Toggle : Bool = true
    var switch2Toggle : Bool = true
    var switch3Toggle : Bool = true
    var switch4Toggle : Bool = true
    
    //object to perform currency conversion
    var currencyCalcLogic = CurrencyCalcLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Toggle currency conversion switch
    @IBAction func currency1Switch(_ sender1: UISwitch) {
        switch1Toggle = sender1.isOn
    }
    @IBAction func currency2Switch(_ sender2: UISwitch) {
        switch2Toggle = sender2.isOn
    }
    @IBAction func currency3Switch(_ sender3: UISwitch) {
        switch3Toggle = sender3.isOn
    }
    @IBAction func currency4Switch(_ sender4: UISwitch) {
        switch4Toggle = sender4.isOn
    }

    //control sent to CurrencyCalcLogic
    @IBAction func convertCurrency(_ sender: UIButton) {
        do {
            amount = try checkInput()
            currencyCalcLogic.amountInUSD = Int(amountInput.text!)
        //performs currency calculation if toggle is on
        if(switch1Toggle) {
            convertedAmount1 = currencyCalcLogic.convertCurrency(currency1.text!)
        } else {convertedAmount1 = nil}
        if(switch2Toggle) {
            convertedAmount2 = currencyCalcLogic.convertCurrency(currency2.text!)
        } else {convertedAmount2 = nil}
        if(switch3Toggle) {
            convertedAmount3 = currencyCalcLogic.convertCurrency(currency3.text!)
        } else {convertedAmount3 = nil}
        if(switch4Toggle) {
            convertedAmount4 = currencyCalcLogic.convertCurrency(currency4.text!)
        } else {convertedAmount4 = nil}
        self.performSegue(withIdentifier: "toConvertedAmount", sender: self)
        //error handling
        } catch InputError.noInput(let reason) {
            amountInput.text = reason
        } catch InputError.invalidFormat(let reason) {
            amountInput.text = reason
        } catch {
            print("Other error")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toConvertedAmount"  {
            let conversionNavigation = segue.destination as! ConvertedCurrencyView
            conversionNavigation.amount = amount!
            conversionNavigation.convertedAmount1 = convertedAmount1
            conversionNavigation.convertedAmount2 = convertedAmount2
            conversionNavigation.convertedAmount3 = convertedAmount3
            conversionNavigation.convertedAmount4 = convertedAmount4
        }
    }
    
    func checkInput() throws -> Int {
        // checks that input is not empty
        guard let checkInput = amountInput.text, !checkInput.isEmpty else {
            throw InputError.noInput(reason: "Enter Value in USD")
        }
        // checks if input is an integer
        guard UInt(amountInput.text!) is UInt else {
            throw InputError.invalidFormat(reason: "Integer Values Only")
        }
        return Int(amountInput.text!)!
    }
    
    enum InputError: Error {
        case noInput(reason: String)
        case invalidFormat(reason: String)
    }
}

