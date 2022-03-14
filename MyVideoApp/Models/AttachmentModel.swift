//
//  AttachmentModel.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 14/3/22.
//

import Foundation

public class AttachmentModel: Codable {
    
    // MARK: - Properties
    
    public var name: MovieImageType? = nil
    
    public let value: String?
    
    // MARK: - Initializers
    
    public init(attachment: AttachmentDataModel) {
        switch attachment.name {
        case MovieImageType.app1.rawValue:
            self.name = .app1
        case MovieImageType.background.rawValue:
            self.name = .background
        case MovieImageType.vertical.rawValue:
            self.name = .vertical
        default:
            self.name = nil
        }
        self.value = attachment.value
    }
}
