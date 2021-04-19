import XCTest
@testable import BerlinClock

class DigitalClockTest: XCTestCase {
    
    var digitalClock: DigitalClock!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        digitalClock = DigitalClock()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func getDateFromTime(timeString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.date(from: timeString)!
    }

    func testGetDigitalTime() {
        let date = getDateFromTime(timeString: "14:45:27")
        let digitalTimeText = digitalClock.getDigitalTime(date: date)
        XCTAssertEqual(digitalTimeText, "14:45:27")
    }
}
