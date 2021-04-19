import Foundation

class DigitalClock: Clock {
    
    var date: Date
    
    var timer: Timer?
    
    init() {
        date = Date.init()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    }
    
    func getDigitalTime(date: Date) -> String {
        return "\(getCurrentHour(date: date)):\(getCurrentMinute(date: date)):\(getCurrentSecond(date: date))"
    }
    
    @objc private func updateClock() {
        date = Date.init()
    }
}
