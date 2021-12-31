//
//  ViewController.swift
//  imc-swift
//
//  Created by Isaque Moura on 31/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    
    @IBOutlet weak var viewResult: UIView!
    
    
    var imc: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func handleCalculate(_ sender: Any) {
        guard let peso = Double(tfWeight.text!) else {
            return
        }
        
        guard let altura = Double(tfHeight.text!)else {
            return
        }

        
        self.imc = peso / (altura * altura)
        
        showResult()
        
    }
    
    func showResult() {
        var result: String = ""
        var image:  String = ""
        
        switch self.imc {
            case 0..<16:
                result = "magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        viewResult.isHidden = false
        view.endEditing(true)
        lbResult.text = "imc: \(Int(self.imc)) - \(result)"
        imageResult.image = UIImage(named: image)
    }


}

