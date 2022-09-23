//
//  ViewController.swift
//  MVVMRefactoringKata
//
//  Created by Paul on 23/09/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var pressMeButton: UIButton!
    @IBOutlet weak var countValueLabel: UILabel!
    
    private var countValue: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countValueLabel.text = String(self.countValue)
    }

    @IBAction func pressMeButtonTapped(_ sender: UIButton) {
        self.countValue += 1
        
        if self.countValue == 10 {
            self.mainView.backgroundColor = .green
        }
    }
}
