//
//  MardownView.swift
//  Cartilha
//
//  Created by Henrique Nunes on 06/07/2023.
//

import SwiftUI

struct MarkdownView: View {
    
    var markdownString: String
    var selectedTheme: TextTheme
    
    var body: some View {
        CustomText(convertMarkdown(toMarkdown(markdownString)))
            .padding(.horizontal, 3.0)
            .padding(.vertical, 5.0)
            .lineLimit(nil)
    }
    
    private func toMarkdown(_ string: String) -> String {
        var tokens: [String] = []
        for (index, element) in string.split(separator: "|").enumerated() {
            if index % 2 == 0 {
                tokens.append("^[\(element)](e:'y')")
            } else {
                tokens.append("\(element)")
            }
        }
        return tokens.joined(separator: "")
    }
    
    private func convertMarkdown(_ string: String) -> AttributedString {
        guard var attributedString = try? AttributedString(
            markdown: string,
            including: AttributeScopes.CustomAttributes.self,
            options: AttributedString.MarkdownParsingOptions(allowsExtendedAttributes: true))
        else {
            return AttributedString(string)
        }
        attributedString.mergeAttributes(selectedTheme.attributeContainer)
        return attributedString
    }
}

struct MardownView_Previews: PreviewProvider {
    static var previews: some View {
        
        MarkdownView(markdownString: "a|ba|fa|da", selectedTheme: .ny)
    }
}
