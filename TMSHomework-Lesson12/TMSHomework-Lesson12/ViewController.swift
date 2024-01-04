//
//  ViewController.swift
//  TMSHomework-Lesson12
//
//  Created by Наталья Мазур on 31.12.23.
//

import UIKit



class ViewController: UIViewController {

    var dataLabel = UILabel()
    let nextViewButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let second = SecondViewController()
//        let first = ViewController()
        second.delegate = self
        second.sendString()
        
        setupNextViewButton()
        setupDataLabel()
        
        
    }
    
    func setupNextViewButton() {
        nextViewButton.setTitle("Переход на второй экран", for: .normal)
        nextViewButton.setTitleColor(.white, for: .normal)
        nextViewButton.backgroundColor = UIColor.systemBlue
        nextViewButton.layer.cornerRadius = 20
        nextViewButton.addTarget(self, action: #selector(nextViewButtonTapped), for: .touchUpInside)
        nextViewButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nextViewButton)
        setupNextButtonConstraints()
    }
    
    func setupDataLabel() {
//        dataLabel.text = "Label"
        dataLabel.textColor = .black
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dataLabel)
        setupDataLabelConstraints()
    }
    
    func setupNextButtonConstraints() {
        NSLayoutConstraint.activate([
            nextViewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            nextViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextViewButton.widthAnchor.constraint(equalToConstant: 250),
            nextViewButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupDataLabelConstraints() {
        NSLayoutConstraint.activate([
            dataLabel.topAnchor.constraint(equalTo: nextViewButton.bottomAnchor, constant: 50),
            dataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func nextViewButtonTapped() {
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        let secondVC: UIViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        secondVC.modalPresentationStyle = .fullScreen
        
        if let navigationController = navigationController {
            navigationController.pushViewController(secondVC, animated: true)
        } else {
            let navController = UINavigationController(rootViewController: secondVC)
            navController.navigationBar.prefersLargeTitles = true
            present(navController, animated: true, completion: nil)
        }
    }

}

extension ViewController: LabelDelegate {
    func receiveLabelText(labelMessage: String) {
        
        print("text", labelMessage)
        self.dataLabel.text = "\(labelMessage)"
    }
}


//Создать два экрана. +
//На первом экране UILabel и кнопка +
//По нажатию на кнопку, происходит переход на второй экран. +
//На втором экране 3 текстовых поля и кнопка сохранить. +
//По нажатию на кнопку, введенные данные передаются на первый экран в UILabel, и второй экран закрывается.
//Сделать через делегат

