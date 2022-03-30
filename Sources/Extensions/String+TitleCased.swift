import Foundation

public extension String {
    public func titlecased() -> String {
        return self.uppercased(with: Locale.current)
    }
}
