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
        CustomText(convertMarkdown(markdownString))
            .padding(.horizontal, 3.0)
            .padding(.vertical, 5.0)
            
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
        MarkdownView(markdownString: "per^[se](role: 'emphasis')guisses", selectedTheme: .times)
    }
}
