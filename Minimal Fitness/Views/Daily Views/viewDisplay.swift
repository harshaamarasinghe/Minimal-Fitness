
import UIKit
import YouTubePlayerKit

class viewDisplay: UIViewController {

    //variables
    
    var timer:Timer = Timer()
    var count:Int = 0
    
    
    //Components
    
    let labelTimer : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .bold)
        //label.textColor = UIColor(red: 89/255, green: 89/255, blue: 89/255, alpha: 1.0)
        label.backgroundColor = UIColor(red: 89/255, green: 89/255, blue: 89/255, alpha: 1.0)
        label.textColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.text = "00 : 00 : 00"
        label.textAlignment = .center
        return label
    }()
    
    let labelExercise : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .medium)
        label.backgroundColor = UIColor(red: 255/255, green: 114/255, blue: 94/255, alpha: 1.0)
        label.textColor = .white
        //rgba(64, 98, 187, 1)rgba(255, 114, 94, 1)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.numberOfLines = 0
        label.text = "Bicep Curl"
        label.textAlignment = .center
        return label
    }()
    
    let labelEffectiveBodyPart : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28, weight: .medium)
        label.backgroundColor = UIColor(red: 1/255, green: 166/255, blue: 170/255, alpha: 1.0)
        label.textColor = .white
        
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.text = "Biceps"
        label.textAlignment = .center
        return label
    }()
    
    //Reps Counter
    
    let addButtonRep : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let textFieldRep : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "0"
        return textField
    }()
    
    let removeButtonRep : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    //Sets Counter
    
    let addButtonSet : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let textFieldSet : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "0"
        return textField
    }()
    
    let removeButtonSet : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    let vStackInput : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        return stack
    }()
    
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        startTimer()
        
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)

        view.addSubview(labelTimer)
        view.addSubview(labelExercise)
        view.addSubview(labelEffectiveBodyPart)
        
        //Constraints
        labelTimer.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(70)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 180, height: 50))
        }
        
        labelExercise.snp.makeConstraints { make in
            make.top.equalTo(labelTimer.snp.bottom).offset(20)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(20)
            make.size.equalTo(CGSize(width: 180, height: 50))
        }
        
        labelEffectiveBodyPart.snp.makeConstraints { make in
            make.top.equalTo(labelTimer.snp.bottom).offset(20)
            make.left.equalTo(labelExercise.snp.right).offset(20)
            make.size.equalTo(CGSize(width: 180, height: 50))
        }
        
        
    }
    
    //Timer
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeCounter), userInfo: nil, repeats: true)
    }
    
    @objc func timeCounter()-> Void{
        count = count+1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        labelTimer.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int){
        return ((seconds / 3600), ((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}
