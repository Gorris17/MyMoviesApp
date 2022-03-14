//
//  MoviesRecommendedDataModel.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 14/3/22.
//

import Foundation

public struct MoviesRecommendedDataModel: Codable {
    
    // MARK: - Properties
    
    public let name: String?
    
    public let externalContentId: String?
    
    public let images: [AttachmentDataModel]?
}
