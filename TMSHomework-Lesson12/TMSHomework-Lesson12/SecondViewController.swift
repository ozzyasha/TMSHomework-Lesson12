//
//  SecondViewController.swift
//  TMSHomework-Lesson12
//
//  Created by Наталья Мазур on 3.01.24.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: LabelDelegate?
    
    var textFieldArray = [UITextField]()
    var textField1 = UITextField()
    var textField2 = UITextField()
    var textField3 = UITextField()
    
    var textFieldStack = UIStackView()
    let saveButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldStack()
        setupSaveButton()
    }
    
    func sendString() {
        let message = "\(textField1.text ?? "er") + \(textField2.text ?? "er") + \(textField3.text ?? "er")"
        delegate?.receiveLabelText(labelMessage: message)
    }
    
    func appendTextFields() {
        textFieldArray.append(textField1)
        textFieldArray.append(textField2)
        textFieldArray.append(textField3)
    }
    
    func setupTextFieldStack() {
        textFieldStack.axis = .vertical
        textFieldStack.spacing = 50
        textFieldStack.alignment = .center
        
        appendTextFields()
        textFieldArray.forEach { textField in
            textField.backgroundColor = .systemGray6
            textField.placeholder = "  Введите текст  "
            textField.layer.cornerRadius = 5
            textField.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
            textFieldStack.addArrangedSubview(textField)
        }
        
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldStack)
        setupTextFieldStackConstraints()
    }
    
    func setupSaveButton() {
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = UIColor.systemBlue
        saveButton.layer.cornerRadius = 20
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(saveButton)
        setupSaveButtonConstraints()
    }
    
    func setupTextFieldStackConstraints() {
        NSLayoutConstraint.activate([
            textFieldStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func setupSaveButtonConstraints() {
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 20),
            saveButton.widthAnchor.constraint(equalToConstant: 250),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func saveButtonTapped() {
        sendString()
        navigationController?.popViewController(animated: true)
    }

}
