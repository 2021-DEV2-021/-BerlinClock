import UIKit

class BerlinClockViewController: UIViewController {
    
    var berlinClock: BerlinClock?
    
    @IBOutlet weak var gridCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        berlinClock?.delegate = self
        gridCollectionView.delegate = self
        gridCollectionView.dataSource = self
    }
    
    // Get the shape of the lamp based on the row.
    func getBerlinClockLampShapeForCellSection(section: Int) -> BerlinLampShape {
        switch section {
        case 0:
            return .round
        default:
            return .rectangle
        }
    }
}

extension BerlinClockViewController: UICollectionViewDelegate {
    
}

extension BerlinClockViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let berlinClock = berlinClock else {
            return 0
        }
        return berlinClock.numberOfLampRows
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let berlinClock = berlinClock else {
            return 0
        }
        return berlinClock.getNumberOfItemsForLampRow(row: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let berlinClockLampData = berlinClock {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BerlinClockLamp", for: indexPath) as? BerlinClockLampCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.setup(berlinClockLampData: berlinClockLampData.getLampStatusForLamp(row: indexPath.section, numberInRow: indexPath.row), shape: getBerlinClockLampShapeForCellSection(section: indexPath.section))
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension BerlinClockViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let heightCollectionView = collectionView.superview?.layer.bounds.height ?? 400
        let widthCollectionView =  Double(UIScreen.main.bounds.width - 40)
        let numberOfSectionsInGrid = gridCollectionView.numberOfSections
        let numberOfCellsInSectionForCell = gridCollectionView.numberOfItems(inSection: indexPath.section)
        let heightCell: Double = Double((Int(heightCollectionView) - (numberOfSectionsInGrid * 10)) / numberOfSectionsInGrid)
        var widthCell: Double = 0
        if (numberOfCellsInSectionForCell == 1) {
           widthCell = heightCell
        } else {
            widthCell = (widthCollectionView - Double((numberOfCellsInSectionForCell * 10))) / Double(numberOfCellsInSectionForCell)
        }
        return CGSize(width: widthCell, height: heightCell)
    }
}

extension BerlinClockViewController: BerlinClockDelegate {
    func dataUpdated() {
        gridCollectionView.reloadData()
    }
}
