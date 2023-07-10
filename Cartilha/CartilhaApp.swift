//
//  CartilhaApp.swift
//  Cartilha
//
//  Created by Henrique Nunes on 05/07/2023.
//

import SwiftUI

@main
struct CartilhaApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            LessonsList()
                .environmentObject(modelData)
        }
    }
}
