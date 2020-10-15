//
//  DefaultRequest.swift
//  Settings
//
//  Created by nayhan on 15.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
protocol DefaultRequestDelegate {
    func didComplete(result: String)
}

class DefaultRequest  {
    static let defaultService = DefaultRequest()
    var delegate = DefaultRequestDelegate.self
    func  postParamsRequest(url :String,parameters:Parameters  , completion: @escaping (Any?) ->Void)
    {
       
        Alamofire.request(url, method: .post, parameters: parameters  , encoding: URLEncoding(destination: .queryString)).responseJSON(completionHandler: { (response ) in 
            switch (response.result){
            case .success(_):
                if let data = response.result.value{
                    let jsonObject:NSDictionary = data as! NSDictionary
                    completion((jsonObject))
                }
                break
            case .failure(_):
                 break
            }
            return
        })
    }
    func  getParamsRequest(url :String,parameters:Parameters  , completion: @escaping (Any?) ->Void)
    {
        Alamofire.request(url   , method: .get, parameters: parameters, encoding: URLEncoding.default).responseJSON(completionHandler: { (response ) in
             
            switch (response.result){
            case .success(_):
                if let data = response.result.value{
                    let jsonObject = data
                    completion((jsonObject))
                }
                break
            case .failure(_):
                break
            }
            return
        })
    }
    func  getRequest(url :String  , completion: @escaping (Any?) ->Void)
       {
        Alamofire.request(url, method: .get, encoding: URLEncoding.default).responseJSON(completionHandler: { (response ) in
               switch (response.result){
               case .success(_):
                   if let data = response.result.value{
                       let jsonObject = data
                       completion((jsonObject))
                   }
                   break
               case .failure(_):
                 break
               }
               return
           })
       }
}
