//
//  PostTVManager.swift
//  PostsTest
//
//  Created by Guzlat on 18/2/22.
//


import UIKit

protocol PostTVManagerDelegate: AnyObject {
    func didSelectPost(_ post: Post)
}

final class PostTVManager: NSObject {
    
    private var viewModel: PostsVM
    weak var delegate: PostTVManagerDelegate?
    
    init(_ viewModel: PostsVM) {
        self.viewModel = viewModel
    }
}

extension PostTVManager: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                     for: indexPath) as! PostTVCell
        let post = viewModel.getPost(indexPath.row)
        postCell.setupPost(post: post)
        return postCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = viewModel.getPost(indexPath.row)
        delegate?.didSelectPost(post)
      }
}
