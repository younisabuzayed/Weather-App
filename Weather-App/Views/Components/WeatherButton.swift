import SwiftUI;

struct WeatherButton: View {
    var title: String;
    var backgroundColor: Color = .white;
    var textColor: Color = .blue;
    var action: () -> Void;
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .cornerRadius(12)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
        }
    }
}