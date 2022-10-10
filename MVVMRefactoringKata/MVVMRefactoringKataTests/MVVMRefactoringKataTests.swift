//
//  MVVMRefactoringKataTests.swift
//  MVVMRefactoringKataTests
//
//  Created by Paul on 10/10/2022.
//

import XCTest
@testable import MVVMRefactoringKata

class MVVMRefactoringKataTests: XCTestCase {
    
    // MARK: - Private Variables
    
    private var delegate: MockViewModelDelegate!
    private var sut: ViewModel!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        self.delegate = MockViewModelDelegate()
        
        let config = ViewModelConfig(
            backgroundColour: .yellow,
            countValueLabelText: "Times Pressed: 0",
            isPressMeButtonEnabled: true
        )
        
        self.sut = ViewModel(delegate: self.delegate, config: config)
    }
    
    override func tearDown() {
        self.delegate = nil
        self.sut = nil
        
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func test_givenViewModelIsLoaded_thenShouldBeConfiguredCorrectly() {
        XCTAssert(self.sut.backgroundColour == .yellow)
        XCTAssert(self.sut.countValueLabelText == "Times Pressed: 0")
        XCTAssert(self.sut.isPressMeButtonEnabled == true)
    }
    
    func test_givenViewModelIsLoaded_whenButtonIsTapped_thenValuesShouldBeUpdatedAccordingly() {
        self.sut.didTabPressMeButton()
        
        XCTAssert(self.sut.countValueLabelText == "Times Pressed: 1")
    }
    
    func test_givenViewModelIsLoaded_whenButtonIsTappedTwice_thenValuesShouldBeUpdatedAccordingly() {
        self.sut.didTabPressMeButton()
        self.sut.didTabPressMeButton()
        
        XCTAssert(self.sut.countValueLabelText == "Times Pressed: 2")
    }
    
    func test_givenCountValueIsNine_whenButtonIsTapped_thenValuesShouldBeUpdatedAccordingly() {
        self.tapPressMeButton(times: 9)
        
        self.sut.didTabPressMeButton()
        
        XCTAssert(self.sut.backgroundColour == .green)
        XCTAssert(self.sut.countValueLabelText == "Times Pressed: 10")
        XCTAssert(self.sut.isPressMeButtonEnabled == false)
    }
    
    func test_givenCountValueisTen_whenButtonIsTapped_thenValuesShouldNotBeUpdated() {
        self.tapPressMeButton(times: 10)
        
        self.sut.didTabPressMeButton()
        
        XCTAssert(self.sut.backgroundColour == .green)
        XCTAssert(self.sut.countValueLabelText == "Times Pressed: 10")
        XCTAssert(self.sut.isPressMeButtonEnabled == false)
    }
    
    // TODO: Add outgoing command expectations using MockViewModelDelegate
    
    func test_givenCountValueIsNine_whenButtonIsTapped_thenDelegateFunctionsShouldBeCalled() {
        self.tapPressMeButton(times: 9)
        
        self.sut.didTabPressMeButton()
                
        XCTAssertTrue(self.delegate.didChangeBackgroundColourWasCalled)
        XCTAssertTrue(self.delegate.didChangePressMeButtonStateWasCalled)
        XCTAssertTrue(self.delegate.didChangeCountValueLabelTextWasCalled)
    }
    
    // MARK: - Helpers
    
    private func tapPressMeButton(times: Int) {
        for _ in 1...times {
            self.sut.didTabPressMeButton()
        }
    }
}

class MockViewModelDelegate {
    
    // MARK: - Public Properties
        
    public var didChangeBackgroundColourWasCalled = false
    public var didChangePressMeButtonStateWasCalled = false
    public var didChangeCountValueLabelTextWasCalled = false
}

// MARK: - ViewModelDelegate

extension MockViewModelDelegate: ViewModelDelegate {
    func didChangeBackgroundColour() {
        self.didChangeBackgroundColourWasCalled = true
    }
    
    func didChangePressMeButtonState() {
        self.didChangePressMeButtonStateWasCalled = true
    }
    
    func didChangeCountValueLabelText() {
        self.didChangeCountValueLabelTextWasCalled = true
    }
}
