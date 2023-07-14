//
//  LessonView.swift
//  Cartilha
//
//  Created by Henrique Nunes on 06/07/2023.
//

import SwiftUI

struct LessonView: View {
    
    var lesson: Lesson
    var selectedTheme: TextTheme
    
    var body: some View {
        GeometryReader { geometry in
            let height = geometry.size.height
            let width = geometry.size.width
            
            ZStack {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(lesson.pages, id: \.self) { page in
                            LessonPage(page: page, selectedTheme: selectedTheme)
                                .frame(width: width, height: height )
                                .focusable()
                                .background(.red)
                        }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            GuidanceView(lesson: lesson)
                            
                        } label: {
                            Image(systemName: "info.circle")
                        }
                        .padding()
                        .padding(.horizontal, 30)
                    }
                }
            }
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(lesson: ModelData().lessons[0], selectedTheme: .ny)
    }
}
