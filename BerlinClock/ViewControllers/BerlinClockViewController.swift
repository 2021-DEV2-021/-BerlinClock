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

extension BerlinClockViewController: BerlinClockDelegate {
    func dataUpdated() {
        gridCollectionView.reloadData()
    }
}
