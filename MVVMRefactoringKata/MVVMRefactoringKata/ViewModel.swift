//
//  ViewModel.swift
//  MVVMRefactoringKata
//
//  Created by Paul on 28/09/2022.
//

import UIKit

protocol ViewModelDelegate {
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
    
    var backgroundColour: UIColor {
        didSet {
            self.delegate.backgroundColourDidChange()
        }
    }
    
    var countValueLabelText: String {
        didSet {
            self.delegate.countValueLabelTextDidChange()
        }
    }
    
    var pressMeButtonIsEnabled: Bool {
        didSet {
            self.delegate.pressMeButtonIsEnabledDidChange()
        }
    }
    
    // MARK: - Private Properties
    
    private var countValue = 0
    private let delegate: ViewModelDelegate
    
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
        
        self.countValue += 1
        
        // TODO: Move this functionality
        self.backgroundColour = self.countValue < 10 ? .yellow : .green
        self.countValueLabelText = "Times Pressed: \(self.countValue)"
        self.pressMeButtonIsEnabled = self.countValue < 10 ? true : false
    }
}
