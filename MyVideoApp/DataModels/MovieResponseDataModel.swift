//
//  MovieResponseDataModel.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 11/3/22.
//

import UIKit

public struct MovieResponseDataModel: Codable {
    
    // MARK: - Properties
    
    public let metadata: MovieMetaDataModel?
    
    public let response: [MovieDataModel]?
    
}


public struct MovieMetaDataModel: Codable {
    
    let request: String?
    
    let fullLenght: Int?
    
    let timestamp: Int?
}
