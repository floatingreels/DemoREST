//
//  DAO.swift
//  DemoREST
//
//  Created by mobapp02 on 22/01/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import Foundation

class DAO {
    //Singleton
    static var sharedInstance:DAO = DAO.init()
    
    private init(){}
    
    //functie om alle posts op te vragen
    func getAllPosts() -> [Post] {
        //verwijzing maken naar datasource, initialiseren
        var posts = [Post]()
        //verwijzing maken naar het adres waar de ruwe data staat
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/posts")
        do {
            //ruwe data uit adres halen
            let rawData = try Data.init(contentsOf: url!)
            //root element was een array
            let jsonArray = try JSONSerialization.jsonObject(with: rawData) as! [NSObject]
            
            for item in jsonArray {
                let userId = item.value(forKey: "userId") as! Int
                let id = item.value(forKey: "id") as! Int
                let title = item.value(forKey: "title") as! String
                let body = item.value(forKey: "body") as! String
                
                let post = Post.init(userId: userId, id: id, title: title, body: body)
                posts.append(post)
            }
            
        } catch {
            print("Error finding post")
        }
        return posts
    }
    
    func getUser(userId: Int) -> User {
        
        var user:User?
        
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/users/\(userId)")
        do {
            let rawData = try Data.init(contentsOf: url!)
            let jsonData = try JSONSerialization.jsonObject(with: rawData) as! NSObject
            
            user = User.init(id: jsonData.value(forKey: "id") as! Int, username: jsonData.value(forKey: "username") as! String)

        } catch {
            print("Error finding user")
        }
        return user!
    }
}
