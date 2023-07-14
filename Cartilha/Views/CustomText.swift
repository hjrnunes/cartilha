//
//  CustomTextView.swift
//  Cartilha
//
//  Created by Henrique Nunes on 06/07/2023.
//

import SwiftUI

struct CustomText: View {
    // Store the attributed string that will appear
    private var attributedString: AttributedString
    
    // Store the font and set a default value with Font.system(body)
    private var font: Font = .system(.body, design: .serif)
    
    // Ensure the body of the view has a standard SwiftUI.Text to render the stored attributedString
    public var body: some View {
        Text(attributedString)
            .lineLimit(nil)
    }
    
    // Set an initializer similar to SwiftUI.Text to take an attributed string as a parameter.
    // Then, call the private annotateCustomAttributes(from:) with this string
    public init(_ attributedString: AttributedString) {
        self.attributedString = CustomText.annotateCustomAttributes(from: attributedString)
    }
    
    // Give a similar initializer a localization key, then create an attributed string from the localization file
    public init(_ localizedKey: String.LocalizationValue) {
        attributedString = CustomText.annotateCustomAttributes(
            from: AttributedString(localized: localizedKey, including: \.customAttributes))
    }
    
    // Add a method to create and return a copy of the view with a modified font
    public func font(_ font: Font) -> CustomText {
        var selfText = self
        selfText.font = font
        return selfText
    }
    
    
    
    private static func annotateCustomAttributes(from source: AttributedString) -> AttributedString {
        var attrString = source
        // Loop the available runs in the attributed string
        for run in attrString.runs {
            // Skip any runs that don’t have any value for customColor
            guard run.customColor != nil else {
                continue
            }
        
            // Store the range of the run for later use
            let range = run.range
            
            // Checks if the run has a value for customColor
            if let value = run.customColor {
                // If the value is emphasis, apply the color styles.
                if value == .y {
                    attrString[range].foregroundColor = .white
                }
            }
        }
        
        return attrString
    }
}

struct CustomTextView_Previews: PreviewProvider {
    static var previews: some View {
        CustomText(AttributedString("perseguisses"))
    }
}
