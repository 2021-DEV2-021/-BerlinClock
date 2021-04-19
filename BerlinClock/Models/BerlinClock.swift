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
    
    /// Gets String representation from second indecator.
    func getSecondIndecatorRow(date: Date) -> String {
        let second = Int(getCurrentSecond(date: date)) ?? 0
        let lampstatus: BerlinClockLamp = second % 2 == 0 ? .Y : .O
        return lampstatus.rawValue
    }
    
    /// Gets String representation from five hours indecator row.
    func getFiveHoursIndecatorRow(date: Date) -> String {
        let hours = Int(getCurrentHour(date: date)) ?? 0
        let numberOfActiveLamps = hours / 5
        var indecatorRow: String = ""
        for i in 1...4 {
            indecatorRow.append(i <= numberOfActiveLamps ? BerlinClockLamp.R.rawValue : BerlinClockLamp.O.rawValue)
        }
        return indecatorRow
    }
    
    /// Gets String representation from single hour indecator row.
    func getOneHourIndecatorRow(date: Date) -> String {
        let hours = Int(getCurrentHour(date: date)) ?? 0
        let numberOfActiveLamps = hours % 5
        var indecatorRow: String = ""
        for i in 1...4 {
            indecatorRow.append(i <= numberOfActiveLamps ? BerlinClockLamp.R.rawValue : BerlinClockLamp.O.rawValue)
        }
        return indecatorRow
    }
    
    /// Gets String representation from five minute indecator row.
    func getFiveMinuteIndecatorRow(date: Date) -> String {
        let minutes = Int(getCurrentMinute(date: date)) ?? 0
        let numberOfActiveLamps = minutes / 5
        var indecatorRow: String = ""
        for i in 1...11 {
            if (i <= numberOfActiveLamps) {
                if (i % 3 == 0) {
                    indecatorRow.append(BerlinClockLamp.R.rawValue)
                } else {
                    indecatorRow.append(BerlinClockLamp.Y.rawValue)
                }
            } else {
                indecatorRow.append(BerlinClockLamp.O.rawValue)
            }
            
        }
        return indecatorRow
    }
    
    
    @objc private func updateClock() {
        date = Date.init()
    }
}
