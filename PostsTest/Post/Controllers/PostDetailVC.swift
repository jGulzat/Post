//
//  PostDetailVC.swift
//  PostsTest
//
//  Created by Guzlat on 18/2/22.
//


import UIKit

class PostDetailVC: UIViewController {
    private let post: Post
    
    private var titleLbl: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Bold", size: 16)
        view.textColor = .black
        view.backgroundColor = .white
        view.numberOfLines = 0
        view.sizeToFit()
        view.textAlignment = .center
        return view
    }()
    
    private var descriptionLbl: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Medium", size: 14)
        view.textColor = .black
        view.backgroundColor = .white
        view.numberOfLines = 0
        view.sizeToFit()
        view.textAlignment = .center
        view.layer.cornerRadius = 8.0
        return view
    }()
    
    init(_ post: Post){
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let backbutton = UIButton(type: .custom)
        let config = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "chevron.left", withConfiguration: config)

        backbutton.setImage(image, for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)

        view.addSubview(descriptionLbl)
        view.addSubview(titleLbl)
        
        titleLbl.text = post.title
        descriptionLbl.text = post.body
        titleLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100.0)
            make.trailing.leading.equalToSuperview().inset(24.0)
        }
        descriptionLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
        }
        
        
    }
    
    @objc func backButtonPressed() {
           dismiss(animated: true, completion: nil)
   //        navigationController?.popViewController(animated: true)
       }
}
