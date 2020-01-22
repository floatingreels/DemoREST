//
//  PostDetailViewController.swift
//  DemoREST
//
//  Created by mobapp02 on 22/01/2020.
//  Copyright © 2020 mobapp02. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {

    
    @IBOutlet weak var titleTL: UILabel!
    
    @IBOutlet weak var usernameTL: UILabel!
    
    @IBOutlet weak var bodyTV: UITextView!
 
    
    var postToDetail:Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usertoDetail = DAO.sharedInstance.getUser(userId: postToDetail!.userId)
        
        titleTL.text = postToDetail?.title
        usernameTL.text=usertoDetail.username
        bodyTV.text = postToDetail?.body
    }
}
