//
//  PostsVC.swift
//  PostsTest
//
//  Created by Guzlat on 18/2/22.
//

import UIKit

class PostsVC: UIViewController {

    private let tableView = UITableView()
    private var viewModel: PostsVM
    private var manager : PostTVManager
    
    init(_ viewModel: PostsVM){
        self.viewModel = viewModel
        self.manager = .init(viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getPostList {result in
            print("got post list VC")
            result  ? self.tableView.reloadData()
                    : self.alertResult(title: "Error", message: "Something went wrong")
        }
        initUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        manager.delegate = self
    }
    
    private func initUI(){
        title = "Posts"
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: self, action: #selector(addNewPost))
    
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40.0)
        }
        tableView.register(PostTVCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = manager
        tableView.dataSource = manager
    }
    
    @objc private func addNewPost(sender: Any){
        let addPostAlert = UIAlertController(title: "New post",
                                             message: "Enter a new post",
                                             preferredStyle: .alert)

        addPostAlert.addTextField { (titleTF) in
               titleTF.text = ""
               titleTF.placeholder = "Title"
           }
        addPostAlert.addTextField(configurationHandler: { (bodyTF) in
               bodyTF.text = ""
               bodyTF.placeholder = "Description"
           })
        
        addPostAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak addPostAlert] (_) in
            
               let titleTF = addPostAlert?.textFields![0] // Force unwrapping because we know it exists.
               let bodyTF = addPostAlert?.textFields![1]

               let title = titleTF?.text
               let body = bodyTF?.text
               let userId = Int.random(in: 1..<50)

            
               if title == "" || body == "" {
                   print("fill the fields")
               } else {
                   let param = ["title": title, "body": body, "userId": userId] as [String : Any]
                   self.viewModel.addPost(param) { result in
                       print("post added VC : \(result)")
                       if(result) {
                           self.alertResult(title: "Succes", message: "Your post is added!")
                       } else {
                           self.alertResult(title: "Error", message: "Something went wrong!")
                       }
                   }
               }
        }))
        
        self.present(addPostAlert, animated: true, completion: nil)
    }
}

extension PostsVC: PostTVManagerDelegate {
    
    func didSelectPost(_ post: Post) {
        print("did select Viewcontroller")
        let detailVC = PostDetailVC(post)
        let nav = UINavigationController(rootViewController: detailVC)
        nav.modalPresentationStyle = .fullScreen
        navigationController?.present(nav, animated: true)
    }
}
