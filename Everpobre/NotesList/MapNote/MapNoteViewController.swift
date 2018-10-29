//
//  MapNoteViewController.swift
//  Everpobre
//
//  Created by Jose Julián Bustos Díaz on 29/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit
import MapKit

class MapNoteViewController: UIViewController {

    @IBOutlet weak var mapNoteView: MKMapView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var notebook: Notebook
    var coredataStack: CoreDataStack
    
    init(notebook: Notebook, coredataStack: CoreDataStack){
        self.notebook = notebook
        self.coredataStack = coredataStack
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.selectedSegmentIndex = 1
        // Do any additional setup after loading the view.
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
            show(notesListVC, sender: nil)
        case 1:
            // Map
            print("Map")
         
        default:
            break
        }
    }
}
