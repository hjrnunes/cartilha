//
//  AttributeScopes.swift
//  Cartilha
//
//  Created by Henrique Nunes on 06/07/2023.
//

import SwiftUI

public enum CustomColorAttributes: CodableAttributedStringKey, MarkdownDecodableAttributedStringKey {
    public enum Value: String, Codable {
        case y
    }
    public static var name = "e"
}

// Creating an extension to the existing AttributeScopes type
public extension AttributeScopes {
    // Creating a new subtype to hold all the custom attributes
    struct CustomAttributes: AttributeScope {
        let customColor: CustomColorAttributes
        // Specifying a property that will refer to the existing attributes. Since this app is in SwiftUI, it’s SwiftUIAttributes.
        // Alternatively, you can use FoundationAttributes, UIKitAttributes or AppKitAttributes.
        // Otherwise, existing attributes won’t be encoded and decoded.
        let swiftUI: SwiftUIAttributes
    }
    // Specifying a property that refers to the type itself
    var customAttributes: CustomAttributes.Type { CustomAttributes.self }
}

// Specifying an extension on AttributeDynamicLookup with an override to subscript(dynamicMember:).
// This helps refer to CustomAttributes directly as a KeyPath.
public extension AttributeDynamicLookup {
    subscript<T: AttributedStringKey>(dynamicMember keyPath: KeyPath<AttributeScopes.CustomAttributes, T>) -> T {
        self[T.self]
    }
}
