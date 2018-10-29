//
//  MapNoteViewController.swift
//  Everpobre
//
//  Created by Jose Julián Bustos Díaz on 29/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapNoteViewController: UIViewController {

    @IBOutlet weak var mapNoteView: MKMapView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var notebook: Notebook
    var coredataStack: CoreDataStack
    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    init(notebook: Notebook, coredataStack: CoreDataStack){
        self.notebook = notebook
        self.coredataStack = coredataStack
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapNoteView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes Location"
        segmentedControl.selectedSegmentIndex = 1
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() // Modificar infoplist !!!!!!!!!!! Done
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
            let latitude = locationManager.location?.coordinate.latitude ?? 0.0
            let longitude = locationManager.location?.coordinate.longitude ?? 0.0
            let initialLocation = CLLocation(latitude:  latitude, longitude: longitude)
            centerMapOnLocation(location: initialLocation)
        }
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func segmentedControlTap(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            // Cards
            print("Cards")
            let notesListVC = NewNotesListViewController(notebook: notebook, coreDataStack: coredataStack)
            //show(notesListVC, sender: nil)
            navigationController?.popViewController(animated: true)
            //self.present(notesListVC, animated: true)

        case 1:
            // Map
            print("Map")
         
        default:
            break
        }
    }
}



extension MapNoteViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            //            latitudeLabel.text = "\(location.coordinate.latitude)"
            //            longitudeLabel.text = "\(location.coordinate.longitude)"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("No pude conseguir la ubicacion del usuario: \(error.localizedDescription)")
    }
}
