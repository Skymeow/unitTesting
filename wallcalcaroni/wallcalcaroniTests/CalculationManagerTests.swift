//
//  CalculationViewModelTests.swift
//  wallcalcaroniTests
//
//  Created by Sky Xu on 7/2/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import XCTest
@testable import wallcalcaroni
class CalculationViewModelTests: XCTestCase {
    
//    system under test
    var sut: CalculationViewModel!
    override func setUp() {
        super.setUp()
        sut = CalculationViewModel()
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testInit_whenGivenVals_takeVals() {
        let manager1 = CalculationViewModel(valueA: 10, valueB: 10, currentOperand: .multiply, valueEntryArray: [])
        let manager2 = CalculationViewModel(valueA: 10, valueB: 10, currentOperand: .multiply, valueEntryArray: [])
        XCTAssertEqual(manager1, manager2)
    }
    
    func testValuesChange_whenInsert() {
        sut.insert(value: 10)
        XCTAssertEqual(sut.valueA, 10)
    }
    
    func testOperandInitialNil(){
        XCTAssertNil(sut.currentOperand, "Operate should be nil first")
    }
    
    func testSettingOperand() {
//        sut.insert(value: 10)
        sut.set(operand: .subtract)
        XCTAssertNotNil(sut.currentOperand, "shouldn't be nil")
    }
    
    func testCalculate() {
        sut.insert(value: 10)
        sut.set(operand: .multiply)
        sut.insert(value: 5)
        XCTAssertEqual(sut.calculate(), 50)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
