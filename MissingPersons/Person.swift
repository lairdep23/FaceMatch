//
//  Person.swift
//  MissingPersons
//
//  Created by Evan on 5/2/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import Foundation
import UIKit
import ProjectOxfordFace

class Person {
    
    var faceId: String?
    var personImage: UIImage?
    var personImageUrl: String?
    
    init (personImageUrl: String) {
        self.personImageUrl = personImageUrl
    }
    
    func downloadFaceId() {
        if let img = personImage, let imgData = UIImageJPEGRepresentation(img, 0.8) {
            FaceServices.instance.client.detectWithData(imgData, returnFaceId: true, returnFaceLandmarks: false, returnFaceAttributes: nil, completionBlock: { (faces:[MPOFace]!, err: NSError!) in
                
                if err == nil {
                    var faceId: String?
                    for face in faces {
                        faceId = face.faceId
                        print("Face Id: \(faceId)")
                        break
                    }
                    
                    self.faceId = faceId
                }
            })
        }
    }
}