//
//  FileManager.swift
//  Daelim_Complaint
//
//  Created by U0ha on 25/10/2019.
//  Copyright © 2019 U0ha. All rights reserved.
//

import UIKit
import Alamofire


class DLFileManager: NSObject , FileManagerDelegate {

    
    
    let fileManager = FileManager()
    
    func downLoadUrl(url:String){
        //http://mbasstest.daelim.co.kr:7008/MbassBim/Bimfiledownload.action?cd_site=160389&cd_tppg=84A

            let strDownUrl = url

//            let fileManager = FileManager.default
//            let directoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]

            Alamofire.request(strDownUrl).downloadProgress(closure : { (progress) in
               print(progress.completedUnitCount)

            }).responseData{ (response) in
                print(response)
                print(response.result.value!)
                print(response.result.description)
                let randomString = NSUUID().uuidString
                if let data = response.result.value {

                   let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                   let videoURL = documentsURL.appendingPathComponent("\(randomString)")
                   do {
                       try data.write(to: videoURL)
                        print("Suuuuccccccccc")
                        print(videoURL)

                   } catch {
                       print("Something went wrong!")
                   }

               }
           }
        
        
        
    }
    
    
    
    func fileUpload(){
        
        let image = UIImage.init(named: "jpgtest.jpg")
        let imgData = image!.jpegData(compressionQuality: 1.0)!
//        let imgData = image!.pngData()!
        let server_url = SERVER_API_DOMAIN + "URL_FILE_UPLOAD"
        
        let headers: HTTPHeaders = [
            /* "Authorization": "your_access_token",  in case you need authorization header */
            "Content-type": "multipart/form-data",
            "charset":"utf-8",
            "Content-Disposition" : "form-data"
        ]
        
        let parameters = ["name":"uploads",
                          "Content-Disposition":"form-data",
                          "Content-Transfer-Encoding":"binary",
                          "filename":"dbdudgk"] //Optional for extra parameter
        
        

        Alamofire.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imgData, withName: "fileset",fileName: "file.jpg", mimeType: "image/jpg")
                for (key, value) in parameters {
                        multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                    } //Optional for extra parameters
            },
                         to:server_url ,headers: headers)
        { (result) in
            switch result {

            case .success(let upload, _, _):

                print("test prinet result")
                upload.uploadProgress(closure: { (progress) in
                    print("Upload Progress: \(progress.fractionCompleted)")
                })

//                upload.responseJSON { response in
//                    print("test prinet response")
//                     print(response.result.value)
//                }
                
                upload.responseString(completionHandler: { string in
                    print("respons")
                    print(string)
                })

            case .failure(let encodingError):
                print(encodingError)
            }
        }
        
        
//        let fileURL = Bundle.main.url(forResource: "img_upload", withExtension: "png")
//
//        Alamofire.upload(
//            multipartFormData: { multipartFormData in
//                multipartFormData.append(fileURL!, withName: "unicorn")
//                multipartFormData.append(fileURL!, withName: "rainbow")
//            },
//            to: server_url,
//            encodingCompletion: { encodingResult in
//                switch encodingResult {
//                case .success(let upload, _, _):
//                    upload.responseJSON { response in
//                        debugPrint(response)
//                    }
//                case .failure(let encodingError):
//                    print(encodingError)
//                }
//            }
//        )
        
    }
    
    
    
    func newFileUpload(){
        
        let server_url = SERVER_API_DOMAIN + "URL_FILE_UPLOAD"

        
        
    }
    
    
    func myImageUploadRequest()
    {
        let image = UIImage.init(named: "jpgtest.jpg")
        let imgData = image!.jpegData(compressionQuality: 1.0)!
        let server_url = SERVER_API_DOMAIN + "URL_FILE_UPLOAD"

        let filename = "jpgtest.jpg"

        // generate boundary string using a unique per-app string
        let boundary = "0z3fFshAerp"

        let fieldName = "reqtype"
        let fieldValue = "fileupload"

        let fieldName2 = "userhash"
        let fieldValue2 = "caa3dce4fcb36cfdf9258ad9c"

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        // Set the URLRequest to POST and to the specified URL
        var urlRequest = URLRequest(url: URL(string: server_url)!)
        urlRequest.httpMethod = "POST"

        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var data = Data()

        // Add the reqtype field and its value to the raw http request data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(fieldName)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(fieldValue)".data(using: .utf8)!)

        // Add the userhash field and its value to the raw http reqyest data
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(fieldName2)\"\r\n\r\n".data(using: .utf8)!)
        data.append("\(fieldValue2)".data(using: .utf8)!)

        
        
        for _ in 0...0
        {
            // Add the image data to the raw http request data
            data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
            data.append("Content-Disposition: form-data; name=\"uploads\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
            data.append("Content-Type: image/jpg\r\n\r\n".data(using: .utf8)!)
            data.append(imgData)
        }
        
        
        // End the raw http request data, note that there is 2 extra dash ("-") at the end, this is to indicate the end of the data
        // According to the HTTP 1.1 specification https://tools.ietf.org/html/rfc7230
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        // Send a POST request to the URL, with the data we created earlier
        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            
            if(error != nil){
                print("\(error!.localizedDescription)")
            }
            
            guard let responseData = responseData else {
                print("no response data")
                return
            }
            
            if let responseString = String(data: responseData, encoding: .utf8) {
                print("uploaded to: \(responseString)")
            }
        }).resume()
         
        
    }


    
    
    
    
    func checkFile(){
        //파일 존재여부 체크

        var newDir:String?
        
        newDir = newDir! + "/test01.txt" //해당 디렉토리에 test01.txt 파일이 있는지 체크

        if fileManager.fileExists(atPath: newDir!) {

            NSLog("File exists")

        }else{

            NSLog("File not found")

            //파일 생성

            if fileManager.createFile(atPath: newDir!, contents: nil, attributes:nil) {

                print("파일 생성 완료!") // 없으면 파일 생성

            }else{

                print("파일 생성 실패!")

            }

        }


    }
}


extension Data{
mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
    if let data = string.data(using: encoding) {
        append(data)
    }
}
}
