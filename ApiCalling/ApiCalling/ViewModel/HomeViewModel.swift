//
//  HomeViewModel.swift
//  LiveWallpaperRingtoneDev
//
//  Created by Kartum Infotech on 12/08/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import Foundation

enum ApiType: String {
    case urlsessionjson = "1. URLSession - JSONSerialization"
    case jsondecoder = "2. URLSession - JsonDecoder"
    case postapi = "3. POST Api call"
    case postuploadimage = "4. POST ImageUpload - Base64,ByteArry,Multipart/form-data"
}

class HomeViewModel: NSObject {
    
    //MARK: - Properties
    var arrApi = [ApiType]()
    
    //MARK: - Init
    override init() {
        super.init()
        generateSections()
    }
    
    //MARK: - Functions
    private func generateSections() {
        arrApi.append(.urlsessionjson)
        arrApi.append(.jsondecoder)
        arrApi.append(.postapi)
        arrApi.append(.postuploadimage)
    }
}
