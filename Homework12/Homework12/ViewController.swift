//
//  ViewController.swift
//  Homework12
//
//  Created by Наталья Мазур on 4.01.24.
//

import UIKit

// 4 - подписываем класс, в который передаём данные, на протокол

class ViewController: UIViewController, DataDelegate {
    
    // 5 - лейблу присваиваем значение текста из функции
    func sendData(_ data: String) {
        infoLabel.text = data
        
    }
    
    @IBOutlet weak var infoLabel: UILabel!
    
    
    @IBAction func openView(_ sender: Any) {
        // 6 -
        let storyboard = UIStoryboard(name: "View2", bundle: nil)
        let view2viewController = storyboard.instantiateViewController(withIdentifier: "View2ViewController") as! View2ViewController
        
        // 7 - присваиваем делегат "контроллера-трансмиттера" -> "контроллеру-ресиверу"
        view2viewController.delegate = self
        view2viewController.modalPresentationStyle = .fullScreen
        present(view2viewController, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
