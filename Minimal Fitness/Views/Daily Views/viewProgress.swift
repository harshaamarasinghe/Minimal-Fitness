import UIKit
import SnapKit

class viewProgress: UIViewController {
    
    // MARK:- Variables
    
    private var chartView: ChartView!
    
    // MARK:- Components
    
    let labelTitleOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 36, weight: .thin)
        label.text = "My Progress"
        label.textAlignment = .center
        return label
    }()
    
    let labelTitleTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.numberOfLines = 0
        label.text = "Your weight changes over the past 6 months"
        label.textAlignment = .center
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "progress-2"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupChartView()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(labelTitleOne)
        view.addSubview(labelTitleTwo)
        view.addSubview(image)
        
        labelTitleOne.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-30)
            make.centerX.equalToSuperview()
        }
        
        labelTitleTwo.snp.makeConstraints { make in
            make.top.equalTo(labelTitleOne.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
        }
        
        image.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-80)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 450, height: 450))
        }
    }
    
    // MARK:- Functions
    
    func setupChartView() {
        chartView = ChartView(frame: CGRect(x: 10, y: 300, width: 400, height: 200))
        chartView.backgroundColor = .white
        let data: [CGFloat] = [60, 63, 65, 68, 70, 68]
        
        chartView.updateChart(with: data)
        view.addSubview(chartView)
        
        chartView.snp.makeConstraints { make in
            make.top.equalTo(labelTitleTwo.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(200)
        }

    }
}

class ChartView: UIView {
    
    private var dataEntries: [CGFloat] = []
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let chartWidth = rect.width
        let chartHeight = rect.height - 20
        
        let columnXPoint = { (column: Int) -> CGFloat in
            let spacing = chartWidth / CGFloat(self.dataEntries.count + 1)
            return CGFloat(column + 1) * spacing
        }
        
        let columnYPoint = { (value: CGFloat) -> CGFloat in
            let maxValue = self.dataEntries.max() ?? 0
            let yScale = (chartHeight - 20) / maxValue
            return chartHeight - value * yScale
        }
        
        // Draw bars for bar chart
        let barWidth: CGFloat = 30
        let barSpacing: CGFloat = 20
        var xPosition: CGFloat = 55
        
        for (_, value) in dataEntries.enumerated() {
            let columnHeight = columnYPoint(value)
            let barRect = CGRect(x: xPosition, y: columnHeight, width: barWidth, height: chartHeight - columnHeight)
            
            context.setFillColor(CGColor(red: 255/255, green: 74/255, blue: 23/255, alpha: 1))
            context.fill(barRect)
            context.fillPath()
            
            xPosition += barSpacing + barWidth
        }
        
        // Draw line for line chart
        context.setStrokeColor(UIColor.label.cgColor)
        context.setLineWidth(2.0)
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: columnXPoint(0), y: columnYPoint(dataEntries[0])))
        
        for i in 1..<dataEntries.count {
            let nextPoint = CGPoint(x: columnXPoint(i), y: columnYPoint(dataEntries[i]))
            linePath.addLine(to: nextPoint)
        }
        
        context.addPath(linePath.cgPath)
        context.strokePath()
    }
    
    func updateChart(with data: [CGFloat]) {
        dataEntries = data
        setNeedsDisplay()
    }
}
