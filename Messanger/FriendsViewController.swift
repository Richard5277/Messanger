//
//  ViewController.swift
//  Messanger
//
//  Created by Feihong Zhao on 2017-03-03.
//  Copyright © 2017 Feihong Zhao. All rights reserved.
//

import UIKit
import CoreData

class FriendsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let cellId = "cellId"
    
    var messages = [Message]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMessages()
        navigationItem.title = "Recent"
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = .white
        collectionView?.register(MessageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MessageCell
        cell.message = messages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chatlogController = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())
        chatlogController.friend = messages[indexPath.item].friend
        navigationController?.pushViewController(chatlogController, animated: true)
    }
    
 }



