//
//  ViewController.swift
//  MVVMRefactoringKata
//
//  Created by Paul on 23/09/2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet private var mainView: UIView!
    @IBOutlet private weak var pressMeButton: UIButton!
    @IBOutlet private weak var countValueLabel: UILabel!
    
    // MARK: - Private Properties
    
    private lazy var viewModel: ViewModelProtocol = ViewModel(
        delegate: self,
        viewModelConfig: ViewModelConfig(
            backgroundColour: .yellow,
            countValueLabelText: "Times Pressed: 0",
            pressMeButtonIsEnabled: true
        )
    )
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        self.countValueLabel.text = self.viewModel.countValueLabelText
        self.mainView.backgroundColor = self.viewModel.backgroundColour
        self.pressMeButton.isEnabled = self.viewModel.pressMeButtonIsEnabled
    }
    
    // MARK: - IBActions

    @IBAction private func pressMeButtonTapped(_ sender: UIButton) {
        self.viewModel.didTapPressMeButton()
    }
}

// MARK: - ViewModelDelegate

extension ViewController: ViewModelDelegate {
    func backgroundColourDidChange() {
        self.mainView.backgroundColor = self.viewModel.backgroundColour
    }
    
    func countValueLabelTextDidChange() {
        self.countValueLabel.text = self.viewModel.countValueLabelText
    }
    
    func pressMeButtonIsEnabledDidChange() {
        self.pressMeButton.isEnabled = self.viewModel.pressMeButtonIsEnabled
    }
}
