import SwiftUI
import Combine;
final class WeatherViewModel: ObservableObject {
    // MARK: - Published state (like React state that triggers re-render when changed)
    @Published private(set) var isNight: Bool = false
    @Published private(set) var currentWeather: CurrentWeather
    @Published private(set) var dailyForecasts: [DayForecast]

    init() {
        self.currentWeather = CurrentWeather(
            cityName: "Cupertino, CA",
            temperature: 25,
            iconName: "sun.max.fill"
        )
        self.dailyForecasts = [
            DayForecast(dayOfWeek: "TUE", iconName: "cloud.sun.fill", temperature: 25),
            DayForecast(dayOfWeek: "WED", iconName: "wind.snow", temperature: 25),
            DayForecast(dayOfWeek: "THU", iconName: "cloud.rain.fill", temperature: 25),
            DayForecast(dayOfWeek: "FRI", iconName: "sun.max.fill", temperature: 25),
            DayForecast(dayOfWeek: "SAT", iconName: "sun.max.fill", temperature: 25)
        ]
    }

    func toggleDayNight() {
        isNight.toggle()
        // Update main icon to match; rest of data could come from API later
        let newIcon = isNight ? "moon.stars.fill" : "sun.max.fill"
        currentWeather = CurrentWeather(
            cityName: currentWeather.cityName,
            temperature: currentWeather.temperature,
            iconName: newIcon
        )
    }
}