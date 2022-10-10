//
//  ViewModel.swift
//  MVVMRefactoringKata
//
//  Created by Paul on 10/10/2022.
//

import Foundation
import UIKit

protocol ViewModelDelegate {
    func didChangeBackgroundColour()
    func didChangePressMeButtonState()
    func didChangeCountValueLabelText()
}

public struct ViewModelConfig {
    let backgroundColour: UIColor
    let countValueLabelText: String
    let isPressMeButtonEnabled: Bool
}

class ViewModel {
    
    // MARK: - Public Properties
    
    var backgroundColour: UIColor {
        didSet {
            self.delegate?.didChangeBackgroundColour()
        }
    }
    
    var countValueLabelText: String {
        didSet {
            self.delegate?.didChangeCountValueLabelText()
        }
    }

    var isPressMeButtonEnabled: Bool {
        didSet {
            self.delegate?.didChangePressMeButtonState()
        }
    }
    
    // MARK: - Private Properties
    
    private var countValue: Int = 0 {
        didSet {
            self.countValueDidChange()
        }
    }
    
    private var delegate: ViewModelDelegate?
    
    // MARK: - Init
    
    init(delegate: ViewModelDelegate, config: ViewModelConfig) {
        self.delegate = delegate
        self.backgroundColour = config.backgroundColour
        self.countValueLabelText = config.countValueLabelText
        self.isPressMeButtonEnabled = config.isPressMeButtonEnabled
    }

    // MARK: - API
    
    func didTabPressMeButton() {
        guard self.isPressMeButtonEnabled else {
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
        
        if self.countValue == 10 {
            self.isPressMeButtonEnabled = false
            self.backgroundColour = .green
        }
    }
}

