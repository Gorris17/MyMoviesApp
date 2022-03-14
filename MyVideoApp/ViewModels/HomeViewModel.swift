//
//  HomeViewModel.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 11/3/22.
//

import UIKit

class HomeViewModel: NSObject, ObservableObject {
    
    // MARK: - Properties
    let service = MoviesServicesImpl()
    
    var moviesList: [MovieModel] = []
    
    var completeMovieList: [MovieModel] = []
    
    var favoritesMovieList: [MovieModel] = []
    
    var recommendedMoviesList: [MovieModel] = []
    
    var selectedMovie: MovieModel?
    
    // MARK: - Methods
    
    func loadMovies(completion: @escaping () -> Void) {
        service.moviesCallback = nil
        service.getMovies()
        service.completionHandler { [weak self] (movies, status, message) in
            if status {
                print("SUCCESSS")
                guard let self = self else { return }
                guard let moviesList = movies else { return }
                moviesList.forEach({ dataMovie in
                    self.completeMovieList.append(MovieModel(moviesData: dataMovie))
                })
                self.moviesList = self.completeMovieList
            } else {
                print("Error: \(message)")
            }
            completion()
        }
    }
    
    func loadMovieImage(movie: MovieModel?, imageType: MovieImageType) -> UIImage? {
        var movieImage: UIImage? = nil
        guard let movie = movie else {
            return nil
        }
        movie.attachments.forEach({ image in
            if image.name == imageType, let imageUrl = image.value {
                let completeUrl = service.imageMoviesBaseUrl + imageUrl
                if let url = URL(string: completeUrl) {
                    if let data = try? Data(contentsOf: url){
                        movieImage = UIImage(data: data)
                    }
                }
            }
        })
        return  movieImage
    }

    
    func getMovieDetail(movieId: String, completion: @escaping ()-> Void) {
        service.getMovieDetails(movieId: movieId)
        service.moviesDetailCompletionHandler { [weak self] (movie, status,message) in
            if status {
                guard let self = self else { return }
                guard let movie = movie else { return }
                self.selectedMovie = MovieModel(moviesData: movie)
            } else {
                print("Error: \(message)")
            }
        }
    }
}
