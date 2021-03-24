//
//  SegundaViewController.swift
//  TesteiOSDia01
//
//  Created by Cristiane Goncalves Uliana on 09/03/21.
//  Copyright © 2021 Cristiane Goncalves Uliana. All rights reserved.
//

import Foundation
import UIKit

struct CalculosBeca {
    static let constA = 12
    static let soma = 3
    static let somaMaisUm = 1
}

class SegundaViewController: UIViewController {
    var status = "vazio"
    
    @IBOutlet weak var btClose: UIButton!
    @IBOutlet weak var endFull: UILabel!
   
    @IBAction func btExit(_ sender: Any) {
        let constA = CalculosBeca.constA
        var varX = constA + CalculosBeca.soma
        varX = varX + CalculosBeca.somaMaisUm
        print(varX)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        status = "viewDidLoad"
        setupUI()
        print(status)
        makeRequest()
    }
    
    private func makeRequest() {
        let url = URL( string: "https://51efcd59-27c0-4d77-abd6-0ae6e0951c14.mock.pstmn.io/cepbr")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print(response)
            guard let responseData = data else { return }
            if let responseString = String(data: responseData, encoding: .utf8) {
                print(responseString)
            }
            
            do {
                let cep = try JSONDecoder().decode(Ceps.self, from: responseData)
                guard let logradouro = cep.logradouro else { return }
                guard let number = cep.number else { return }
                guard var complemento = cep.complemento else { return }
                if !complemento.isEmpty {
                    complemento = " / \(complemento)"
                }
             
                self.endFull.text = "\(logradouro), \(number)\(complemento)"
             
                print("Endereço: \(logradouro), \(number)\(complemento)")
            } catch let error {
                print("error: \(error)")
            }
        }
        task.resume()
    }
    
    private func setupUI() {
        btClose.setTitle("Clicado!", for: .highlighted)
      }
    

    override func viewWillAppear(_ animated: Bool) {
        status = "viewWillAppear"
        print(status)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        status = "viewDidAppear"
        print(status)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        status = "viewWillDisappear"
        print(status)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        status = "viewDidDisappear"
        print(status)
    }
    
    
}
