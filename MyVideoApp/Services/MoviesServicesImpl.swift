//
//  MoviesServices.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 11/3/22.
//

import UIKit
import Alamofire

class MoviesServices {
    
    typealias moviesCallback = (_ movies: [String], _ status: Bool, _ message: String) -> Void
    
    var callback = moviesCallback?
    
    private let getMoviesUrl: String = "https://www.google.com/url?sa=D&q=https://smarttv.orangetv.orange.es/stv/api/rtv/v1/GetUnifiedList%3Fclient%3Djson%26statuses%3Dpublished%26definitions%3DSD%3BHD%3B4K%26external_category_id%3DSED_3880%26filter_empty_categories%3Dtrue&ust=1647077880000000&usg=AOvVaw0XUcNdtOSFZZcwlupdTKH9&hl=es&source=gmail"
    
    // MARK: - Methods
    
    
}
