//
//  ConvertedCurrencyView.swift
//  CurrencyConverter
//
//  Created by Justin Baik on 2/17/24.
//

import UIKit

class ConvertedCurrencyView: UIViewController {

    var amount : String?
    var convertedAmount1 : String?
    var convertedAmount2 : String?
    var convertedAmount3 : String?
    var convertedAmount4 : String?
    
    @IBOutlet weak var amountInUSD: UILabel!
    @IBOutlet weak var convertedCurrency1: UILabel!
    @IBOutlet weak var convertedCurrency2: UILabel!
    @IBOutlet weak var convertedCurrency3: UILabel!
    @IBOutlet weak var convertedCurrency4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountInUSD.text = amount
        convertedCurrency1.text = convertedAmount1
        convertedCurrency2.text = convertedAmount2
        convertedCurrency3.text = convertedAmount3
        convertedCurrency4.text = convertedAmount4
    
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
