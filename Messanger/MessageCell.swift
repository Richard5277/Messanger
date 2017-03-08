//
//  MessageCell.swift
//  Messanger
//
//  Created by Feihong Zhao on 2017-03-03.
//  Copyright © 2017 Feihong Zhao. All rights reserved.
//

import UIKit
import SnapKit

class MessageCell: BaseCollectionViewCell {
    
    var message: Message? {
        didSet {
            nameLabel.text = message?.friend?.name
            messageLabel.text = message?.text
            
            if let userProfileImageName = message?.friend?.profileImageName {
                userPhoto.image = UIImage(named: userProfileImageName)
                hasReadImageView.image = UIImage(named: userProfileImageName)
            }
            
            if let date = message?.date {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "h:mm a"

//                let elapsedTimeInSeconds = NSDate().timeIntervalSince(date as Date)
                let elapsedTimeInSeconds = Date().timeIntervalSince(date as Date)
                let secondInDays: TimeInterval = 24 * 60 * 60
                if elapsedTimeInSeconds > 7 * secondInDays {
                    dateFormatter.dateFormat = "MM/dd/yy"
                }else if elapsedTimeInSeconds > secondInDays {
                    dateFormatter.dateFormat = "EEE"
                }
                
                timeLabel.text = dateFormatter.string(from: date as Date)
            }
            
        }
    }
    
    override var isHighlighted: Bool {
        
        didSet {
            backgroundColor = isHighlighted ? UIColor.blue : UIColor.white
            nameLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
            timeLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
            messageLabel.textColor = isHighlighted ? UIColor.white : UIColor.black
        }
        
    }
    
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor.yellow : UIColor.white
            nameLabel.textColor = isSelected ? UIColor.white : UIColor.black
            timeLabel.textColor = isSelected ? UIColor.white : UIColor.black
            messageLabel.textColor = isSelected ? UIColor.white : UIColor.black
        }
    }
    
    let userPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    let container: UIView = {
        let view = UIView()
        return view
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    let hasReadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func setUpView() {
        super.setUpView()
        self.addCustomView(userPhoto)
        userPhoto.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        self.addCustomView(separator)
        separator.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.equalTo(self.userPhoto.snp.right).offset(8)
            make.height.equalTo(1)
            make.right.equalToSuperview()
        }
        self.addCustomView(container)
        container.snp.makeConstraints { (make) in
            make.left.equalTo(self.userPhoto.snp.right).offset(8)
            make.top.equalTo(self.userPhoto.snp.top).offset(-8)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalTo(self.separator.snp.top)
        }
        container.addCustomView(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(30)
        }
        container.addCustomView(timeLabel)
        timeLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(90)
            make.height.equalTo(35)
        }
        container.addCustomView(messageLabel)
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom)
            make.right.equalToSuperview().offset(-28)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
        container.addCustomView(hasReadImageView)
        hasReadImageView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.top.equalTo(timeLabel.snp.bottom).offset(8)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
}

