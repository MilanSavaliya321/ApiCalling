//
//  ImageManager.swift
//  UploadImageSample
//
//  Created by CodeCat15 on 4/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//
import Foundation

// Hey there, I hope the video helped you, and if it did do like the video and share it with your iOS group. Do let me know if you have any questions on this topic and I will be happy to help you out :) ~ Ravi
struct ImageManager
{
    func uploadImage(data: Data, completionHandler: @escaping(_ result: ImageResponse) -> Void)
    {
        
        let imageUploadRequest = ImageRequest(attachment: data.base64EncodedString(), fileName: "multipartFormUploadExample")
        
        HttpUtility.shared.postApiDataWithMultipartForm(requestUrl: URL(string: Endpoint.uploadImageMultiPartForm)!, request: imageUploadRequest, resultType: ImageResponse.self) {
            (response) in
            
            _ = completionHandler(response)
            
        }
        
        // Upload image with base64 format
//        let imageUploadRequest = ImageRequest(attachment: data.base64EncodedString(), fileName: "base64Example")
//        do {
//            let postBody = try JSONEncoder().encode(imageUploadRequest)
//
//            HttpUtility.shared.postApiData(requestUrl: URL(string: Endpoint.uploadImage)!, requestBody: postBody, resultType: ImageResponse.self) { (response) in
//
//                _ = completionHandler(response)
//            }
//
//        } catch let error {
//            debugPrint(error)
//        }
        //----------------------------------------------------------------------------------
        
        // Upload image with byte array format
        // let imageUploadRequest = ImageRequest(attachment: data, fileName: "base64Example")
        //        do {
        //             let postBody = try JSONEncoder().encode(request)
        //
        //            HttpUtility.shared.postApiData(requestUrl: URL(string: Endpoints.uploadImageWithByteArray)!, requestBody: postBody, resultType: ImageResponse.self) { (response) in
        //
        //                _ = completionHandler(response)
        //            }
        //
        //        } catch let error {
        //            debugPrint(error)
        //        }
        
    }
}
