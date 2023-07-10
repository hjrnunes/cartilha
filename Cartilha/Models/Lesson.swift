//
//  Lesson.swift
//  Cartilha
//
//  Created by Henrique Nunes on 06/07/2023.
//

import Foundation

// MARK: - Lesson
struct Lesson: Hashable, Decodable, Identifiable {
    let id: Int
    let name: String
    let guidance: String
    let pages: [Page]
    
    // MARK: - LessonPage
    struct Page: Hashable, Decodable {
        let rows: [Row]
    }
    
    // MARK: - Row
    struct Row: Hashable, Decodable {
        let words: [String]
        let align: String?
    }
}





