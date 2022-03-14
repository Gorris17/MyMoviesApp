//
//  ViewController.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 11/3/22.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: HomeViewModel?
    var movie: MovieModel?
    
    // MARK: - Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var recommendedMoviesLabel: UILabel!
    @IBOutlet weak var favoriteMoviesLabel: UILabel!
    
    @IBOutlet weak var recommendedMoviesCollectionView: UICollectionView!
    @IBOutlet weak var favoritesMovieCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.recommendedMoviesCollectionView.delegate = self
        self.recommendedMoviesCollectionView.dataSource = self
        
        self.favoritesMovieCollectionView.delegate = self
        self.favoritesMovieCollectionView.dataSource = self
        
        self.setupLabels()
        self.setupBackgroundImage()
    }

    private func setupLabels() {
        self.movieTitleLabel.text = movie?.name
        self.descriptionTitleLabel.text = movie?.description
        self.recommendedMoviesLabel.text = "Peliculas recomendadas"
        self.favoriteMoviesLabel.text = "Peliculas favoritas"
        
    }
    
    private func setupBackgroundImage() {
        backgroundImageView.image = self.viewModel?.loadMovieImage(movie: movie, imageType: .background) ?? UIImage()
        
    }

}

extension DetailMovieViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case recommendedMoviesCollectionView:
            return viewModel?.recommendedMoviesList.count ?? 0
        case favoritesMovieCollectionView:
            return viewModel?.favoritesMovieList.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
