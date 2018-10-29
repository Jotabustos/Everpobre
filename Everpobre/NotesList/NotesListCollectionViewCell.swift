//
//  NotesListCollectionViewCell.swift
//  Everpobre
//
//  Created by Charles Moncada on 11/10/18.
//  Copyright © 2018 Charles Moncada. All rights reserved.
//

import UIKit

class NotesListCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var creationDateLabel: UILabel!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!

    @IBOutlet weak var imageCell: UIImageView!
    var item: Note!

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	func configure(with item: Note) {
		backgroundColor = .white
        imageCell.image = UIImage(data: item.image! as Data)
		titleLabel.text = item.title
		creationDateLabel.text = (item.creationDate as Date?)?.customStringLabel()
        latitudeLabel.text = "\((item.location?.latitude) ?? 0.0)"
        longitudeLabel.text = "\((item.location?.longitude) ?? 0.0)"
	}
}
