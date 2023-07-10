//
//  WordView.swift
//  Cartilha
//
//  Created by Henrique Nunes on 05/07/2023.
//

import SwiftUI

struct WordView: View {
    var body: some View {
        Text("perseguisses") { string in
            string.foregroundColor = .blue
            if let range = string.range(of: "qua") {
                string[range].foregroundColor = .orange
            }
            print(string.characters.count)
        }
    }
}

extension Text {
    init(_ string: String, configure: ((inout AttributedString) -> Void)) {
        var attributedString = AttributedString(string) /// create an `AttributedString`
        configure(&attributedString) /// configure using the closure
        self.init(attributedString) /// initialize a `Text`
    }
}

struct WordView_Previews: PreviewProvider {
    static var previews: some View {
        WordView()
    }
}
