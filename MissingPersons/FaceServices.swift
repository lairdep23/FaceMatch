//
//  FaceServices.swift
//  MissingPersons
//
//  Created by Evan on 5/2/16.
//  Copyright © 2016 Evan. All rights reserved.
//

import Foundation
import ProjectOxfordFace


class FaceServices {
    static let instance = FaceServices()
    
    let client = MPOFaceServiceClient(subscriptionKey: "b283f254b6ce46909ab3b9e6289357f4")
}