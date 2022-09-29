//
//  ViewModel.swift
//  MVVMRefactoringKata
//
//  Created by Paul on 28/09/2022.
//

import UIKit

class ViewModel {
    
    var backgroundColour: UIColor {
        self.countValue < 10 ? .yellow : .green
    }
    
    var countValueLabelText: String {
        "Times Pressed: \(self.countValue)"
    }
    
    var pressMeButtonIsEnabled: Bool {
        self.countValue < 10 ? true : false
    }
    
    var countValue = 0
    
    func didTapPressMeButton() {
        guard self.pressMeButtonIsEnabled else {
            return
        }
        
        self.countValue += 1
    }
}
