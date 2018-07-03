//
//  CalculateViewControllerTests.swift
//  wallcalcaroniTests
//
//  Created by Sky Xu on 7/2/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import wallcalcaroni

class CalculateViewControllerTests: XCTestCase {
    
    var sut: CalculatorViewController!
    
    override func setUp() {
        super.setUp()
       let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CalculatorViewController") as! CalculatorViewController
        sut = vc
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAddingValue() {
        sut.oneBtn.sendActions(for: .touchUpInside)
        sut.addBtn.sendActions(for: .touchUpInside)
        sut.twoBtn.sendActions(for: .touchUpInside)
        sut.equalsBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "3")
    }
    
    func testOperandShouldChange() {
        sut.fourBtn.sendActions(for: .touchUpInside)
        sut.multiplyBtn.sendActions(for: .touchUpInside)
        sut.addBtn.sendActions(for: .touchUpInside)
        sut.twoBtn.sendActions(for: .touchUpInside)
        sut.equalsBtn.sendActions(for: .touchUpInside)
        XCTAssertEqual(sut.valueLabel.text, "8")
    }
    
    
    
    
    
    
}
