//
//  Post.swift
//  DemoREST
//
//  Created by mobapp02 on 22/01/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import Foundation

class Post {
    var userId:Int
    var id:Int
    var title:String
    var body: String
    
    init(userId:Int, id:Int, title:String, body: String){
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
}


