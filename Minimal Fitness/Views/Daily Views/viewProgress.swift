import UIKit
import SnapKit
import FirebaseFirestore

class viewProgress: UIViewController {
    
    // MARK: Variables
    let db = Firestore.firestore()
    
    var dataArray: [[String: Any]] = []
    var weights: [String] = []
    var doubleWeights: [Double] = []
    
    
    private var chartView: ChartView!
    
    // MARK: Components
    
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
        label.text = "Your weight changes over the past months"
        label.textAlignment = .center
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "progress-2"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = UserDefaults.standard
        let email = data.string(forKey: "email")!
        
        readUserWeightsFromFirebase(email: email)
        
        setupUI()
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
    
    // MARK: Functions
    
    //Bar chart class is called here with the weight data
    func setupChartView() {
        chartView = ChartView(frame: CGRect(x: 10, y: 300, width: 400, height: 200))
        chartView.backgroundColor = .white
        let data: [Double] = doubleWeights
        
        chartView.updateChart(with: data)
        view.addSubview(chartView)
        
        chartView.snp.makeConstraints { make in
            make.top.equalTo(labelTitleTwo.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(200)
        }
    }
    
    //Getting the weight changes of users
    func readUserWeightsFromFirebase(email: String) {
        db.collection("/userweights")
            .whereField("email", isEqualTo: email) // Filter documents by email address
            .getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        self.dataArray.append(data)
                    }
                }
                self.saveweight()
                self.convertStringWeightsToDouble()
                self.printArrayData()
                self.setupChartView()
            }
    }
    
    func saveweight(){
        for data in dataArray {
            self.weights.append(data["weight"] as! String)
        }
    }
    func printArrayData() {
        
        print("weight data array:")
        for data in doubleWeights {
            
            print(data)
        }
    }
    
    func convertStringWeightsToDouble() {
       
        for weightString in weights {
            if let weightDouble = Double(weightString) {
                doubleWeights.append(weightDouble)
            }
        }
    
    }

}

//MARK: Bar Chart Class
class ChartView: UIView {
    
    private var dataEntries: [Double] = []
    
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
    
    func updateChart(with data: [Double]) {
        dataEntries = data
        setNeedsDisplay()
    }
}

