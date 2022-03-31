import Foundation

public extension String {
     func titlecased() -> String {
        return self.uppercased(with: Locale.current)
    }
}
