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
    var newLabelMessage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNextViewButton()
        setupDataLabel()
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        let second = SecondViewController()
////        let first = ViewController()
//        second.delegate = self
//        second.sendString()
//        
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("1")
        
        let second = SecondViewController()
        //        let first = ViewController()
        second.delegate = self
//        second.sendString()
        second.sendMessage()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("2")
        let second = SecondViewController()
        //        let first = ViewController()
        second.delegate = self
//        second.sendString()
        second.sendMessage()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//
//        if self.isMovingFromParent {
//            print("1")
//        }
//        if self.isBeingDismissed {
//            print("2")
//        }
//        if self.navigationController?.isBeingDismissed ?? false {
//            print("3")
//        }
//    }
    
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
        dataLabel.text = ""
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
        
        
//        @IBAction func openView(_ sender: Any) {
//                let storyboard = UIStoryboard(name: "View2", bundle: nil)
//                let view2viewController = storyboard.instantiateViewController(withIdentifier: "view2viewController") as! view2viewController
//
//                view2viewController.delegate = self
//                view2viewController.modalPresentationStyle = .fullScreen
//                present(view2viewController, animated: true, completion: nil)
    }

}

extension ViewController: LabelDelegate {
    func receiveLabelText(labelMessage: String) {
        
        print("text", labelMessage)
        self.dataLabel.text = labelMessage
//        newLabelMessage = labelMessage
    }
}


//Создать два экрана. +
//На первом экране UILabel и кнопка +
//По нажатию на кнопку, происходит переход на второй экран. +
//На втором экране 3 текстовых поля и кнопка сохранить. +
//По нажатию на кнопку, введенные данные передаются на первый экран в UILabel, и второй экран закрывается.
//Сделать через делегат

