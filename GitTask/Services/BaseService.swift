//
//  BaseService.swift
//  MVVM-Movies
//
//  Created by Mario Acero on 1/14/18.
//  Copyright © 2018 Mario Acero. All rights reserved.
//

import Foundation
import Alamofire

typealias JsonDictionay = [String : Any]

enum ServiceResponse {
    case success(response: JsonDictionay)
    case failure
    case notConnectedToInternet
}

enum ResponseStatusCode: Int {
    case success = 200
}

class BaseService {
    
    var dataRequestArray: [DataRequest] = []
   
    
    func callEndPoint(endPoint: String, method: Alamofire.HTTPMethod = .get, headers: [String:String]? = [:], params: JsonDictionay? = [:], completion: @escaping (ServiceResponse) -> Void){
        let url = AppConstants.baseUrl + endPoint
        Alamofire.AF.request(url,
                             method: .get,
                             parameters: nil)
            
            .validate()
            .responseJSON { response in
              
                completion(.success(response:  response.result.value as! JsonDictionay))

    }
        
    }
    
    func userDetailsEndPoint(endPoint: String, method: Alamofire.HTTPMethod = .get, headers: [String:String]? = [:], params: JsonDictionay? = [:], completion: @escaping (ServiceResponse) -> Void){
        Alamofire.AF.request(endPoint,
                             method: .get,
                             parameters: nil)
            
            .validate()
            .responseJSON { response in
                let statusCode = response.response?.statusCode
                 if(statusCode == 200)
                 {
                 completion(.success(response: response.result.value as! JsonDictionay))
                }
                
        }
        
    }
}
    

