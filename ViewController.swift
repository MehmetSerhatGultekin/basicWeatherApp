//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mehmet Serhat Gültekin on 17.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var showButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showButton.layer.cornerRadius = 6
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    @IBAction func showButton(_ sender: UIButton) {
        let city = cityNameTextField.text ?? ""
        
        if city.isEmpty {
            let alert = UIAlertController(title: "UYARI", message: "Lütfen bir şehir adı giriniz!", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil )
            
            alert.addAction(cancelButton)
            
            self.present(alert, animated: true, completion: nil)
            
        }else {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
            vc.city = city
            
            self.show(vc, sender: nil)
        }
    }
    
}

