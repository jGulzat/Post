//
//  Post.swift
//  PostsTest
//
//  Created by Guzlat on 18/2/22.
//

import Foundation

struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
