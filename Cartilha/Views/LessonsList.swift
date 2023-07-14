//
//  LessonsList.swift
//  Cartilha
//
//  Created by Henrique Nunes on 06/07/2023.
//

import SwiftUI

struct LessonsList: View {
    
    @EnvironmentObject var modelData: ModelData
    var selectedTheme: TextTheme = .ny
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(modelData.lessons) { lesson in
                    NavigationLink {
                        LessonView(lesson: lesson, selectedTheme: selectedTheme)
                    } label: {
                        Text(lesson.name)
                    }
                }
            }
            .navigationTitle("Lições")
        }
    }
}

struct LessonsList_Previews: PreviewProvider {
    static var previews: some View {
        LessonsList(selectedTheme: .times)
            .environmentObject(ModelData())
    }
}
