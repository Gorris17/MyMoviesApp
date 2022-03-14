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
        self.recommendedMoviesCollectionView.register(UINib.init(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieCollectionCell")
        self.recommendedMoviesCollectionView.delegate = self
        self.recommendedMoviesCollectionView.dataSource = self
        self.favoritesMovieCollectionView.register(UINib.init(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieCollectionCell")
        self.favoritesMovieCollectionView.delegate = self
        self.favoritesMovieCollectionView.dataSource = self
        
        self.setupLabels()
        self.setupBackgroundImage()
        self.getRecommendedMovies()
    }

    private func setupLabels() {
        self.movieTitleLabel.text = movie?.name
        self.descriptionTitleLabel.text = movie?.description
        self.recommendedMoviesLabel.text = "Peliculas recomendadas"
        self.favoriteMoviesLabel.text = "Peliculas favoritas"
        
    }
    
    private func setupBackgroundImage() {
        DispatchQueue.main.async {
            if let image = self.viewModel?.loadMovieImage(movie: self.movie, imageType: .background) {
                self.backgroundImageView.image = image
            }
        }
    }
    
    private func getRecommendedMovies() {
        guard let id = movie?.externalId else {
            return
        }
        viewModel?.getRecommendedMovies(movieId: id, completion: {
            self.recommendedMoviesCollectionView.reloadData()
        })
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
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionCell", for: indexPath) as? MovieCollectionViewCell {
            
            if let movie = viewModel?.recommendedMoviesList[indexPath.row], let movieImage = viewModel?.loadMovieImage(movie: movie, imageType: .vertical) {
                cell.configureCell(movie: movie, image: movieImage)
                return cell
            }
            return UICollectionViewCell()
            
        } else {
            return UICollectionViewCell()
        }
    }
    
    
}
