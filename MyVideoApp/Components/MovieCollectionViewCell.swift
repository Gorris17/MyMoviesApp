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
    
    
    // MARK: - PROPERTIES
    
    var viewModel: HomeViewModel?
    var model: MovieModel?
    
    // MARK: - Outlets
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
   
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(movie: MovieModel, image: UIImage) {
        self.movieTitleLabel.text = movie.name
        self.movieImageView.image = image
    }

}
