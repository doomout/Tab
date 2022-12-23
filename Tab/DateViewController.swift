
import UIKit

class DateViewController: UIViewController {
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //타이머 설정하기(타이머 간격 | 동작될 뷰  | 타이머 구동될 때 실행할 함수 | 사용자 정보 | 반복 여부)
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from : datePickerView.date)
    }
    @objc func updateTime() {
        //lblCurrentTime.text = String(count)
        //count = count + 1
        //현재 시간을 가져온다.
        let date = NSDate()
        
        //날짜를 출력하기 위해 선언
        let formatter = DateFormatter()
        
        //날짜 형식 지정
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
    }
}

