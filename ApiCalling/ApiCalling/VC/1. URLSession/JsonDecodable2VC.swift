//
//  Json Decodable2VC.swift
//  ApiCalling
//
//  Created by Kartum Infotech on 17/08/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class JsonDecodable2VC: UIViewController {
    
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtView: UITextView!
    
    //MARK:- Properties
    var responseString = ""
    
    //MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- Functions
    
    private func APi1() {
        
        let url = "http://demo0333988.mockable.io/Employees"
        
        HttpUtility.shared.getApiData(requestUrl: URL(string: url)!, resultType: [EmployeeResponse].self) { (result) in
            if result.count != 0 {
                for i in result {
                    print(i.name)
                    self.responseString += i.name
                }
            }
        }
        
        //        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
        //
        //            if error == nil && data != nil && data?.count != 0 {
        //                let decoder = JSONDecoder()
        //                do {
        //                    let result = try decoder.decode([EmployeeResponse].self, from: data!)
        //                    print(result)
        //
        //                    DispatchQueue.main.async {
        //                        for i in result {
        //                            print(i.employeeId)
        //                        }
        //                        self.txtView.text = String(describing: result)
        //                    }
        //
        //                } catch let error {
        //                    print(error.localizedDescription)
        //                }
        //
        //            } else {
        //                print("goto else")
        //            }
        //
        //        }.resume()
        
        
    }
    
    private func APi2() {
        let url = "http://demo0333988.mockable.io/getReports"
        
        
        HttpUtility.shared.getApiData(requestUrl: URL(string: url)!, resultType: ReportsResponse.self) { (result) in
            if result.reports.count != 0 {
                for i in result.reports {
                    print(i.labourHours)
                    self.responseString += i.labourHours
                }
                
                DispatchQueue.main.async {
                    self.txtView.text = self.responseString
                }
            }
        }
        
        //        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response ,error) in
        //
        //            if error == nil && data != nil && data?.count != 0 {
        //                let decoder = JSONDecoder()
        //                do {
        //                    let result = try decoder.decode(ReportsResponse.self, from: data!)
        //
        //                    DispatchQueue.main.async {
        //                        self.txtView.text = String(describing: result)
        //                    }
        //
        //                    for i in result.reports {
        //                        print(i.labourHours)
        //                    }
        //
        //                } catch let error {
        //                    print(error.localizedDescription)
        //                }
        //
        //            }
        //        }.resume()
        
    }
    
    //MARK:- IBActions
    
    @IBAction func btnCall(_ sender: Any) {
        APi1()
        APi2()
        
    }
    
    
}

//Api 1
struct EmployeeResponse : Decodable {
    let employeeId, depid: Int
    let salary: Double
    let name, role, joining, workPhone: String
    
    enum CodingKeys: String, CodingKey {
        case depid = "dep_id"
        case joining = "joining_date"
        case employeeId = "id"
        case salary
        case name, role, workPhone
    }
}


//APi 2
struct ReportsResponse: Decodable {
    let reports: [Report]
}

// MARK: - Report
struct Report: Decodable {
    let id, labourHours, totalCost: String
}



