//
//  MoviesServices.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 11/3/22.
//

import UIKit
import Alamofire

public class MoviesServicesImpl {
    
    public typealias moviesCallback = (_ movies: [MovieDataModel]?, _ status: Bool, _ message: String) -> Void
    
    var moviesCallback: moviesCallback?
    
    private let getMoviesUrl: String = "https://smarttv.orangetv.orange.es/stv/api/rtv/v1/GetUnifiedList?client=json&statuses=published&definitions=SD;HD;4K&external_category_id=SED_3880&filter_empty_categories=true"
    
    private let imageMoviesBaseUrl: String = "https://smarttv.orangetv.orange.es/stv/api/rtv/v1/images/"
    
    private let getMoviesDetailUrl: String = "https://smarttv.orangetv.orange.es/stv/api/rtv/v1/GetVideo"
    
    private let getMoviesRecomendationsListUrl: String = "https://smarttv.orangetv.orange.es/stv/api/reco/v1/GetVideoRecommendationList?client=json&type=all&subscription=false&filter_viewed_content=true&max_results=10&blend=ar_od_blend_2424video&params=external_content_id:MFO_0000014003&max_pr_level=8&quality=SD,HD&services=2424VIDEO"
    
    // MARK: - Methods
   
    public func getMovies() {
        UIApplication.shared.showLoading()
        AF.request(getMoviesUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { moviesData in
            guard let data = moviesData.data else {
                self.moviesCallback?(nil, false, "Error data")
                return
            }
            do {
                let movies = try JSONDecoder().decode(MovieResponseDataModel.self, from: data)
                self.moviesCallback?(movies.response, false, "")

            } catch {
                self.moviesCallback?(nil, false, "\(error.localizedDescription)")
            }
            UIApplication.shared.hideLoading()
        }
    }
    
    public func completionHandler(callBack: @escaping moviesCallback) {
        self.moviesCallback = callBack
    }
    
    public func getMovieDetails() {
        
    }
}
