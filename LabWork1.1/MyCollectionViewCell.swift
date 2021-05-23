//
//  MyCollectionViewCell.swift
//  LabWork1.1
//
//  Created by Vladislav on 22.05.2021.
//


import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configure(image: UIImage?) {
        myImageView.backgroundColor = .gray
        myImageView.image = image
    }
}

