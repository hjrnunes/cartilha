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
        let v = ZStack {
            TabView {
                ForEach(lesson.pages, id: \.self) { page in
                    LessonPage(page: page, selectedTheme: selectedTheme)
                        .focusable()
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
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
                    .focusable()
                }
            }
        }
        #if os(tvOS)
        v
        #else
        v
        .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

struct LessonView_Previews: PreviewProvider {
    static var previews: some View {
        LessonView(lesson: ModelData().lessons[0], selectedTheme: .ny)
    }
}
