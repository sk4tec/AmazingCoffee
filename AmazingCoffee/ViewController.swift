//
//  ViewController.swift
//  AmazingCoffee
//
//  Created by Sunjay Kalsi on 13/07/2021.
//

import UIKit
import Alamofire
import SwiftyJSON


let apiBaseURL = "https://api.foursquare.com/v2/venues/explore"
let clientId = "14X4CLJR23QG3U53AJNYXFO5WC3SNWENWZNQFDO45CERROQ0"
let clientSecrect = "02FWFLU4GLGT3LYPSJGAKZSXM5E0KXPYACSR0JPRWHTETLWX"
let apiVersion = "20180323"
let radius = "100"
let latLong = "40.7243,-74.0018"
let section = "coffee"

struct CoffeeShopModel {
    
}

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData(completion: { data in
          print(data)
        })
    }
    
    func loadData(completion: @escaping (CoffeeShopModel?) -> Void) {
        
        let completeUrl = "\(apiBaseURL)?client_id=\(clientId)&client_secret=\(clientSecrect)&v=\(apiVersion)&radius=\(radius)&ll=\(latLong)&section=\(section)"
           
           var CoffeeShopModel: CoffeeShopModel? = nil
           
           AF.request(completeUrl).responseJSON { response in
               switch response.result {
               case .success(let value):
                   let json = JSON(value)
                   print(json)

                   completion(CoffeeShopModel)
               case .failure(let error):
                   print(error)
                   completion(nil)
                  
               }
           }
       }}



