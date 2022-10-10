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
    
    // MARK: - Private Properties
    
    private lazy var viewModel = ViewModel(
        delegate: self,
        config: ViewModelConfig(
            backgroundColour: .yellow,
            countValueLabelText: "Times Pressed: 0",
            isPressMeButtonEnabled: true
        )
    )
        
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.backgroundColor = self.viewModel.backgroundColour
        self.pressMeButton.isEnabled = self.viewModel.isPressMeButtonEnabled
        self.countValueLabel.text = self.viewModel.countValueLabelText
    }
    
    // MARK: - IBActions

    @IBAction func pressMeButtonTapped(_ sender: UIButton) {
        self.viewModel.didTabPressMeButton()
    }
}

// MARK: - ViewModelDelegate

extension ViewController: ViewModelDelegate {
    func didChangeBackgroundColour() {
        self.mainView.backgroundColor = self.viewModel.backgroundColour
    }
    
    func didChangePressMeButtonState() {
        self.pressMeButton.isEnabled = self.viewModel.isPressMeButtonEnabled
    }
    
    func didChangeCountValueLabelText() {
        self.countValueLabel.text = self.viewModel.countValueLabelText
    }
}
