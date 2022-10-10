//
//  ViewModel.swift
//  MVVMRefactoringKata
//
//  Created by Paul on 10/10/2022.
//

import Foundation
import UIKit

class ViewModel {
    
    let backgroundColour: UIColor = .yellow
    var countValue: Int = 0
    let isPressMeButtonEnabled: Bool = true
    
    lazy var countValueLabelText: String = {
        "Times Pressed: \(self.countValue)"
    }()
    
    func didTabPressMeButton() {
        self.countValue += 1
    }

}

