//
//  Authentication.swift
//  SearchingMate
//
//  Created by Leon Langhauser on 23.06.22.
//

import SwiftUI
import LocalAuthentication

class Authentication: ObservableObject {
    @Published var isValidated = false
    @Published var isAuthorized = false
    enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        
        var id:String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return NSLocalizedString("Deine Email adresse ist falsch bitte versuche es erneut", comment: "")
            }
        }
    }
    
    func updateValidation(success: Bool) {
        isValidated = success
    }
}
