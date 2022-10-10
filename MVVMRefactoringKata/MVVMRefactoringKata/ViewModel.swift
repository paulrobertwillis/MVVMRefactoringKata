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
//    func didChangeCountValueLabelText()
}

class ViewModel {
    
    // MARK: - Public Properties
    
    var backgroundColour: UIColor = .yellow {
        didSet {
            self.delegate?.didChangeBackgroundColour()
        }
    }
    
    lazy var countValueLabelText: String = {
        "Times Pressed: \(self.countValue)"
    }()

    var isPressMeButtonEnabled: Bool = true {
        didSet {
            self.delegate?.didChangePressMeButtonState()
        }
    }
    
    // MARK: - Private Properties
    
    private var countValue: Int = 0
    private var delegate: ViewModelDelegate?
    
    // MARK: - Init
    
    init(delegate: ViewModelDelegate) {
        self.delegate = delegate
    }

    // MARK: - API
    
    func didTabPressMeButton() {
        guard self.isPressMeButtonEnabled else {
            return
        }
        
        self.countValue += 1
        
        if self.countValue == 10 {
            self.isPressMeButtonEnabled = false
            self.backgroundColour = .green
        }
    }
}

