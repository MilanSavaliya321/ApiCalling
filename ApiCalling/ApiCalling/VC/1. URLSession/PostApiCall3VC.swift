//
//  PostApiCall3VC.swift
//  ApiCalling
//
//  Created by Kartum Infotech on 17/08/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

//https://api-dev-scus-demo.azurewebsites.net/swagger/index.html

import UIKit




class PostApiCall3VC: UIViewController {
    
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
    
    func registerUserWithEncodableProtocol() {
        //code to register user!)
        let request = UserRegistrationRequest(Name: "milan", Email: "codecat15@gmail.com", Password: "1234")
        
        do {
            let requestBody = try JSONEncoder().encode(request)
            HttpUtility.shared.postApiData(requestUrl: URL(string: Endpoint.registerUser)!, requestBody: requestBody, resultType: UserRegistrationResponse.self) { (response) in
                if response.errorMessage.isEmpty {
                    print(response.data.email)
                    DispatchQueue.main.async {
                        self.txtView.text = String(describing: response)
                    }
                }
            }
            
        } catch let error {
            debugPrint(error.localizedDescription)
        }
        
        
        
        
        //        var urlRequest = URLRequest(url: URL(string: Endpoint.registerUser)!)
        //        urlRequest.httpMethod = "post"
        //
        //        let request = UserRegistrationRequest(Name: "milan", Email: "codecat15@gmail.com", Password: "1234")
        //
        //        do {
        //
        //            let requestBody = try JSONEncoder().encode(request)
        //            urlRequest.httpBody = requestBody
        //            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        //
        //        } catch let error {
        //            debugPrint(error.localizedDescription)
        //        }
        //
        //        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
        //
        //            if(data != nil && data?.count != 0)
        //            {
        //                do {
        //                    let response = try JSONDecoder().decode(UserRegistrationResponse.self, from: data!)
        //                    debugPrint(response.data.name)
        //                }
        //                catch let decodingError {
        //                    debugPrint(decodingError)
        //                }
        //            }
        //        }.resume()
    }
    
    private func registerUser() {
        var urlRequest = URLRequest(url: URL(string: Endpoint.registerUser)!)
        urlRequest.httpMethod = "post"
        let dataDict = ["name":"milan", "email":"milan@gmail.com", "password":"123456"]
        
        do {
            let requestBody = try JSONSerialization.data(withJSONObject: dataDict, options: .prettyPrinted)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if data != nil && data?.count != 0 {
                let respo = String(data: data!, encoding: .utf8)
                print(respo!)
                DispatchQueue.main.async {
                    self.txtView.text = respo!
                }
            }
            
        }.resume()
    }
    
    private func getUser() {
        var urlRequest = URLRequest(url: URL(string: Endpoint.getUser)!)
        urlRequest.httpMethod = "get"
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if data != nil && data?.count != 0 {
                let respo = String(data: data!, encoding: .utf8)
                print(respo!)
                DispatchQueue.main.async {
                    self.txtView.text = respo
                }
            }
        }.resume()
        
    }
    
    //MARK:- IBActions
    @IBAction func btnCall(_ sender: Any) {
        //Post
        //        registerUser()
        registerUserWithEncodableProtocol()
        //Get
        //        getUser()
    }
    
    
}

struct UserRegistrationRequest : Encodable
{
    let Name, Email, Password : String
    
    enum CodingKeys: String, CodingKey {
        case Name, Email, Password
    }
}

struct UserRegistrationResponse: Decodable {
    let errorMessage: String
    let data: UserData
}

// MARK: - DataClass
struct UserData: Decodable {
    let name, email, id, joining: String
}


