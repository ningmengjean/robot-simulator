//Solution goes in Sources

import Foundation

enum Bearing: Int {
    case north = 0
    case east
    case south
    case west
}

enum Instructions {
    case advance
    case turnLeft
    case turnRight
    case error
}

class SimulatedRobot {
    var coordinates = [0, 0]
    var bearing = Bearing.north
    
    func orient(_ bearing: Bearing) {
        self.bearing = bearing
    }
    
    func at(x: Int, y: Int) {
        self.coordinates = [x, y]
    }
    
    func place(x: Int, y: Int, direction: Bearing) {
        self.at(x: x, y: y)
        self.orient(direction)
    }
    
    func turnRight() {
        self.bearing = Bearing(rawValue: (self.bearing.rawValue + 1) % 4)!
    }
    
    func turnLeft() {
        self.bearing = Bearing(rawValue: (self.bearing.rawValue + 3) % 4)!
    }
    
    func advance() {
        switch bearing {
        case .north:
            self.coordinates[1] += 1
        case .east:
            self.coordinates[0] += 1
        case .south:
            self.coordinates[1] -= 1
        case .west:
            self.coordinates[0] -= 1
        }
    }
    
    func instructions(_ s: String) -> [Instructions] {
        return s.map {
            switch $0 {
            case "A":
                return .advance
            case "L":
                return .turnLeft
            case "R":
                return .turnRight
            default:
                return .error
            }
        }
    }
    
    func evaluate(_ s: String) {
        for i in instructions(s) {
            switch i {
            case .advance:
                advance()
            case .turnLeft:
                turnLeft()
            case .turnRight:
                turnRight()
            case .error:
                continue
            }
        }
    }
}











