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
    
    private var sut: ViewModel!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        
        self.sut = ViewModel()
    }
    
    override func tearDown() {
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
    
    // MARK: - Helpers
    
    private func tapPressMeButton(times: Int) {
        for _ in 1...times {
            self.sut.didTabPressMeButton()
        }
    }
}
