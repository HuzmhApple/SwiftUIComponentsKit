import SwiftUI

public struct PrimaryButton: View {
    let title: String
    let systemImageName: String?
    let iconAfterText: Bool
    let action: () -> Void
    
    let font: Font
    let textColor: Color
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let borderWidth: CGFloat
    let borderColor: Color
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    public init(
        title: String,
        systemImageName: String? = nil,
        iconAfterText: Bool = false,
        font: Font = .headline,
        textColor: Color = .white,
        backgroundColor: Color = .blue,
        cornerRadius: CGFloat = 12,
        borderWidth: CGFloat = 0,
        borderColor: Color = .clear,
        shadowColor: Color = .black.opacity(0.15),
        shadowRadius: CGFloat = 8,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.systemImageName = systemImageName
        self.iconAfterText = iconAfterText
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                if let icon = systemImageName, !iconAfterText {
                    Image(systemName: icon)
                }
                
                Text(title)
                    .font(font)
                    .bold()
                
                if let icon = systemImageName, iconAfterText {
                    Image(systemName: icon)
                }
            }
            .foregroundColor(textColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: 4)
        }
    }
}
