import Foundation

enum BerlinClockLamp: String {
    case Y
    case R
    case O
}

protocol BerlinClockDelegate: class {
    func dataUpdated()
}

class BerlinClock: Clock {
    
    var date: Date
    
    var timer: Timer?
    
    let numberOfLampRows = 5
    
    var berlinTime: String {
        get {return getBerlinTime(date: date)}
    }
    
    weak var delegate: BerlinClockDelegate?
    
    init() {
        date = Date.init()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    }
    
    /// Get number of lamps for lamp row.
    func getNumberOfItemsForLampRow(row: Int) -> Int {
        return getLampStringForRow(row: row).count
    }
    
    /// Get value of lamp by row number and position in row.
    func getLampStatusForLamp(row: Int, numberInRow: Int) -> BerlinClockLamp {
        let timeString = getLampStringForRow(row: row)
        let stringValue = String(timeString[timeString.index(timeString.startIndex, offsetBy: numberInRow)])
        let valueAsEnum = BerlinClockLamp.init(rawValue: stringValue)
        return valueAsEnum ?? .O
    }
    
    /// Get value for lamp row based on row number.
    private func getLampStringForRow(row: Int) -> String {
        switch row {
        case 0:
            return getSecondIndecatorRow(date: date)
        case 1:
            return getFiveHourIndecatorRow(date: date)
        case 2:
            return getSingleHourIndecatorRow(date: date)
        case 3:
            return getFiveMinuteIndecatorRow(date: date)
        case 4:
            return getSingleMinuteIndecatorRow(date: date)
        default:
            return ""
        }
    }
    
    /// Gets String representation from second indecator.
    func getSecondIndecatorRow(date: Date) -> String {
        let second = Int(getCurrentSecond(date: date)) ?? 0
        let lampstatus: BerlinClockLamp = second % 2 == 0 ? .Y : .O
        return lampstatus.rawValue
    }
    
    /// Gets String representation from five hours indecator row.
    func getFiveHourIndecatorRow(date: Date) -> String {
        let hours = Int(getCurrentHour(date: date)) ?? 0
        let numberOfActiveLamps = hours / 5
        var indecatorRow: String = ""
        for i in 1...4 {
            indecatorRow.append(i <= numberOfActiveLamps ? BerlinClockLamp.R.rawValue : BerlinClockLamp.O.rawValue)
        }
        return indecatorRow
    }
    
    /// Gets String representation from single hour indecator row.
    func getSingleHourIndecatorRow(date: Date) -> String {
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
    
    /// Gets String representation from single minute indecator row.
    func getSingleMinuteIndecatorRow(date: Date) -> String {
        let minutes = Int(getCurrentMinute(date: date)) ?? 0
        let numberOfActiveLamps = minutes % 5
        var indecatorRow: String = ""
        for i in 1...4 {
            indecatorRow.append(i <= numberOfActiveLamps ? BerlinClockLamp.Y.rawValue : BerlinClockLamp.O.rawValue)
        }
        return indecatorRow
    }
    
    
    /// Gets String representation Berlin Clock.
    func getBerlinTime(date: Date) -> String {
        return "\(getSecondIndecatorRow(date: date))\(getFiveHourIndecatorRow(date: date))\(getSingleHourIndecatorRow(date: date))\(getFiveMinuteIndecatorRow(date: date))\(getSingleMinuteIndecatorRow(date: date))"
    }
    
    
    @objc private func updateClock() {
        date = Date.init()
        delegate?.dataUpdated()
    }
}
