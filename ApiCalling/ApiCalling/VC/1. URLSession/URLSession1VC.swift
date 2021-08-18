//
//  URLSession1VC.swift
//  ApiCalling
//
//  Created by Kartum Infotech on 17/08/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class URLSession1VC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtView: UITextView!
    
    //MARK:- Properties
    
    
    //MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK:- Functions
    private func setupUI() {
        
    }
    
    private func callApi() {
        let session = URLSession.shared
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                let httpResponse = response as! HTTPURLResponse
                if httpResponse.statusCode == 200 {
                    let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    
                    let result = jsonData as! [String: Any]
                    DispatchQueue.main.async {
                        self.txtView.text = "\(result)"
                    }
                }
            }
        }
        
        task.resume()
    }
    
    //MARK:- IBActions
    @IBAction func onBtnCall(_ sender: Any) {
        callApi()
    }
    
    
    
}
