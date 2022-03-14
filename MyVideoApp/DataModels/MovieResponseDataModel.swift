//
//  MovieResponseDataModel.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 11/3/22.
//

import UIKit

public struct MovieResponseDataModel: Codable {
    
    // MARK: - Properties
        
    public let response: [MovieDataModel]?
    
}
