//
//  LessonPage.swift
//  Cartilha
//
//  Created by Henrique Nunes on 06/07/2023.
//

import SwiftUI

struct LessonPage: View {
    
    var page: Lesson.Page
    var selectedTheme: TextTheme
    
    var body: some View {
        WordGrid(rows: page.rows, selectedTheme: selectedTheme)
            
    }
}

struct LessonPage_Previews: PreviewProvider {
    static var previews: some View {
        LessonPage(page: ModelData().lessons[0].pages[0], selectedTheme: .times)
    }
}
