
import UIKit

struct Angle {
    static let start = CGFloat(-0.5 * .pi)
    static let end = CGFloat(1.5 * .pi)
}

final class CircularCharactersCounterTopLayerView: UIView {
    
    private  var upperLayer = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        createupperLayerPath()
    }
    
    private func createupperLayerPath() {
        
        let width = frame.size.width
        let height = frame.size.height
        let radius = (width - 1.5) / 2
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: width / 2, y: height / 2),
                                      radius: radius,
                                      startAngle: Angle.start,
                                      endAngle: Angle.end,
                                      clockwise: true)
        
        upperLayer.path = circlePath.cgPath
        upperLayer.fillColor = UIColor.clear.cgColor
        upperLayer.strokeColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        upperLayer.lineWidth = 1.5
        upperLayer.strokeEnd = 1.0
        layer.addSublayer(upperLayer)
    }
}

//MARK: -
final class CircularCharactersCounterView: UIView {
    
    private var progressLayer = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        createProgressLayerPath()
    }
    
    fileprivate func createProgressLayerPath() {
        
        let width = frame.size.width
        let height = frame.size.height
        let radius = (width - 1.5) / 2
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: width / 2, y: height / 2),
                                      radius: radius,
                                      startAngle: Angle.start,
                                      endAngle: Angle.end,
                                      clockwise: true)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.red.cgColor
        progressLayer.lineWidth = 3
        progressLayer.strokeEnd = 0.0
        layer.addSublayer(progressLayer)
    }
    
    func setProgressWithAnimation(numberOfCharacters: Int) {
        
        let progressValue: Float = Float(numberOfCharacters) / 1000 // divide, because we have characters limit 1000 and progress is 0 to 1
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 1
        //animation.fromValue = 0
        animation.toValue = progressValue
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        progressLayer.strokeEnd = CGFloat(progressValue)
        progressLayer.add(animation, forKey: "animateprogress")
    }
}
