import UIKit

class DigitalClockViewController: UIViewController {
    
    var digitalClock: DigitalClock?

    @IBOutlet weak var digitalTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        digitalClock?.delegate = self
        updateView()
    }
    
    private func updateView() {
        digitalTimeLabel.text = digitalClock?.digitalTime
    }
}

extension DigitalClockViewController: DigitalClockDelegate {
    func dataUpdated() {
        updateView()
    }
}
