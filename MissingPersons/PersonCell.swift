//
//  PersonCell.swift
//  MissingPersons
//
//  Created by Evan on 4/30/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    var person: Person!
    
    func configureCell(person: Person) {
        
        self.person = person 
        
        if let url = NSURL(string: "\(baseUrl)\(person.personImageUrl!)"){
        
            downloadImage(url)
            
        }
    }
    
    func downloadImage(url: NSURL) {
        
        getDataFromUrl(url) { (data, reponse, error) in
            
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                self.personImage.image = UIImage(data: data)
                self.person.personImage = self.personImage.image 
                
                
            }
        }
    }
    
    func getDataFromUrl(url: NSURL, completion: ((data: NSData?, reponse: NSURLResponse?, error: NSError?) -> Void)) {
        
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            
            completion(data: data, reponse: response, error: error)
            
        }.resume()
    }
    
    func setSelected() {
        
        
         
        self.personImage.layer.borderWidth = 2.0
        self.personImage.layer.borderColor = UIColor.blueColor().CGColor
        
        self.person.downloadFaceId()
    }
}
