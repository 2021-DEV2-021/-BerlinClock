import Foundation

protocol Clock {
    var date: Date {get }
    var timer: Timer? {get set}
}
