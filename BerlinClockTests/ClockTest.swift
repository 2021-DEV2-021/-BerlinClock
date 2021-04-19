import XCTest
@testable import BerlinClock

class ClockTest: XCTestCase {
    
    var clock: BerlinClock!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        clock = BerlinClock()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func getDateFromTime(timeString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.date(from: timeString)!
    }

    // Test if function return seconds from a Date
    func testGetCurrentSecondFromDate() {
        let date = getDateFromTime(timeString: "17:00:00")
        let secondText = clock.getCurrentSecond(date: date)
        XCTAssertEqual(secondText, "00")
    }
    
    // Test if function return minutes from a Date
    func testGetCurrentMinuteFromDate() {
        let date = getDateFromTime(timeString: "16:59:13")
        let minuteText = clock.getCurrentMinute(date: date)
        XCTAssertEqual(minuteText, "59")
    }
    
    // Test if function return hours from a Date
    func testGetCurrentHourFromDate() {
        let date = getDateFromTime(timeString: "16:59:13")
        let hourText = clock.getCurrentHour(date: date)
        XCTAssertEqual(hourText, "16")
    }

}
