//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Слава Орлов on 07.09.2021.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObj(_ place: Place){
        
        try! realm.write{
            realm.add(place)
        }
        
    }
    
}
