import XCTest
@testable import BerlinClock

class BerlinClockTests: XCTestCase {
    
    var berlinClock: BerlinClock!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        berlinClock = BerlinClock()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func getDateFromTime(timeString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.date(from: timeString)!
    }

    func testSecondsRow() {
        // Case 1: Test if "00:00:00" equals to Y
        let date1 = getDateFromTime(timeString: "00:00:00")
        let rowData1 = berlinClock.getSecondIndecatorRow(date: date1)
        XCTAssertEqual(rowData1, "Y")
        
        // Case 2: Test if "23:59:59" equals to O
        let date2 = getDateFromTime(timeString: "23:59:59")
        let rowData2 = berlinClock.getSecondIndecatorRow(date: date2)
        XCTAssertEqual(rowData2, "O")
    }

}
