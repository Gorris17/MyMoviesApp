//
//  MovieCollectionViewCell.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 14/3/22.
//

import UIKit

public protocol MovieCellProtocol {
    func movieSelected(model: MovieDataModel)
}

class MovieCollectionViewCell: UICollectionViewCell {
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
