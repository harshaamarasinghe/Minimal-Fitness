import UIKit
import WebKit

class viewExercise: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //Mark: - Variables
    
    var timer: Timer?
    var elapsedTime: TimeInterval = 0.0
    
    var videoId: String = ""
    
    var reps:Int = 0
    var sets:Int = 0
    var weight:String = ""
    
    
    //Mark: - Components
    
    let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.layer.cornerRadius = 10
        return webView
    }()
    
    let labelWorkout : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .thin)
        label.textColor = .black
        
        label.text = "Error"
        label.textAlignment = .center
        return label
    }()
    
    let labelDesc : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .thin)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Error"
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Get the weights
    
    let labelWeight : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.textColor = .black
        label.text = "Weight"
        label.textAlignment = .center
        return label
    }()
    
    let weightPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let weightData = stride(from: 0.0, to: 200.5, by: 0.5).map { String(format: "%.1f kg", $0) }
    
    
    let hStackWeight : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    //MARK: - Get the reps
    
    let labelReps : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.textColor = .black
        label.text = "Reps"
        label.textAlignment = .center
        return label
    }()
    
    let repetitionsPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let repetitionsData = Array(1...25)
    
    let hStackReps : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    //MARK: - Get the sets
    
    let labelSets : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .thin)
        label.textColor = .black
        label.text = "Sets"
        label.textAlignment = .center
        return label
    }()
    
    let setsPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let setData = Array(1...10)
    
    let hStackSets : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 20
        return stack
    }()
    
    let startButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Start Workout  ", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 28, weight: .semibold)
        button.backgroundColor = UIColor(red: 69/255, green: 90/255, blue: 100/255, alpha: 1.0)
        button.layer.cornerRadius = 10
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        repetitionsPicker.delegate = self
        repetitionsPicker.dataSource = self
        
        setsPicker.delegate = self
        setsPicker.dataSource = self
        
        //weight
        
        weightPicker.delegate = self
        weightPicker.dataSource = self
        
        setupUI()
    }
    
    //Mark:- Youtube Video Player
    
    func youtubeVideoView(){
        let embedHTML = "<html><body><iframe width=\"980\" height=\"500\" src=\"https://www.youtube.com/embed/\(videoId)?playsinline=1\" frameborder=\"0\" allowfullscreen></iframe></body></html>"
        webView.loadHTMLString(embedHTML, baseURL: nil)
    }
    
    func setupUI(){
        view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.buttonAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
        navigationItem.standardAppearance = appearance
        navigationController?.navigationBar.tintColor = UIColor.orange
        
        
        youtubeVideoView()
        
        view.addSubview(webView)
        view.addSubview(labelWorkout)
        view.addSubview(labelDesc)
        
        hStackReps.addArrangedSubview(labelReps)
        hStackReps.addArrangedSubview(repetitionsPicker)
        
        view.addSubview(hStackReps)
        
        hStackSets.addArrangedSubview(labelSets)
        hStackSets.addArrangedSubview(setsPicker)
        
        
        view.addSubview(hStackSets)
        
        hStackWeight.addArrangedSubview(labelWeight)
        hStackWeight.addArrangedSubview(weightPicker)
        
        view.addSubview(hStackWeight)
        view.addSubview(startButton)
        
        //Mak: - Button Action
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside) // Add target action
        
        
        //Mark: - Constraints
        
        labelWorkout.snp.makeConstraints { make in
            make.top.equalTo(webView.snp.bottom).offset(10)
            make.centerX.equalTo(view)
        }
        
        labelDesc.snp.makeConstraints { make in
            make.top.equalTo(labelWorkout.snp.bottom).offset(5)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.centerX.equalTo(view)
        }
        
        webView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(10)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 300, height: 300))
        }
        
        hStackReps.snp.makeConstraints { make in
            make.top.equalTo(labelDesc.snp.bottom).offset(-20)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
        }
        
        repetitionsPicker.snp.makeConstraints { make in
            
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        hStackSets.snp.makeConstraints { make in
            make.top.equalTo(hStackReps.snp.bottom).offset(5)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
        }
        
        setsPicker.snp.makeConstraints { make in
            
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        hStackWeight.snp.makeConstraints { make in
            make.top.equalTo(hStackSets.snp.bottom).offset(5)
            make.left.equalTo(view.snp.left).offset(30)
            make.right.equalTo(view.snp.right).offset(-30)
        }
        
        weightPicker.snp.makeConstraints { make in
            
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        
        startButton.snp.makeConstraints { make in
            make.top.equalTo(hStackWeight.snp.bottom).offset(15)
            make.centerX.equalTo(view)
            
        }
        
    }
    
    // MARK: - UIPickerViewDelegate & UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == repetitionsPicker {
            return repetitionsData.count
        } else if pickerView == setsPicker {
            return setData.count
        }else if pickerView == weightPicker {
            return weightData.count
        }
        else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        if pickerView == repetitionsPicker {
            label.text = "\(repetitionsData[row])" // Display the data in each row of the repetitions picker
        } else if pickerView == setsPicker {
            label.text = "\(setData[row])" // Display the data in each row of the sets picker
        }else if pickerView == weightPicker {
            label.text = "\(weightData[row])" // Display the data in each row of the sets picker
        }
        
        return label
    }
    
    //Mark:- Functions for startButton
    
    @objc func startButtonTapped() {
        let alertController = UIAlertController(title: "Workout Stopwatch", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Finish", style: .default, handler: { (_) in
            self.stopTimer()
            self.finishStopwatch(alertController)
        }))
        present(alertController, animated: true, completion: nil)
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
            self.elapsedTime += 1.0
            if let alertController = self.presentedViewController as? UIAlertController {
                alertController.message = self.formatElapsedTime(self.elapsedTime)
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        
        
        
        
    }
    
    func formatElapsedTime(_ elapsedTime: TimeInterval) -> String {
        let minutes = Int(elapsedTime / 60)
        let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func finishStopwatch(_ alertController: UIAlertController) {
        
        //Save "Post Workout" Data
        
        
        
        
        alertController.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
        
        print("Total elapsed time: \(formatElapsedTime(elapsedTime))")
        elapsedTime = 0.0
    }
    
    func savePostWorkoutData(workout:String, reps:Int, sets:Int, weight:String, time:String){
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == repetitionsPicker {
            let selectedReps = repetitionsData[row]
            reps = selectedReps
        } else if pickerView == setsPicker {
            let selectedSets = setData[row]
            sets = selectedSets
        } else if pickerView == weightPicker {
            let selectedWeight = weightData[row]
            weight = selectedWeight
        }
    }
}
