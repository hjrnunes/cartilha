//
//  TextTheme.swift
//  Cartilha
//
//  Created by Henrique Nunes on 06/07/2023.
//

import SwiftUI

enum TextTheme: String, CaseIterable, Codable {
    case noTheme = "No Theme"
    case menlo = "Menlo"
    case times = "Times"
    case important = "Important"
    
    var attributeContainer: AttributeContainer {
        var container = AttributeContainer()
        switch self {
        case .menlo:
            container.font = .custom("Menlo", size: 17, relativeTo: .body)
            container.foregroundColor = .indigo
        case .times:
            container.font = .custom("Times New Roman", size: 17, relativeTo: .body)
            container.foregroundColor = .blue
        case .important:
            container.font = .custom("Courier New", size: 17, relativeTo: .body)
            container.backgroundColor = .yellow
        default:
            break
        }
        return container
    }
}
