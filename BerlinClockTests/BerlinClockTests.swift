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
        
        // Case 3: Test if "23:59:53" equals to O
        let date3 = getDateFromTime(timeString: "23:59:53")
        let rowData3 = berlinClock.getSecondIndecatorRow(date: date3)
        XCTAssertEqual(rowData3, "O")
        
        // Case 4: Test if "23:59:54" equals to Y
        let date4 = getDateFromTime(timeString: "23:59:54")
        let rowData4 = berlinClock.getSecondIndecatorRow(date: date4)
        XCTAssertEqual(rowData4, "Y")
    }
    
    
    func testFiveHoursRow() {
        // Case 1: Test if "00:00:00" equals to OOOO
        let date1 = getDateFromTime(timeString: "00:00:00")
        let rowData1 = berlinClock.getFiveHoursIndecatorRow(date: date1)
        XCTAssertEqual(rowData1, "OOOO")

        // Case 2: Test if "23:59:59" equals to RRRR
        let date2 = getDateFromTime(timeString: "23:59:59")
        let rowData2 = berlinClock.getFiveHoursIndecatorRow(date: date2)
        XCTAssertEqual(rowData2, "RRRR")

        // Case 3: Test if "02:04:00" equals to OOOO
        let date3 = getDateFromTime(timeString: "02:04:00")
        let rowData3 = berlinClock.getFiveHoursIndecatorRow(date: date3)
        XCTAssertEqual(rowData3, "OOOO")

        // Case 4: Test if "08:23:00" equals to ROOO
        let date4 = getDateFromTime(timeString: "08:23:00")
        let rowData4 = berlinClock.getFiveHoursIndecatorRow(date: date4)
        XCTAssertEqual(rowData4, "ROOO")

        // Case 5: Test if "16:35:00" equals to RRRO
        let date5 = getDateFromTime(timeString: "16:35:00")
        let rowData5 = berlinClock.getFiveHoursIndecatorRow(date: date5)
        XCTAssertEqual(rowData5, "RRRO")
    }
    
    
    func testSingleHoursRow() {
        // Case 1: Test if "00:00:00" equals to OOOO
        let date1 = getDateFromTime(timeString: "00:00:00")
        let rowData1 = berlinClock.getSingleHourIndecatorRow(date: date1)
        XCTAssertEqual(rowData1, "OOOO")
        
        // Case 2: Test if "23:59:59" equals to RRRO
        let date2 = getDateFromTime(timeString: "23:59:59")
        let rowData2 = berlinClock.getSingleHourIndecatorRow(date: date2)
        XCTAssertEqual(rowData2, "RRRO")
        
        // Case 3: Test if "02:04:00" equals to RROO
        let date3 = getDateFromTime(timeString: "02:04:00")
        let rowData3 = berlinClock.getSingleHourIndecatorRow(date: date3)
        XCTAssertEqual(rowData3, "RROO")
        
        // Case 4: Test if "08:23:00" equals to RRRO
        let date4 = getDateFromTime(timeString: "08:23:00")
        let rowData4 = berlinClock.getSingleHourIndecatorRow(date: date4)
        XCTAssertEqual(rowData4, "RRRO")
        
        // Case 5: Test if "16:35:00" equals to RRRR
        let date5 = getDateFromTime(timeString: "14:35:00")
        let rowData5 = berlinClock.getSingleHourIndecatorRow(date: date5)
        XCTAssertEqual(rowData5, "RRRR")
    }
    
    func testFiveMinutesRow() {
        // Case 1: Test if "00:00:00" equals to OOOOOOOOOOO
        let date1 = getDateFromTime(timeString: "00:00:00")
        let rowData1 = berlinClock.getFiveMinuteIndecatorRow(date: date1)
        XCTAssertEqual(rowData1, "OOOOOOOOOOO")
        
        // Case 2: Test if "23:59:59" equals to YYRYYRYYRYY
        let date2 = getDateFromTime(timeString: "23:59:59")
        let rowData2 = berlinClock.getFiveMinuteIndecatorRow(date: date2)
        XCTAssertEqual(rowData2, "YYRYYRYYRYY")
        
        // Case 3: Test if "12:04:00" equals to OOOOOOOOOOO
        let date3 = getDateFromTime(timeString: "12:04:00")
        let rowData3 = berlinClock.getFiveMinuteIndecatorRow(date: date3)
        XCTAssertEqual(rowData3, "OOOOOOOOOOO")
        
        // Case 4: Test if "12:23:00" equals to RRRO
        let date4 = getDateFromTime(timeString: "12:23:00")
        let rowData4 = berlinClock.getFiveMinuteIndecatorRow(date: date4)
        XCTAssertEqual(rowData4, "YYRYOOOOOOO")
        
        // Case 5: Test if "12:35:00" equals to YYRYYRYOOOO
        let date5 = getDateFromTime(timeString: "12:35:00")
        let rowData5 = berlinClock.getFiveMinuteIndecatorRow(date: date5)
        XCTAssertEqual(rowData5, "YYRYYRYOOOO")
    }
    
    func testSingleMinuteRow() {
        // Case 1: Test if "00:00:00" equals to OOOO
        let date1 = getDateFromTime(timeString: "00:00:00")
        let rowData1 = berlinClock.getSingleMinuteIndecatorRow(date: date1)
        XCTAssertEqual(rowData1, "OOOO")
        
        // Case 2: Test if "23:59:59" equals to YYYY
        let date2 = getDateFromTime(timeString: "23:59:59")
        let rowData2 = berlinClock.getSingleMinuteIndecatorRow(date: date2)
        XCTAssertEqual(rowData2, "YYYY")
        
        // Case 3: Test if "12:32:00" equals to YYOO
        let date3 = getDateFromTime(timeString: "12:32:00")
        let rowData3 = berlinClock.getSingleMinuteIndecatorRow(date: date3)
        XCTAssertEqual(rowData3, "YYOO")
        
        // Case 4: Test if "12:34:00" equals to YYYY
        let date4 = getDateFromTime(timeString: "12:34:00")
        let rowData4 = berlinClock.getSingleMinuteIndecatorRow(date: date4)
        XCTAssertEqual(rowData4, "YYYY")
        
        // Case 5: Test if "12:35:00" equals to OOOO
        let date5 = getDateFromTime(timeString: "12:35:00")
        let rowData5 = berlinClock.getSingleMinuteIndecatorRow(date: date5)
        XCTAssertEqual(rowData5, "OOOO")
    }
    
}
