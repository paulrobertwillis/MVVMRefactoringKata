//
//  ViewModelTests.swift
//  ViewModelTests
//
//  Created by Paul on 28/09/2022.
//

@testable import MVVMRefactoringKata
import XCTest
import UIKit

class ViewModelTests: XCTestCase {
    
    func test_viewModel_configuredCorrectlyWhenInstantiated() {
        let viewModel = ViewModel()
        
        XCTAssertEqual(viewModel.backgroundColour, .yellow)
        XCTAssertEqual(viewModel.countValueLabelText, "Times Pressed: 0")
        XCTAssertEqual(viewModel.pressMeButtonIsEnabled, true)
        XCTAssertEqual(viewModel.countValue, 0)
    }
    
    func test_viewModel_whenPressMeButtonIsTapped_shouldIncrementCountValue() {
        let viewModel = ViewModel()
        
//        let oldValue = viewModel.countValue
        viewModel.didTapPressMeButton()
        
        XCTAssertEqual(viewModel.countValue, 1)
        XCTAssertEqual(viewModel.countValueLabelText, "Times Pressed: 1")
    }
    
    func test_viewModel_givenCountValueIs9_whenPressMeButtonIsTapped_then() {
        let viewModel = ViewModel()
        viewModel.countValue = 9
        
        viewModel.didTapPressMeButton()
        
        XCTAssertEqual(viewModel.countValue, 10)
        XCTAssertEqual(viewModel.countValueLabelText, "Times Pressed: 10")
        XCTAssertEqual(viewModel.backgroundColour, .green)
        XCTAssertEqual(viewModel.pressMeButtonIsEnabled, false)
    }
    
    func test_viewModel_givenCountValueIs10_whenPressMeButtonIsTapped_then() {
        let viewModel = ViewModel()
        viewModel.countValue = 10
        
        viewModel.didTapPressMeButton()
        
        XCTAssertEqual(viewModel.countValue, 10)
        XCTAssertEqual(viewModel.countValueLabelText, "Times Pressed: 10")
        XCTAssertEqual(viewModel.backgroundColour, .green)
        XCTAssertEqual(viewModel.pressMeButtonIsEnabled, false)
    }
    
}
