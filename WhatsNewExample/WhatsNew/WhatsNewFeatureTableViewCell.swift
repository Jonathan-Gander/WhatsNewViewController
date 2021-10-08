//
//  WhatsNewFeatureTableViewCell.swift
//
//  Created by Jonathan Gander on 07.10.21.
//

import UIKit

class WhatsNewFeatureTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "WhatsNewFeatureTableViewCell"

    // UI objects
    @IBOutlet weak var featureImageView: UIImageView!
    @IBOutlet weak var featureTitleLabel: UILabel!
    @IBOutlet weak var featureDetailsLabel: UILabel!
}
