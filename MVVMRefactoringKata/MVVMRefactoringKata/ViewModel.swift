//
//  ViewModel.swift
//  MVVMRefactoringKata
//
//  Created by Paul on 28/09/2022.
//

import UIKit

protocol ViewModelDelegate: AnyObject {
    func backgroundColourDidChange()
    func countValueLabelTextDidChange()
    func pressMeButtonIsEnabledDidChange()
}

protocol ViewModelProtocol {
    var backgroundColour: UIColor { get }
    var countValueLabelText: String { get }
    var pressMeButtonIsEnabled: Bool { get }
    
    func didTapPressMeButton()
}

struct ViewModelConfig {
    let backgroundColour: UIColor
    let countValueLabelText: String
    let pressMeButtonIsEnabled: Bool
}

class ViewModel: ViewModelProtocol {
    
    // MARK: - Public Properties
    
    var backgroundColour: UIColor = .green {
        didSet {
            self.delegate?.backgroundColourDidChange()
        }
    }
    
    var countValueLabelText: String {
        didSet {
            self.delegate?.countValueLabelTextDidChange()
        }
    }
    
    var pressMeButtonIsEnabled: Bool = true {
        didSet {
            self.delegate?.pressMeButtonIsEnabledDidChange()
        }
    }
    
    // MARK: - Private Properties
    
    private var countValue = 0 {
        didSet {
            self.countValueDidChange()
        }
    }
    
    private weak var delegate: ViewModelDelegate?
    
    // MARK: - Init
    
    init(delegate: ViewModelDelegate, viewModelConfig: ViewModelConfig) {
        self.delegate = delegate
        self.backgroundColour = viewModelConfig.backgroundColour
        self.countValueLabelText = viewModelConfig.countValueLabelText
        self.pressMeButtonIsEnabled = viewModelConfig.pressMeButtonIsEnabled
    }
    
    // MARK: - API
    
    public func didTapPressMeButton() {
        guard self.pressMeButtonIsEnabled else {
            return
        }
        
        self.incrementCountValue()
    }
    
    // MARK: - Helpers
    
    private func incrementCountValue() {
        self.countValue += 1
    }
    
    private func countValueDidChange() {
        self.countValueLabelText = "Times Pressed: \(self.countValue)"

        if self.countValue >= 10 {
            self.backgroundColour = .green
            self.pressMeButtonIsEnabled = false
        }
    }
}
