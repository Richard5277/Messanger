//
//  ChatCell.swift
//  Messanger
//
//  Created by Feihong Zhao on 2017-03-07.
//  Copyright © 2017 Feihong Zhao. All rights reserved.
//

import UIKit
import SnapKit

class ChatCell: BaseCollectionViewCell {
    
    var messageTextView: UITextView = {
        let textview = UITextView()
        textview.font = UIFont.systemFont(ofSize: 16)
        textview.backgroundColor = .lightGray
        return textview
    }()
    
    override func setUpView() {
        super.setUpView()
        
        addCustomView(messageTextView)
        messageTextView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
}
