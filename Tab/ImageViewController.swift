//
//  ViewController.swift
//  ImageView
//
//  Created by 현구김 on 2022/12/18.
//

import UIKit

class ImageViewController: UIViewController {
    var isZoom = false  //확대 여부를 나타내는 변수
    var imgOn : UIImage?  //켜진 전구 이미지가 있는 UIImage 타입의 변수
    var imgOff : UIImage? //꺼진 전구 이미지가 있는 UIImage 타입의 변수(?는 어떤 값이 존재할지 알수 없다는 표시)

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnReszie: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn //기본 on상태
    }

    //확대 버튼 클릭시
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0 //이미지를 2배로 할 것이기에 실수값 2.0으로 설정
        var newWidth:CGFloat, newHeight:CGFloat //확대할 크기를 계산해서 보관할 변수
        
        if(isZoom) { //현재 상태가 확대일 때
            //이미지 가로 세로 크기에 2.0으로 나눔
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            //확대로 스위치 변환
            btnReszie.setTitle("확대", for: .normal)
        }else{//현재가 축소 상태 일때
            //이미지 가로 세로 크기에 2.0으로 곱함
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            //스위치를 축소로 변경
            btnReszie.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        }else{
            imgView.image = imgOff
        }
    }
    
}

