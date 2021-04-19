import Foundation

enum BerlinClockLamp: String {
    case Y
    case R
    case O
}

class BerlinClock: Clock {
    
    var date: Date
    
    var timer: Timer?
    
    init() {
        date = Date.init()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    }
    
    func getSecondIndecatorRow(date: Date) -> String {
        let second = Int(getCurrentSecond(date: date)) ?? 0
        let lampstatus: BerlinClockLamp = second % 2 == 0 ? .Y : .O
        return lampstatus.rawValue
    }
    
    func getFiveHoursIndecatorRow(date: Date) -> String {
        return ""
    }
    
    
    @objc private func updateClock() {
        date = Date.init()
    }
}
