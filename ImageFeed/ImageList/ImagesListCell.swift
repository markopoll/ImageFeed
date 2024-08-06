//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Mark Balikoti on 08.07.2024.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    // MARK: - Public Properties
    
    static let reuseIdentifier = "ImagesListCell"
}
