//
//  FriendsViewController + FetchMessagesWithCoreData.swift
//  Messanger
//
//  Created by Feihong Zhao on 2017-03-07.
//  Copyright © 2017 Feihong Zhao. All rights reserved.
//

import UIKit
import CoreData

extension FriendsViewController {
    
    func setUpMessages(){
        
        clearData()
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            
            let mark = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            mark.name = "Mark"
            mark.profileImageName = "l1"
            
            let steve = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            steve.name = "Steve"
            steve.profileImageName = "l3"
            
            let brian = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            brian.name = "Brian"
            brian.profileImageName = "l4"
            
            let kris = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            kris.name = "Kris"
            kris.profileImageName = "l2"
            
            let dani = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            dani.name = "Dani"
            dani.profileImageName = "l3"
            
            createMessageForFriend(steve, withText: "Hello how are you?", withContext: context, minuteAgo: 3)
            createMessageForFriend(steve, withText: "I need a new Mac Pro", withContext: context, minuteAgo: 2)
            createMessageForFriend(steve, withText: "Can I Borrow You $10000 ???", withContext: context,minuteAgo: 0)
            createMessageForFriend(mark, withText: "Hello my name is Mark", withContext: context,minuteAgo: 1)
            createMessageForFriend(brian, withText: "HI WHATS UP", withContext: context, minuteAgo: 5)
            createMessageForFriend(kris, withText: "I LOVE your new shirt LOL", withContext: context, minuteAgo: 60 * 26)
            createMessageForFriend(dani, withText: "Hi Boi", withContext: context, minuteAgo: 60 * 24 * 7 * 36)
            
            do {
                try context.save()
            } catch let error {
                print(error)
            }
        }
        
        loadData()
    }
    
    private func createMessageForFriend(_ friend: Friend, withText text: String, withContext: NSManagedObjectContext, minuteAgo: Double ) {
        let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: withContext) as! Message
        message.text = text
        message.friend = friend
        message.date = NSDate().addingTimeInterval(-minuteAgo * 60)
    }
    
    func clearData(){
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        if let context = delegate?.persistentContainer.viewContext {
            do {
                
                let entities = ["Message", "Friend"]
                for entity in entities {
                    
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
                    if let objects = try context.fetch(fetchRequest)  as? [NSManagedObject] {
                        for object in objects {
                            context.delete(object)
                        }
                        try context.save()
                    }
                    
                }
                
            } catch let error {
                print(error)
            }
        }
    }
    
    func loadData(){
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            
            if let friends = fetchFriends() {
                messages = [Message]()
                for friend in friends {
                    if let friendName = friend.name {
                        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
                        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
                        fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friendName)
                        fetchRequest.fetchLimit = 1
                        do {
                            let fetchedMessage = try context.fetch(fetchRequest) as! [Message]
                            messages.append(contentsOf: fetchedMessage)
                        }catch let err {
                            print(err)
                        }
                    }
                    messages = messages.sorted(by: {($0.date!.compare($1.date! as Date) == .orderedDescending)})
                }
            }
        }
    }
    
    private func fetchFriends() -> [Friend]? {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
            do {
                return try context.fetch(fetchRequest) as? [Friend]
            }catch let error {
                print(error)
            }
        }
        return nil
    }
    
}
