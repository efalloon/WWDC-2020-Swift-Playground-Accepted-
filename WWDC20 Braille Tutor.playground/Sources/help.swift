import UIKit
import Foundation

public class HelpViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let exitBackdrop = UIButton.init(type: .system)
        exitBackdrop.frame = CGRect(x: 0, y: 0, width: 600, height: 700)
        exitBackdrop.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        exitBackdrop.addTarget(self, action: #selector(exit), for: .touchUpInside)
        view.addSubview(exitBackdrop)

        let cardView = UIView(frame: CGRect(x: 50, y: 50, width: 500, height: 600))
        cardView.backgroundColor = UIColor.white
        cardView.layer.cornerRadius = 25
        cardView.layer.borderWidth = 2
        cardView.layer.borderColor = UIColor.WWDC_Green.cgColor
        cardView.layer.borderWidth = 5
        cardView.layer.shadowOpacity = 0.7
        cardView.layer.shadowRadius = 10
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.addSubview(cardView)
        
        let stickerImage = UIImageView(frame: CGRect(x: 600 - 190 - 10, y: 20, width: 190, height: 180))
        stickerImage.image = UIImage(named: "sticker.png")!
        stickerImage.layer.shadowOpacity = 0.5
        stickerImage.layer.shadowRadius = 7
        stickerImage.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.addSubview(stickerImage)
        
        //MARK: -TITLE Info
        let welcomeText = UILabel(frame: CGRect(x: 30, y: 20, width: 300, height: 25))
        welcomeText.text = "WWDC Braille Tutor"
        welcomeText.font = welcomeText.font.withSize(18)
        welcomeText.textColor = UIColor.lightGray
        welcomeText.layer.shadowOpacity = 0.2
        welcomeText.layer.shadowRadius = 2
        welcomeText.layer.shadowOffset = CGSize(width: 0, height: 4)
        cardView.addSubview(welcomeText)
        let titleName = UILabel(frame: CGRect(x: 30, y: 45, width: 400, height: 80))
        titleName.text = "Infomation"
        titleName.font = titleName.font.withSize(55)
        titleName.textColor = UIColor.WWDC_Green
        titleName.numberOfLines = 2
//        titleName.backgroundColor = .red
        titleName.layer.shadowOpacity = 0.1
        titleName.layer.shadowRadius = 2
        titleName.layer.shadowOffset = CGSize(width: 0, height: 5)
        cardView.addSubview(titleName)
        let dev_nameTitle = UILabel(frame: CGRect(x: 30, y: 600 - 15 - 30, width: 300, height: 15))
        dev_nameTitle.text = "By Euan Traynor, 2020"
        dev_nameTitle.font = titleName.font.withSize(10)
        dev_nameTitle.textColor = UIColor.lightGray
        dev_nameTitle.layer.shadowOpacity = 0.1
        dev_nameTitle.layer.shadowRadius = 2
        dev_nameTitle.layer.shadowOffset = CGSize(width: 0, height: 3)
        cardView.addSubview(dev_nameTitle)
        
        let louisBrailleInfo = UILabel(frame: CGRect(x: 25, y: 225, width: 450, height: 150))
        louisBrailleInfo.text = "Louis Braille was born on January 4, 1809 in Coupvray, France. The son of a harness-maker, Braille was blinded by an accident when he was three. Educated at the National Institute for Blind Youth in Paris, Braille developed a raised-dot code that enabled blind people to read and write. Although his system was in limited use during his lifetime, it has since been accepted globally. Louis Braille died in 1852."
        louisBrailleInfo.font = titleName.font.withSize(14)
        louisBrailleInfo.textColor = UIColor.lightGray
        louisBrailleInfo.numberOfLines = 0
        louisBrailleInfo.textAlignment = .center
        cardView.addSubview(louisBrailleInfo)
        
        let BrailleInfo = UILabel(frame: CGRect(x: 25, y: 350, width: 450, height: 200))
        BrailleInfo.text = "Braille is a system of raised dots that can be read with the fingers by people who are blind or who have low vision. Teachers, parents, and others who are not visually impaired ordinarily read braille with their eyes. Braille is not a language. Rather, it is a code by which many languages—such as English, Spanish, Arabic, Chinese, and dozens of others—may be written and read. Braille is used by thousands of people all over the world in their native languages, and provides a means of literacy for all."
        BrailleInfo.font = titleName.font.withSize(14)
        BrailleInfo.textColor = UIColor.lightGray
        BrailleInfo.numberOfLines = 0
        BrailleInfo.textAlignment = .center
        cardView.addSubview(BrailleInfo)
        
        let louisBraille = UIImageView(frame: CGRect(x: 200, y: 125, width: 100, height: 100))
        louisBraille.image = UIImage(named: "louis.png")!
        louisBraille.layer.shadowOpacity = 0.5
        louisBraille.layer.shadowRadius = 7
        louisBraille.layer.shadowOffset = CGSize(width: 0, height: 10)
        cardView.addSubview(louisBraille)
        
        let exitbutton = UIButton.init(type: .system)
        exitbutton.frame = CGRect(x: 500, y: 600, width: 20, height: 20)
        exitbutton.setImage(UIImage(named: "exitButton.png")!, for: .normal)
        exitbutton.tintColor = UIColor.WWDC_Green
        exitbutton.addTarget(self, action: #selector(exit), for: .touchUpInside)
        view.addSubview(exitbutton)
    }
    
    @objc func exit(_ : UIButton) {
        dismiss(animated: true)
    }
}
