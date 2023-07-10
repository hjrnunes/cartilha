//
//  GuidanceView.swift
//  Cartilha
//
//  Created by Henrique Nunes on 07/07/2023.
//

import SwiftUI

struct GuidanceView: View {
    
    // Get the path to your markdown file.
    let lesson: Lesson
    let filepath: URL?
    
    init(lesson: Lesson) {
        self.lesson = lesson
        self.filepath = Bundle.main.url(forResource: lesson.guidance, withExtension: "md")
    }
    
    var body: some View {
        ScrollView {
            Text(try! AttributedString(
                contentsOf: filepath!,
                options: AttributedString.MarkdownParsingOptions(
                    interpretedSyntax: .inlineOnlyPreservingWhitespace)))
            .padding()
        }
    }
}

struct GuidanceView_Previews: PreviewProvider {
    static var previews: some View {
        GuidanceView(lesson: ModelData().lessons[0])
    }
}
