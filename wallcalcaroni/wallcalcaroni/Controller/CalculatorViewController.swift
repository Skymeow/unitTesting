//
//  CalculatorViewController.swift
//  wallcalcaroni
//
//  Created by Caleb Stultz on 1/4/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var zeroBtn: UIButton!
    @IBOutlet var oneBtn: UIButton!
    @IBOutlet var twoBtn: UIButton!
    @IBOutlet var threeBtn: UIButton!
    @IBOutlet var fourBtn: UIButton!
    @IBOutlet var fiveBtn: UIButton!
    @IBOutlet var sixBtn: UIButton!
    @IBOutlet var sevenBtn: UIButton!
    @IBOutlet var eightBtn: UIButton!
    @IBOutlet var nineBtn: UIButton!
    @IBOutlet var decimalBtn: UIButton!
    @IBOutlet var equalsBtn: UIButton!
    @IBOutlet var addBtn: UIButton!
    @IBOutlet var subtractBtn: UIButton!
    @IBOutlet var multiplyBtn: UIButton!
    @IBOutlet var divideBtn: UIButton!
    @IBOutlet var acBtn: UIButton!
    
    var calculationViewModel: CalculationViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        calculationViewModel = CalculationViewModel()
    }
    
    @IBAction func numberBtnWasPressed(_ sender: UIButton) {
        calculationViewModel.append(sender.tag)
        self.valueLabel.text = calculationViewModel.stringifyValues()
    }
    
    @IBAction func acButtonWasPressed(_ sender: UIButton) {
        self.valueLabel.text = calculationViewModel.clearValues()
    }
    
    @IBAction func operandBtnWasPressed(_ sender: UIButton) {
        guard let operand = Operand(rawValue: sender.tag) else { return }
        calculationViewModel.set(operand: operand)
    }
    
    @IBAction func equalsBtnWasPressed(_ sender: UIButton) {
        let calculationString = String(describing: calculationViewModel.calculate())
        self.valueLabel.text = calculationString
    }
}
