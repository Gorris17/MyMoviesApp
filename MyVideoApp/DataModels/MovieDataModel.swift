//
//  MovieDataModel.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 11/3/22.
//

import UIKit

public struct MovieDataModel: Codable {
    
    // MARK: - Properties
        
    public let externalId: String?
    
    public let name: String?
    
    public let shortName: String?
    
    public let description: String?
    
    public let keywords: String?
    
}
