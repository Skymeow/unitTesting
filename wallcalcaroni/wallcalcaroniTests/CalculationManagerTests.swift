//
//  CalculationManagerTests.swift
//  wallcalcaroniTests
//
//  Created by Sky Xu on 7/2/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import wallcalcaroni
class CalculationManagerTests: XCTestCase {
    
//    system under test
    var sut: CalculationManager!
    override func setUp() {
        super.setUp()
        sut = CalculationManager()
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInit_whenGivenVals_takeVals() {
        let manager1 = CalculationManager(valueA: 10, valueB: 10, currentOperand: .multiply, valueEntryArray: [])
        let manager2 = CalculationManager(valueA: 10, valueB: 10, currentOperand: .multiply, valueEntryArray: [])
        XCTAssertEqual(manager1, manager2)
        
    }
}
