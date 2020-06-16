import UIKit
import Foundation

public extension UIColor {
    static let dimmedWhite = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    static let mintBlue = UIColor(red: 61/255, green: 178/255, blue: 217/255, alpha: 1.0)
    static let WWDC_Green = UIColor(red: 196/255, green: 198/255, blue: 40/255, alpha: 1.0)
    static let WWDC_Peach = UIColor(red: 210/255, green: 163/255, blue: 142/255, alpha: 1.0)
}

extension UIImage {
    func imageWithColor(_ color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale);
        guard let context = UIGraphicsGetCurrentContext(), let cgImage = self.cgImage else { return nil }

        context.translateBy(x: 0, y: self.size.height)
        context.scaleBy(x: 1.0, y: -1.0);
        context.setBlendMode(.normal)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context.clip(to: rect, mask: cgImage)
        color.setFill()
        context.fill(rect)
        let  newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();

        return newImage
    }
}
