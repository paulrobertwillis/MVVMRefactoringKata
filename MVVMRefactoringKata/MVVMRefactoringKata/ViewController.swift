//
//  ViewController.swift
//  MVVMRefactoringKata
//
//  Created by Paul on 23/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var pressMeButton: UIButton!
    @IBOutlet private weak var countValueLabel: UILabel!
    
    private var countValue: Int = 0 {
        didSet {
            self.countValueLabel.text = String("Times Pressed: \(self.countValue)")
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countValueLabel.text = String("Times Pressed: \(self.countValue)")
    }
    
    // MARK: - IBActions

    @IBAction func pressMeButtonTapped(_ sender: UIButton) {
        self.countValue += 1
        
        if self.countValue == 10 {
            self.pressMeButton.isEnabled = false
            self.mainView.backgroundColor = .green
        }
    }
}
