import Foundation

struct DayForecast: Identifiable {
    let id = UUID()
    let dayOfWeek: String
    let iconName: String
    let temperature: Int
}

struct CurrentWeather {
    let cityName: String
    let temperature: Int
    let iconName: String
}