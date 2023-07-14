//
//  WordGrid.swift
//  Cartilha
//
//  Created by Henrique Nunes on 06/07/2023.
//

import SwiftUI

struct WordGrid: View {
    
    var rows: [Lesson.Row]
    var selectedTheme: TextTheme
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        ForEach(rows, id: \.self) { row in
                            VStack {
                                HStack {
                                    if row.align == "center" {
                                        Spacer()
                                    }
                                    ForEach(row.words, id: \.self) { word in
                                        MarkdownView(markdownString: word,
                                                     selectedTheme: selectedTheme)
                                    }
                                    if row.align == "center" {
                                        Spacer()
                                    }
                                }
                            }
                            //.background(.red)
                        }
                    }
                    .padding()
                    //.background(.red)
                    .frame(width: geometry.size.width * 0.4)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct WordGrid_Previews: PreviewProvider {
    static var previews: some View {
        WordGrid(rows: ModelData().lessons[16].pages[5].rows, selectedTheme: .ny)
    }
}
