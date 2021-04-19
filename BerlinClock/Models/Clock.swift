import Foundation

protocol Clock {
    var date: Date {get set}
    var timer: Timer? {get set}
}

extension Clock {
    
    /// Gets seconds as string from a date.
    func getCurrentSecond(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ss"
        return dateFormatter.string(from: date)
    }
    
    /// Gets hours as string from a date.
    func getCurrentHour(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        return dateFormatter.string(from: date)
    }
    
    /// Gets minutes as string from a date.
    func getCurrentMinute(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm"
        return dateFormatter.string(from: date)
    }
}

