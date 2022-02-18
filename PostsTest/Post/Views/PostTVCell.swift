//
//  PostTVCell.swift
//  PostsTest
//
//  Created by Guzlat on 18/2/22.
//

import UIKit
import SnapKit

class PostTVCell: UITableViewCell {
    
    private var titleLbl: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Extra-Bold", size: 14)
        view.textColor = .black
        view.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/255, alpha: 1)
        view.backgroundColor = .white
        view.textAlignment = .left
        view.numberOfLines = 0
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    private var userLbl: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Montserrat-Extra-Bold", size: 12)
        view.textColor = .black
        view.backgroundColor = .white
        view.textAlignment = .right
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        contentView.layer.cornerRadius = 8.0
        contentView.addSubview(titleLbl)
        contentView.addSubview(userLbl)
        
        titleLbl.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(16.0)
        }
        
        userLbl.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(8.0)
            make.trailing.equalTo(titleLbl.snp.trailing)
            make.bottom.equalToSuperview().offset(-8.0)
        }
    }
    
    func setupPost(post: Post){
        self.titleLbl.text = post.title
        self.userLbl.text = String(post.userId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
