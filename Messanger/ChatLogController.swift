//
//  ChatLogController.swift
//  Messanger
//
//  Created by Feihong Zhao on 2017-03-07.
//  Copyright © 2017 Feihong Zhao. All rights reserved.
//

import UIKit

class ChatLogController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let ChatCellId = "ChatCellId"
    var friend: Friend? {
        
        didSet {
            navigationItem.title = friend?.name
            messages = friend?.messages?.allObjects.sorted(by: {(($0 as AnyObject).date!.compare(($1 as AnyObject).date! as Date) == .orderedAscending)}) as? [Message]
        }
        
    }
    
    var messages: [Message]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(ChatCell.self, forCellWithReuseIdentifier: ChatCellId)
        collectionView?.alwaysBounceVertical = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatCellId, for: indexPath) as! ChatCell
        cell.messageTextView.text = messages?[indexPath.item].text
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}


















