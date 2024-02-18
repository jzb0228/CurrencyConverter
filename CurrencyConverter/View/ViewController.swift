//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Justin Baik on 2/17/24.
//

import UIKit

class ViewController: UIViewController {

    var amount : String?
    var convertedAmount1 : String?
    var convertedAmount2 : String?
    var convertedAmount3 : String?
    var convertedAmount4 : String?
    var currencyCalcLogic = CurrencyCalcLogic()
    
    
    @IBOutlet weak var amountInput: UITextField!
    @IBOutlet weak var currency1: UILabel!
    @IBOutlet weak var currency2: UILabel!
    @IBOutlet weak var currency3: UILabel!
    @IBOutlet weak var currency4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func currency1Switch(_ sender: UISwitch) {
        currencyCalcLogic.setSwitch(sender.isOn)
    }
    
    @IBAction func currency2Switch(_ sender: UISwitch) {
        currencyCalcLogic.setSwitch(sender.isOn)
    }
    
    @IBAction func currency3Switch(_ sender: UISwitch) {
        currencyCalcLogic.setSwitch(sender.isOn)

    }
    
    @IBAction func currency4Switch(_ sender: UISwitch) {
        currencyCalcLogic.setSwitch(sender.isOn)
    }
    

    @IBAction func convertCurrency(_ sender: UIButton) {
        
        currencyCalcLogic.amountInUSD = Int(amountInput.text!)
        amount = amountInput.text!
        convertedAmount1 = currencyCalcLogic.convertCurrency(currency1.text!)
        convertedAmount2 = currencyCalcLogic.convertCurrency(currency2.text!)
        convertedAmount3 = currencyCalcLogic.convertCurrency(currency3.text!)
        convertedAmount4 = currencyCalcLogic.convertCurrency(currency4.text!)
        
        self.performSegue(withIdentifier: "toConvertedAmount", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toConvertedAmount"  {
            let conversionNavigation = segue.destination as! ConvertedCurrencyView
            conversionNavigation.amount = amount!
            conversionNavigation.convertedAmount1 = convertedAmount1!
            conversionNavigation.convertedAmount2 = convertedAmount2!
            conversionNavigation.convertedAmount3 = convertedAmount3!
            conversionNavigation.convertedAmount4 = convertedAmount4!

        }
        
    }
}

