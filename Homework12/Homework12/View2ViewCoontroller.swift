//
//  View2ViewCoontroller.swift
//  Homework12
//
//  Created by Наталья Мазур on 4.01.24.
//

import Foundation
import UIKit

// 1 - протокол и функция без реализации
protocol DataDelegate: AnyObject{
    func sendData(_ data: String)
}


class View2ViewController: UIViewController{
    
    // 2 - объявляем делегат
    weak var delegate: DataDelegate?
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    
    // 3 - пишем функцию, где присваиваем текст, вызываем у делегаата функцию из протокола и через неё присваиваем текст data делегату
    @IBAction func sendTo(_ sender: Any) {
       
        var data = "\(text1.text ?? ""), \(text2.text ?? ""), \(text3.text ?? "")"
        
        delegate?.sendData(data)

        dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

}
