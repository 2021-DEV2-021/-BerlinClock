import Foundation

class DigitalClock: Clock {
    
    var date: Date
    
    var timer: Timer?
    
    init() {
        date = Date.init()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    }
    
    
    @objc private func updateClock() {
        date = Date.init()
    }
}
