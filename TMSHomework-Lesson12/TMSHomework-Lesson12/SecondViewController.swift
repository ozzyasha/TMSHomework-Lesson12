//
//  SecondViewController.swift
//  TMSHomework-Lesson12
//
//  Created by Наталья Мазур on 3.01.24.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    let saveButton = UIButton(type: .system)
    let textFieldStack = UIStackView()
    var textFieldArray = [UITextField]()
    let textField1 = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    var message = "Label"
    
    weak var delegate: LabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFieldStack()
        setupSaveButton()
        
        if saveButton.isTouchInside {
            message = "\(textField1.text ?? "error") + \(textField2.text ?? "er") + \(textField3.text ?? "er")"
            delegate?.receiveLabelText(labelMessage: message)
        }
        
    }
    
    func sendString() {
        print("sending string")
        message = "\(textField1.text ?? "er") + \(textField2.text ?? "er") + \(textField3.text ?? "er")"
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
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        let first = ViewController()
//        first.dataLabel.text = ""
////        first.dataLabel.text! += textField.text!
//    
//
//        
//    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if !self.textField1.state.isEmpty && !self.textField2.state.isEmpty && !self.textField3.state.isEmpty {
//            message = "\(textField1.text) + \(textField2.text) + \(textField3.text)"
//            delegate?.receiveLabelText(labelMessage: message)
//        }
        return sendMessage()
    }
    
    func sendMessage() -> Bool {
        
        message = "\(textField1.text!) + \(textField2.text!) + \(textField3.text!)"
        delegate?.receiveLabelText(labelMessage: message)
        print(message)
        print(textField1.text as Any)
        return !self.textField1.state.isEmpty && !self.textField2.state.isEmpty && !self.textField3.state.isEmpty
    }
    
    @objc func saveButtonTapped() {
        
        print(textField1.text!)
        print(textField2.text!)
        print(textField3.text!)
//        self.delegate = delegate
        
//        let second = SecondViewController()
//        let first = ViewController()
//        
//        message = "\(textField1.text ?? "er") + \(textField2.text ?? "er") + \(textField3.text ?? "er")"
//        delegate?.receiveLabelText(labelMessage: message)
//        first.dataLabel.text = message
////        second.delegate = first
////        sendString()
//     
////        first.dataLabel.text = message
    
//        let first = ViewController()
//        self.delegate = first
//        self.sendString()
//        print("newLM: " + first.newLabelMessage)
//        
//        first.dataLabel.text = first.newLabelMessage
//        first.setupDataLabel()
////        print("newDLText : " + first.dataLabel.text!)
//        
//        textFieldDidEndEditing(textField1)
//        textFieldDidEndEditing(textField2)
//        textFieldDidEndEditing(textField3)
        
        navigationController?.popViewController(animated: true)
    }

}
