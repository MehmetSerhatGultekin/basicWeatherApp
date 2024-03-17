//
//  DetailsVC.swift
//  WeatherApp
//
//  Created by Mehmet Serhat Gültekin on 17.03.2024.
//

import UIKit

class DetailsVC: UIViewController {
    
    var city = String()
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityNameLabel.text = city
        getTodayResult(cityName: city)
      
    }
    
    func getTodayResult(cityName: String) {
        
        if let url = URL(string: "https://api.openweathermap.org/data/3.0/weather?q=\(cityName)&appid=0f6112b1d663b03202ffabe9788c51ef"){
            
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    
                if error == nil {
                    
                    if let incomingData = data {
                        
                        do{
                            
                            let json = try JSONSerialization.jsonObject(with: incomingData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
                            if let main = json("main") as? NSDictionary {
                                
                                if let temp = main("temp") as? Double{
                                    
                                    let state = Int(temp - 273.15)
                                    
                                    DispatchQueue.main.sync {
                                        self.weatherLabel.text = String(state)
                                                            
                                    }
                                    
                                }
                                
                            }
                            
                        }catch {
                            print("Bir hata oluştu")
                        }
                            
                    }
                    
                }
                
            }
            task.resume()
            
        }
        
    }
    
}
