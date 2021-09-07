//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Слава Орлов on 02.09.2021.
//

import RealmSwift

class Place : Object {
    
    @objc dynamic var name = ""
    @objc dynamic var place : String?
    @objc dynamic var type : String?
    @objc dynamic var imageData : Data!
    
    
}


