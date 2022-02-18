//
//  Service.swift
//  PostsTest
//
//  Created by Guzlat on 18/2/22.
//

import Foundation
import Alamofire

class Service {
    fileprivate var baseUrl = ""
    
    init(baseUrl: String){
        self.baseUrl = baseUrl
    }
    
    func getPostList(_ endPoint: String, _ completion: @escaping ( _ result: Bool, [Post]?) -> () ){
        guard let url = URL(string: baseUrl + endPoint) else {
            print("url not invalid service")
            completion(false, nil)
            return
        }
        AF.request(url).response{ (response) in
            guard let data = response.data else { return }
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(true, posts)
            } catch {
                print("error decoding service: \(error)")
                completion(false, nil)
            }
        }
    }
    
    func addNewPost(_ endPoint: String, _ post: [String: Any], _ completion: @escaping (_ result: Bool) -> () ){
        guard let url = URL(string: baseUrl + endPoint) else {
            print("url not invalid service")
            completion(false)
            return
        }
    //    let param = ["description": post]
        AF.request(url, method: .post,
                   parameters: post,
                   encoding: JSONEncoding.prettyPrinted).response { response in
            if let error = response.error {
                print("some Error: \(String(describing: error))")
                completion(false)
                return
            }
            guard let _ = response.data else { return }
            completion(true)
      }
    }
}
