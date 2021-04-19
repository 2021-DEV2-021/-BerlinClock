import UIKit

fileprivate enum SegueKeys: String {
    case digitalClockSegue
    case berlinClockSegue
}

class ClockViewController: UIViewController {
    
    var berlinClock : BerlinClock!
    var digitalClock : DigitalClock!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == SegueKeys.berlinClockSegue.rawValue) {
            guard let berlinClockChildVC = segue.destination as? BerlinClockViewController else {
                return
            }
            berlinClockChildVC.berlinClock = berlinClock
        }
    }
}

