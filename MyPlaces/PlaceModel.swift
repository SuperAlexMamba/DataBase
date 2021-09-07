//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Слава Орлов on 02.09.2021.
//

import UIKit

struct Place {
    
    var name : String
    var place : String?
    var type : String?
    var restarauntImage : String?
    var image : UIImage?
    
    static let restarauntNames = ["Dumskaya" , "Hathapury" , "KFC" , "Macdonalds" , "Subway" , "Burger King", "Pishki Pirozhki" , "Sindicat"]
    
    static func getPlaces() -> [Place] {
        var places = [Place]()
        
        for place in restarauntNames{
            places.append(Place(name: place, place: "Moskow", type: "Restaraunt", restarauntImage: place))
        }
        
        return places
    }
    
}


