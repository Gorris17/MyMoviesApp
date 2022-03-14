//
//  MovieTableViewCell.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 13/3/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var outterContentView: UIView!
    @IBOutlet weak var innerContentView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDetailLabel: UILabel!
    
    // MARK: - Life cylce

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // add the shadow to the outerView
        outterContentView.backgroundColor = UIColor.clear
        outterContentView.layer.shadowColor = UIColor.gray.cgColor
        outterContentView.layer.shadowOffset = CGSize(width: 2, height: 2)
        outterContentView.layer.shadowOpacity = 0.75
        outterContentView.layer.shadowRadius = 5
        
        // add the corner radius to innerView
        innerContentView.layer.cornerRadius = 5
        innerContentView.layer.borderColor = UIColor.black.cgColor
        innerContentView.layer.borderWidth = 0
        innerContentView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Configure Cell
    
    internal func configureCell(movie: MovieModel, image: UIImage) {
        self.movieTitleLabel.text = movie.name
        self.movieDetailLabel.text = movie.description
        self.movieImageView.image = image
    }
    
    
}
