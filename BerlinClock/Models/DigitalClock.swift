import Foundation

protocol DigitalClockDelegate: class {
    func dataUpdated()
}

class DigitalClock: Clock {
    
    var date: Date
    
    var timer: Timer?
    
    weak var delegate: DigitalClockDelegate?
    
    var digitalTime: String {
        get {
            return getDigitalTime(date: date)
        }
    }
    
    init() {
        date = Date.init()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    }
    
    func getDigitalTime(date: Date) -> String {
        return "\(getCurrentHour(date: date)):\(getCurrentMinute(date: date)):\(getCurrentSecond(date: date))"
    }
    
    @objc private func updateClock() {
        date = Date.init()
        delegate?.dataUpdated()
    }
}
