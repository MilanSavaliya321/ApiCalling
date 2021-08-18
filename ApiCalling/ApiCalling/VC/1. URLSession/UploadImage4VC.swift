//
//  UploadImage4VC.swift
//  ApiCalling
//
//  Created by Kartum Infotech on 17/08/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class UploadImage4VC: UIViewController {
    
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
    
    //MARK:- IBActions
    @IBAction func btnCall(_ sender: Any) {
        
    }
    
    
}


struct ImageResponse : Decodable
{
    let path: String
}

struct ImageRequest : Encodable
{
    let attachment : String
    let fileName : String
}

// use this for uploading images with byte array, and if you want me to give a session on what is byte array or base64 I am just a comment or an email away
//struct ImageRequest : Encodable
//{
//    let attachment : Data
//    let fileName : String
//}
