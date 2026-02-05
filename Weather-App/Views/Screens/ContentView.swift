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

#Preview {
    ContentView()
}
