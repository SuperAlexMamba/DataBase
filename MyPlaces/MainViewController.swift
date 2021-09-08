//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Слава Орлов on 02.09.2021.
//

import UIKit
import RealmSwift

class MainViewController: UITableViewController {
    
    
    var places: Results<Place>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        places = realm.objects(Place.self)

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let place = places[indexPath.row]

        cell.nameOfPlace.text = place.name
        cell.locationOfPlace.text = place.place
        cell.typeOfPlace.text = place.type
        cell.imageOfPlace.image = UIImage(data: place.imageData!)
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let place = places[indexPath.row]
            let newPlaceVC = segue.destination as! NewPlaceViewController
            newPlaceVC.currentPlace = place 
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        
        guard let newPlaceVC = segue.source as? NewPlaceViewController else  {return}
        
        newPlaceVC.savePlace()
        tableView.reloadData()
        
    }
    
    // MARK: - TableViewDelegate
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        
//        let place = places[indexPath.row]
//        
//        let deleteaction = UITableViewRowAction(style: .normal, title: "Delete") { _, _ in
//            
//            StorageManager.deleteObj(place)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            
//        }
//        return [deleteaction]
//    }
  
}
