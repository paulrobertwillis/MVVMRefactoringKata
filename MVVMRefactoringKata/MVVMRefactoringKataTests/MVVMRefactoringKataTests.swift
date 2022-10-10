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
    
    func test_givenViewModelIsLoaded_whenButtonIsTapped_thenValuesShouldBeUpdatedAccordingly() {
        self.sut.didTabPressMeButton()
        
        XCTAssert(self.sut.countValue == 1)
        XCTAssert(self.sut.countValueLabelText == "Times Pressed: 1")
    }
    
    func test_givenViewModelIsLoaded_whenButtonIsTappedTwice_thenValuesShouldBeUpdatedAccordingly() {
        self.sut.didTabPressMeButton()
        self.sut.didTabPressMeButton()
        
        XCTAssert(self.sut.countValue == 2)
        XCTAssert(self.sut.countValueLabelText == "Times Pressed: 2")
    }
}
