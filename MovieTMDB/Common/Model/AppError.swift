//
//  AppError.swift
//  MovieTMDB
//
//  Created by Lucas Gomesx on 05/05/22.
//

import Foundation
import SwiftUI

enum AppError: Error {
    case response(message: String)
    
    public var message: String {
        switch self {
            case .response(let message):
                return message
        }
    }
}
