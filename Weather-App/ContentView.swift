//
//  ContentView.swift
//  Weather-App
//
//  Created by Younis Abuzayed on 03/02/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                WeatherStatusView(imageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: 25)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: "25")
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind.snow", temperature: "25")
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.rain.fill", temperature: "25")
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: "25")
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temperature: "25")
                }
                Spacer()
                WeatherButton(title: "Change Day Time") {
                    isNight.toggle()
                }
                Spacer()
            }
        }
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String;
    var imageName: String;
    var temperature: String;
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°C")
                .font(.system(size: 24, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool;
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String;
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherStatusView: View {
    var imageName: String;
    var temperature: Int;
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temperature)°C")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(24)
    }
}

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

#Preview {
    ContentView()
}
