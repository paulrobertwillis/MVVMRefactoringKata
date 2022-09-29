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
    
    // MARK: - Private Properties
    
    private var sut: ViewModel!
    private var delegate: ViewModelDelegate!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        self.delegate = MockViewModelDelegate()
        
        let viewModelConfig = ViewModelConfig(
            backgroundColour: .yellow,
            countValueLabelText: "Times Pressed: 0",
            pressMeButtonIsEnabled: true
        )

        
        self.sut = ViewModel(delegate: self.delegate, viewModelConfig: viewModelConfig)
    }
    
    override func tearDown() {
        self.delegate = nil
        self.sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_viewModel_configuredCorrectlyWhenInstantiated() {
        XCTAssertEqual(self.sut.backgroundColour, .yellow)
        XCTAssertEqual(self.sut.countValueLabelText, "Times Pressed: 0")
        XCTAssertEqual(self.sut.pressMeButtonIsEnabled, true)
    }
    
    func test_viewModel_whenPressMeButtonIsTapped_shouldIncrementCountValue() {
        self.sut.didTapPressMeButton()
        
        XCTAssertEqual(self.sut.countValueLabelText, "Times Pressed: 1")
    }
    
    func test_viewModel_givenCountValueIs9_whenPressMeButtonIsTapped_then() {
        self.tapPressMeButton(times: 9)

        self.sut.didTapPressMeButton()
        
        XCTAssertEqual(self.sut.countValueLabelText, "Times Pressed: 10")
        XCTAssertEqual(self.sut.backgroundColour, .green)
        XCTAssertEqual(self.sut.pressMeButtonIsEnabled, false)
    }
    
    func test_viewModel_givenCountValueIs10_whenPressMeButtonIsTapped_then() {
        self.tapPressMeButton(times: 10)
        
        self.sut.didTapPressMeButton()
        
        XCTAssertEqual(self.sut.countValueLabelText, "Times Pressed: 10")
        XCTAssertEqual(self.sut.backgroundColour, .green)
        XCTAssertEqual(self.sut.pressMeButtonIsEnabled, false)
    }
    
    // TODO: Add outgoing command expectation tests using MockViewModelDelegate
    
    // MARK: - Helpers
    
    private func tapPressMeButton(times: Int) {
        for _ in 1...times {
            self.sut.didTapPressMeButton()
        }
    }
    
}

class MockViewModelDelegate: ViewModelDelegate {
    public var backgroundColourDidChangeWasCalled = false
    public var countValueLabelTextDidChangeWasCalled = false
    public var pressMeButtonIsEnabledDidChangeWasCalled = false
    
    func backgroundColourDidChange() {
        self.backgroundColourDidChangeWasCalled = true
    }
    
    func countValueLabelTextDidChange() {
        self.countValueLabelTextDidChangeWasCalled = true
    }
    
    func pressMeButtonIsEnabledDidChange() {
        self.pressMeButtonIsEnabledDidChangeWasCalled = true
    }
}
