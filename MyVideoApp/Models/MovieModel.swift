//
//  MovieModel.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 14/3/22.
//

import Foundation

public class MovieModel: Decodable {
    
    // MARK: - Properties
        
    public let externalId: String?
    
    public let name: String?
    
    public let shortName: String?
    
    public let description: String?
    
    public var keywords: [String]?
    
    public var attachments: [AttachmentModel] = []
    
    ///Falta guardar en persistencia una lista con los id de las peliculas favoritas para settear si es favorita o no.
    public var isFavorite: Bool = false
    
    // MARK: - Initilizers
    
    public init(moviesData: MovieDataModel) {
        self.name = moviesData.name
        self.shortName = moviesData.shortName
        self.externalId = moviesData.externalId
        self.description = moviesData.description
        if let keywords = moviesData.keywords {
            self.keywords = []
            let finalKeywords = keywords.split(separator: ";")
            finalKeywords.forEach({ word in
                self.keywords?.append(String(word))
            })
        }
        if let attachments = moviesData.attachments {
            attachments.forEach({ data in
                self.attachments.append(AttachmentModel(attachment: data))
            })
        }
    }
    
}
