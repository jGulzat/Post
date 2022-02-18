//
//  PostsVM.swift
//  PostsTest
//
//  Created by Guzlat on 18/2/22.
//

import Foundation
import Alamofire

class PostsVM {
    private let service = Service(baseUrl: "https://jsonplaceholder.typicode.com/")
    private var _postList: [Post] = []
    
    
    func getPostList(_ completion: @escaping (_ result: Bool) -> () ){
        service.getPostList("posts") { result, posts in
           print("result VM: ")
            self._postList = posts!
            completion(result)
        }
    }
    
    func addPost(_ post: [String: Any], _ completion: @escaping (_ result: Bool) -> () ){
        service.addNewPost("posts", post) { result in
            completion(result)
        }
    }
    
    var numberOfRows: Int {
        get { _postList.count }
    }
        
    func getPost(_ at: Int) -> Post {
        _postList[at]
    }
}
