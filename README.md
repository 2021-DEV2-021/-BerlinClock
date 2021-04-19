# BerlinClock

## Run Project 
- Run BerlinClock Scheme in Xcode
- No external dependencies to install

## Run tests 
- Run BerlinClockTests Scheme in Xcode 
- No external dependencies to install

## Approach

I first went through the description of the kata assignment of the link provided and the web page mentioned with more information on this page. The webpage with more information was the foundation for building out the BerlinClock using TDD, since it had a description of the test cases. Knowing what the test case are and keeping in mind that the link provided also showed digital clock beneath the BerlinClock in the UI, I decided to start with a base Clock for building these two clocks. The base clock is a simple protocol describing the minimal fields (a timer to update the clock each second and a date). I later also added utility functions in a protocol extension to share functionality between Digital and -BerlinClock. After this, I made the base of BerlinClock and started implementing the test cases(as described on the webpage) by first writing the test and then implementing it in the BerlinClock class. After writing all the test cases for BerlinClock, I implemented the DigitalClock on the same principles. 

After the implementation of both classes, I started building out the UI. I split up my ViewController into two child view controllers for the digital clock and the Berlin clock to have a separation of concern and keeping my ViewController small. While building the UI, I added some functionality to Models of DigitalClock and BerlinClock to make it easier for the UI to read the values and added a delegate to notify the view it needs to update when the date in the class has changed.
