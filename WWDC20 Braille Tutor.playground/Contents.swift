import UIKit
import Foundation
import PlaygroundSupport

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let view = UIView()
        view.backgroundColor = .white
        
        let stickerImage = UIImageView(frame: CGRect(x: 600 - 190 - 10, y: 20, width: 190, height: 180))
        stickerImage.image = UIImage(named: "sticker.png")!
        stickerImage.layer.shadowOpacity = 0.5
        stickerImage.layer.shadowRadius = 7
        stickerImage.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.addSubview(stickerImage)
        let swift_stickerImage = UIImageView(frame: CGRect(x: 70, y: 535, width: 125, height: 125))
        swift_stickerImage.image = UIImage(named: "swift.png")!
        swift_stickerImage.layer.shadowOpacity = 0.5
        swift_stickerImage.layer.shadowRadius = 7
        swift_stickerImage.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.addSubview(swift_stickerImage)
        
        let language = UILabel(frame: CGRect(x: 220, y: 550, width: 300, height: 20))
        language.text = "Language: English / English Braille"
        language.font = language.font.withSize(15)
        language.textColor = UIColor.lightGray
        language.layer.shadowOpacity = 0.1
        language.layer.shadowRadius = 2
        language.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.addSubview(language)
        let typeBraille = UILabel(frame: CGRect(x: 220, y: 585, width: 300, height: 20))
        typeBraille.text = "Print basis: English Alphabet and Numbers"
        typeBraille.font = typeBraille.font.withSize(15)
        typeBraille.textColor = UIColor.lightGray
        typeBraille.layer.shadowOpacity = 0.1
        typeBraille.layer.shadowRadius = 2
        typeBraille.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.addSubview(typeBraille)
        
        let helpButton = UIButton.init(type: .system)
        helpButton.frame = CGRect(x: 200, y: 600, width: 220, height: 60)
        helpButton.setTitle("Help / Infomation", for: .normal)
        helpButton.tintColor = UIColor.WWDC_Peach
        helpButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        helpButton.addTarget(self, action: #selector(button_Help), for: .touchUpInside)
        view.addSubview(helpButton)
                                
        //MARK: -TITLE Info
        let welcomeText = UILabel(frame: CGRect(x: 30, y: 20, width: 300, height: 30))
        welcomeText.text = "Welcome"
        welcomeText.font = welcomeText.font.withSize(25)
        welcomeText.textColor = UIColor.lightGray
        welcomeText.layer.shadowOpacity = 0.1
        welcomeText.layer.shadowRadius = 1
        welcomeText.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.addSubview(welcomeText)
        let titleName = UILabel(frame: CGRect(x: 30, y: 50, width: 400, height: 150))
        titleName.text = "WWDC Braille Tutor"
        titleName.font = titleName.font.withSize(60)
        titleName.textColor = UIColor.WWDC_Green
        titleName.numberOfLines = 2
//        titleName.layer.shadowOpacity = 0.1
//        titleName.layer.shadowRadius = 2
//        titleName.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.addSubview(titleName)
        let dev_nameTitle = UILabel(frame: CGRect(x: 30, y: 200, width: 300, height: 20))
        dev_nameTitle.text = "By Euan Traynor, 2020"
        dev_nameTitle.font = titleName.font.withSize(15)
        dev_nameTitle.textColor = UIColor.lightGray
        dev_nameTitle.layer.shadowOpacity = 0.1
        dev_nameTitle.layer.shadowRadius = 2
        dev_nameTitle.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.addSubview(dev_nameTitle)

        let flashcards_icon = UIImageView(frame: CGRect(x: 35, y: 250, width: 70, height: 70))
        var flashcards_icon_image = UIImage(named: "flashcards_icon.png")!.withRenderingMode(.alwaysTemplate)
        flashcards_icon_image = flashcards_icon_image.imageWithColor(UIColor.WWDC_Green)!
        flashcards_icon.image = flashcards_icon_image
        flashcards_icon.layer.shadowOpacity = 0.1
        flashcards_icon.layer.shadowRadius = 2
        flashcards_icon.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.addSubview(flashcards_icon)
        let literacy_icon = UIImageView(frame: CGRect(x: 35, y: 340, width: 70, height: 70))
        var literacy_icon_image = UIImage(named: "eng_icon.png")!.withRenderingMode(.alwaysTemplate)
        literacy_icon_image = literacy_icon_image.imageWithColor(UIColor.WWDC_Green)!
        literacy_icon.image = literacy_icon_image
        literacy_icon.layer.shadowOpacity = 0.1
        literacy_icon.layer.shadowRadius = 2
        literacy_icon.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.addSubview(literacy_icon)
        let numeracy_icon = UIImageView(frame: CGRect(x: 42, y: 440, width: 60, height: 60))
        var numeracy_icon_image = UIImage(named: "mat_icon.png")!.withRenderingMode(.alwaysTemplate)
        numeracy_icon_image = numeracy_icon_image.imageWithColor(UIColor.WWDC_Green)!
        numeracy_icon.image = numeracy_icon_image
        numeracy_icon.layer.shadowOpacity = 0.1
        numeracy_icon.layer.shadowRadius = 2
        numeracy_icon.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.addSubview(numeracy_icon)
//        var alphabet_icon_image = UIImage(named: "mat_icon.png")!.withRenderingMode(.alwaysTemplate)
//        numeracy_icon_image = numeracy_icon_image.imageWithColor(UIColor.WWDC_Green)!
//        numeracy_icon.image = numeracy_icon_image
//        numeracy_icon.layer.shadowOpacity = 0.1
//        numeracy_icon.layer.shadowRadius = 2
//        numeracy_icon.layer.shadowOffset = CGSize(width: 0, height: 3)
//        view.addSubview(numeracy_icon)

        let go_to_flashcards = UIButton.init(type: .system)
        go_to_flashcards.frame = CGRect(x: 105, y: 250, width: 300, height: 60)
        go_to_flashcards.setTitle("Flashcards", for: .normal)
        go_to_flashcards.tintColor = UIColor.WWDC_Peach
        go_to_flashcards.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 42)
        go_to_flashcards.addTarget(self, action: #selector(button_Flashcards(_ :)), for: .touchUpInside)
        view.addSubview(go_to_flashcards)
        
        let go_to_easy_level = UIButton.init(type: .system)
        go_to_easy_level.frame = CGRect(x: 105, y: 345, width: 420, height: 60)
        go_to_easy_level.setTitle("Literacy Practise", for: .normal)
        go_to_easy_level.tintColor = UIColor.WWDC_Peach
        go_to_easy_level.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 42)
        go_to_easy_level.addTarget(self, action: #selector(button_Easy_Level), for: .touchUpInside)
        view.addSubview(go_to_easy_level)
        
        let go_to_med_level = UIButton.init(type: .system)
        go_to_med_level.frame = CGRect(x: 100, y: 440, width: 470, height: 60)
        go_to_med_level.setTitle("Numeracy Practise", for: .normal)
        go_to_med_level.tintColor = UIColor.WWDC_Peach
        go_to_med_level.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 42)
        go_to_med_level.addTarget(self, action: #selector(button_Medium_Level), for: .touchUpInside)
        view.addSubview(go_to_med_level)
        
//        let helpButton = UIButton.init(type: .system)
//        helpButton.frame = CGRect(x: 95, y: 530, width: 470, height: 60)
//        helpButton.setTitle("Help / Infomation", for: .normal)
//        helpButton.tintColor = UIColor.WWDC_Peach
//        helpButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 42)
//        helpButton.addTarget(self, action: #selector(button_Help), for: .touchUpInside)
//        view.addSubview(helpButton)

//        let helpButton = UIButton.init(type: .system)
//        helpButton.frame = CGRect(x: 520, y: 620, width: 60, height: 60)
//        helpButton.setTitle("?", for: .normal)
////        helpButton.titleLabel?.font = helpButton.titleLabel?.font.withSize(25)
//        helpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
//        helpButton.setTitleColor(.white, for: .normal)
//        helpButton.layer.borderWidth = 5.0
//        helpButton.layer.borderColor = UIColor.white.cgColor
//        helpButton.backgroundColor = UIColor.WWDC_Green
//        helpButton.layer.cornerRadius = 30
//        helpButton.addTarget(self, action: #selector(button_Help), for: .touchUpInside)
//        view.addSubview(helpButton)
        
        self.view = view
    }
    
    @objc func button_Help(_ : UIButton) {
        print("Moved to Help View Controller...")
        
        let rateViewController = HelpViewController()
        rateViewController.modalTransitionStyle = .crossDissolve
        rateViewController.modalPresentationStyle = .overCurrentContext
        self.present(rateViewController, animated: true, completion: nil)
    }

    @objc func button_Flashcards(_ : UIButton) {
        print("Moved to Quecard View Controller...")
        
        let rateViewController = QueCardViewController()
        rateViewController.modalTransitionStyle = .crossDissolve
        rateViewController.modalPresentationStyle = .overCurrentContext
        self.present(rateViewController, animated: true, completion: nil)
    }
    
    @objc func button_Easy_Level(_ : UIButton) {
        print("Moved to Easy Level View Controller...")
        
        let rateViewController = EasyLevelViewController()
        rateViewController.modalTransitionStyle = .crossDissolve
        rateViewController.modalPresentationStyle = .overCurrentContext
        self.present(rateViewController, animated: true, completion: nil)
    }
    @objc func button_Medium_Level(_ : UIButton) {
        print("Moved to Medium Level View Controller...")
        
        let rateViewController = MediumLevelViewController()
        rateViewController.modalTransitionStyle = .crossDissolve
        rateViewController.modalPresentationStyle = .overCurrentContext
        self.present(rateViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

let master = ViewController()
master.preferredContentSize = CGSize(width: 600, height: 700)
PlaygroundPage.current.liveView = master

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
