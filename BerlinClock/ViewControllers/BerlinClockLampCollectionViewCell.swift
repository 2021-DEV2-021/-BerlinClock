import UIKit

enum BerlinLampShape {
    case round
    case rectangle
}

class BerlinClockLampCollectionViewCell: UICollectionViewCell {
    
    private var berlinClockLamp: BerlinClockLamp?
    
    func setup(berlinClockLampData: BerlinClockLamp, shape: BerlinLampShape) {
        self.berlinClockLamp = berlinClockLampData
        renderView(shape: shape)
    }
    
    private func renderView(shape: BerlinLampShape) {
        self.layer.backgroundColor = getbackgroundColor()
        if (shape == .round) {
            self.layer.cornerRadius = self.layer.bounds.width / 2
        } else {
            self.layer.cornerRadius = 0
        }
    }
    
    private func getbackgroundColor() -> CGColor {
        switch berlinClockLamp {
        case .R:
            return UIColor.red.cgColor
        case .Y:
            return UIColor.yellow.cgColor
        default:
            return UIColor.black.cgColor
        }
    }
}
