import Foundation

protocol Clock {
    var date: Date {get set}
    var timer: Timer? {get set}
}

extension Clock {
    func getCurrentSecond(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "ss"
        return dateFormatter.string(from: date)
    }
}

