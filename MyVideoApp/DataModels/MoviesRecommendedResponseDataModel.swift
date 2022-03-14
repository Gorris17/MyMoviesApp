//
//  MoviesRecommendedDataModel.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 14/3/22.
//

import Foundation

public struct MoviesRecommendedResponseDataModel: Codable {
    
    // MARK: - Properties
    
    public let response: [MoviesRecommendedDataModel]?
}
