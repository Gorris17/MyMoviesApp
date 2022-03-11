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
    
    
    // MARK: - Methods
    
    func loadMovies(completion: @escaping () -> Void) {
        service.moviesCallback = nil
        service.getMovies()
        service.completionHandler { [weak self] (movies, status, message) in
            if status {
                print("SUCCESSS")
            } else {
                print("Error: \(message)")
            }
            completion()
        }
    }

}
