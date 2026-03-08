// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct PrimaryButton: View {
    let title: String
    let action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}


#Preview {
    VStack {
        PrimaryButton(title: "press here...") {
            print("tapped here...")
        }
        .padding()
    }
}
