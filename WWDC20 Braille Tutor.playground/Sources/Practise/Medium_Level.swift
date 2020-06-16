import UIKit
import Foundation

var number_one = "⁃⁃⁃⁃⁃⁃"
var number_two = "⁃⁃⁃⁃⁃⁃"
var Med_Score = 0

public class MediumLevelViewController: UIViewController {
    
    var cardEnterView: UIView = {
        let cardView = UIView(frame: CGRect(x: 65, y: 260, width: 200, height: 300))
        cardView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 15
        cardView.layer.shadowOpacity = 0.3
        cardView.layer.shadowRadius = 10
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
        return cardView
    }()
    
    var cardEnterView2: UIView = {
        let cardView = UIView(frame: CGRect(x: 335, y: 260, width: 200, height: 300))
        cardView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 15
        cardView.layer.shadowOpacity = 0.3
        cardView.layer.shadowRadius = 10
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
        return cardView
    }()
    
    let QuestionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.lightGray
        let labelFont = UIFont(name: "HelveticaNeue-Bold", size: 18)
        let attributes :Dictionary = [NSAttributedString.Key.font : labelFont]
        // Create attributed string
        let attrString = NSAttributedString(string: "Answer the below equation by selecting/ clicking the correct braille dots on the braille card/s.", attributes:attributes as [NSAttributedString.Key : Any])
        label.attributedText = attrString
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        return label
    }()
    
    let EquationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.WWDC_Peach
        let labelFont = UIFont(name: "HelveticaNeue-Bold", size: 100)
        let attributes :Dictionary = [NSAttributedString.Key.font : labelFont]
        // Create attributed string
        let attrString = NSAttributedString(string: "4 x 5", attributes:attributes as [NSAttributedString.Key : Any])
        label.attributedText = attrString
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        return label
    }()
    
    var QuestionNumberText: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 15, width: 300, height: 20))
        label.text = "Question: 1 / 5"
        label.font = label.font.withSize(10)
        label.textColor = UIColor.lightGray
        label.layer.shadowOpacity = 0.2
        label.layer.shadowRadius = 2
        label.layer.shadowOffset = CGSize(width: 0, height: 4)
        return label
    }()
    
    func replace(_ myString: String, _ index: Int, _ newChar: Character) -> String {
        var chars = Array(myString)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    
    @objc func button_select(sender: UIButton) {
        switch(sender.tag){
            case 1 :
                if Array(number_one)[0] == "⁃" {
                    sender.backgroundColor = .black
                    number_one = replace(number_one, 0, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_one = replace(number_one, 0, "⁃")
                }
            case 2 :
                if Array(number_one)[1] == "⁃" {
                    sender.backgroundColor = .black
                    number_one = replace(number_one, 1, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_one = replace(number_one, 1, "⁃")
                }
            case 3 :
                if Array(number_one)[2] == "⁃" {
                    sender.backgroundColor = .black
                    number_one = replace(number_one, 2, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_one = replace(number_one, 2, "⁃")
                }
            case 4 :
                if Array(number_one)[3] == "⁃" {
                    sender.backgroundColor = .black
                    number_one = replace(number_one, 3, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_one = replace(number_one, 3, "⁃")
                }
            case 5 :
                if Array(number_one)[4] == "⁃" {
                    sender.backgroundColor = .black
                    number_one = replace(number_one, 4, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_one = replace(number_one, 4, "⁃")
                }
            default :
                if Array(number_one)[5] == "⁃" {
                    sender.backgroundColor = .black
                    number_one = replace(number_one, 5, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_one = replace(number_one, 5, "⁃")
                }
        }
    }
    
    @objc func button_select2(sender: UIButton) {
        switch(sender.tag){
            case 7 :
                if Array(number_two)[0] == "⁃" {
                    sender.backgroundColor = .black
                    number_two = replace(number_two, 0, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_two = replace(number_two, 0, "⁃")
                }
            case 8 :
                if Array(number_two)[1] == "⁃" {
                    sender.backgroundColor = .black
                    number_two = replace(number_two, 1, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_two = replace(number_two, 1, "⁃")
                }
            case 9 :
                if Array(number_two)[2] == "⁃" {
                    sender.backgroundColor = .black
                    number_two = replace(number_two, 2, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_two = replace(number_two, 2, "⁃")
                }
            case 10 :
                if Array(number_two)[3] == "⁃" {
                    sender.backgroundColor = .black
                    number_two = replace(number_two, 3, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_two = replace(number_two, 3, "⁃")
                }
            case 11 :
                if Array(number_two)[4] == "⁃" {
                    sender.backgroundColor = .black
                    number_two = replace(number_two, 4, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_two = replace(number_two, 4, "⁃")
                }
            default :
                if Array(number_two)[5] == "⁃" {
                    sender.backgroundColor = .black
                    number_two = replace(number_two, 5, "•")
                } else {
                    sender.backgroundColor = .dimmedWhite
                    number_two = replace(number_two, 5, "⁃")
                }
        }
    }
    
    func brailleMaker() {
        number_one = "⁃⁃⁃⁃⁃⁃"
        number_two = "⁃⁃⁃⁃⁃⁃"
        
        let entire_Braille: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor.white
            return view
        }()
        
        let dot_V1: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 1
            dot.addTarget(self, action: #selector(button_select), for: .touchUpInside)
            return dot
        }()
        let dot_V2: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 2
            dot.addTarget(self, action: #selector(button_select), for: .touchUpInside)
            return dot
        }()
        let dot_V3: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 3
            dot.addTarget(self, action: #selector(button_select), for: .touchUpInside)
            return dot
        }()
        let dot_V4: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 4
            dot.addTarget(self, action: #selector(button_select), for: .touchUpInside)
            return dot
        }()
        let dot_V5: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 5
            dot.addTarget(self, action: #selector(button_select), for: .touchUpInside)
            return dot
        }()
        let dot_V6: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 6
            dot.addTarget(self, action: #selector(button_select), for: .touchUpInside)
            return dot
        }()

        let textLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.textColor = .black
            return label
        }()

        let characterLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.textColor = .black
            return label
        }()

//        let page_number: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.textAlignment = .center
//            label.textColor = .mintBlue
//            return label
//        }()

        var finalBox: BrailleCode! {
            didSet {
                let colour_list_of_dots = [dot_V1, dot_V2, dot_V3, dot_V4, dot_V5, dot_V6]
                let braille_value = finalBox.value
                textLabel.text = braille_value
    //            characterLabel.text = finalBox.character
                var braille_point_counter = 0

                for letter in braille_value {
                    if letter == "⁃" {
                        colour_list_of_dots[braille_point_counter].backgroundColor = UIColor.dimmedWhite
                    } else {
                        colour_list_of_dots[braille_point_counter].backgroundColor = UIColor.black
                    }

                    braille_point_counter += 1
                }
            }
        }
        finalBox = choosenBrailleValue
//        LetterLabel.isHidden = true

    //    addSubview(textLabel)
    //    addSubview(page_number)
        cardEnterView.addSubview(characterLabel)
        cardEnterView.addSubview(entire_Braille)

        characterLabel.centerXAnchor.constraint(equalTo: cardEnterView.centerXAnchor).isActive = true
        characterLabel.bottomAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: 4).isActive = true
        characterLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        characterLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

        entire_Braille.centerXAnchor.constraint(equalTo: cardEnterView.centerXAnchor).isActive = true
        entire_Braille.centerYAnchor.constraint(equalTo: cardEnterView.centerYAnchor).isActive = true
        entire_Braille.heightAnchor.constraint(equalToConstant: (250)).isActive = true
        entire_Braille.widthAnchor.constraint(equalToConstant: 200).isActive = true

        var counter = 0
        let list_of_dots = [dot_V1, dot_V2, dot_V3, dot_V4, dot_V5, dot_V6]

        while counter < 6 {
            entire_Braille.addSubview(list_of_dots[counter])

            var value: Int
            if counter >= 4 {
                value = 3
            } else {
                value = 1
            }

            if counter >= 2 {
                if counter % 2 != 0 {
                    list_of_dots[counter].topAnchor.constraint(equalTo: list_of_dots[value].topAnchor, constant: 75).isActive = true
                    list_of_dots[counter].trailingAnchor.constraint(equalTo: entire_Braille.trailingAnchor, constant: -25).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 50).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 50).isActive = true
                } else {
                    list_of_dots[counter].topAnchor.constraint(equalTo: list_of_dots[value].topAnchor, constant: 75).isActive = true
                    list_of_dots[counter].leadingAnchor.constraint(equalTo: entire_Braille.leadingAnchor, constant: 25).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 50).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 50).isActive = true
                }
            } else {
                if counter % 2 != 0 {
                    list_of_dots[counter].topAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: 25).isActive = true
                    list_of_dots[counter].trailingAnchor.constraint(equalTo: entire_Braille.trailingAnchor, constant: -25).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 50).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 50).isActive = true
                } else {
                    list_of_dots[counter].topAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: 25).isActive = true
                    list_of_dots[counter].leadingAnchor.constraint(equalTo: entire_Braille.leadingAnchor, constant: 25).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 50).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 50).isActive = true
                }
            }
            counter += 1
        }
    }
    
    func brailleMaker2() {
        number_one = "⁃⁃⁃⁃⁃⁃"
        number_two = "⁃⁃⁃⁃⁃⁃"
        
        let entire_Braille: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor.white
            return view
        }()
        
        let dot_V1: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 1 + 6
            dot.addTarget(self, action: #selector(button_select2), for: .touchUpInside)
            return dot
        }()
        let dot_V2: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 2 + 6
            dot.addTarget(self, action: #selector(button_select2), for: .touchUpInside)
            return dot
        }()
        let dot_V3: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 3 + 6
            dot.addTarget(self, action: #selector(button_select2), for: .touchUpInside)
            return dot
        }()
        let dot_V4: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 4 + 6
            dot.addTarget(self, action: #selector(button_select2), for: .touchUpInside)
            return dot
        }()
        let dot_V5: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 5 + 6
            dot.addTarget(self, action: #selector(button_select2), for: .touchUpInside)
            return dot
        }()
        let dot_V6: UIButton = {
            let dot = UIButton()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 25 //change
            dot.backgroundColor = UIColor.dimmedWhite
            dot.layer.borderWidth = 2
            dot.layer.borderColor = UIColor.gray.cgColor
            dot.tag = 6 + 6
            dot.addTarget(self, action: #selector(button_select2), for: .touchUpInside)
            return dot
        }()

        let textLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.textColor = .black
            return label
        }()

        let characterLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.textColor = .black
            return label
        }()

//        let page_number: UILabel = {
//            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
//            label.textAlignment = .center
//            label.textColor = .mintBlue
//            return label
//        }()

        var finalBox: BrailleCode! {
            didSet {
                let colour_list_of_dots = [dot_V1, dot_V2, dot_V3, dot_V4, dot_V5, dot_V6]
                let braille_value = finalBox.value
                textLabel.text = braille_value
    //            characterLabel.text = finalBox.character
                var braille_point_counter = 0

                for letter in braille_value {
                    if letter == "⁃" {
                        colour_list_of_dots[braille_point_counter].backgroundColor = UIColor.dimmedWhite
                    } else {
                        colour_list_of_dots[braille_point_counter].backgroundColor = UIColor.black
                    }

                    braille_point_counter += 1
                }
            }
        }
        finalBox = choosenBrailleValue
//        LetterLabel.isHidden = true

    //    addSubview(textLabel)
    //    addSubview(page_number)
        cardEnterView2.addSubview(characterLabel)
        cardEnterView2.addSubview(entire_Braille)

        characterLabel.centerXAnchor.constraint(equalTo: cardEnterView2.centerXAnchor).isActive = true
        characterLabel.bottomAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: 4).isActive = true
        characterLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        characterLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

        entire_Braille.centerXAnchor.constraint(equalTo: cardEnterView2.centerXAnchor).isActive = true
        entire_Braille.centerYAnchor.constraint(equalTo: cardEnterView2.centerYAnchor).isActive = true
        entire_Braille.heightAnchor.constraint(equalToConstant: (250)).isActive = true
        entire_Braille.widthAnchor.constraint(equalToConstant: 200).isActive = true

        var counter = 0
        let list_of_dots = [dot_V1, dot_V2, dot_V3, dot_V4, dot_V5, dot_V6]

        while counter < 6 {
            entire_Braille.addSubview(list_of_dots[counter])

            var value: Int
            if counter >= 4 {
                value = 3
            } else {
                value = 1
            }

            if counter >= 2 {
                if counter % 2 != 0 {
                    list_of_dots[counter].topAnchor.constraint(equalTo: list_of_dots[value].topAnchor, constant: 75).isActive = true
                    list_of_dots[counter].trailingAnchor.constraint(equalTo: entire_Braille.trailingAnchor, constant: -25).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 50).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 50).isActive = true
                } else {
                    list_of_dots[counter].topAnchor.constraint(equalTo: list_of_dots[value].topAnchor, constant: 75).isActive = true
                    list_of_dots[counter].leadingAnchor.constraint(equalTo: entire_Braille.leadingAnchor, constant: 25).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 50).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 50).isActive = true
                }
            } else {
                if counter % 2 != 0 {
                    list_of_dots[counter].topAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: 25).isActive = true
                    list_of_dots[counter].trailingAnchor.constraint(equalTo: entire_Braille.trailingAnchor, constant: -25).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 50).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 50).isActive = true
                } else {
                    list_of_dots[counter].topAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: 25).isActive = true
                    list_of_dots[counter].leadingAnchor.constraint(equalTo: entire_Braille.leadingAnchor, constant: 25).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 50).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 50).isActive = true
                }
            }
            counter += 1
        }

//        textLabel.centerXAnchor.constraint(equalTo: entire_Braille.centerXAnchor).isActive = true
//        textLabel.topAnchor.constraint(equalTo: entire_Braille.bottomAnchor, constant: 1).isActive = true
//        textLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
//        textLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
    //
    //    page_number.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    //    page_number.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 1).isActive = true
    //    page_number.heightAnchor.constraint(equalToConstant: 6).isActive = true
    //    page_number.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    struct equationCheck {
        let equation: String
        let answer: Int
        let answerLength: Int
    }
    
    var currentEquation = equationCheck(equation: "", answer: 0, answerLength: 0)
    func generate_equation() {
        var number1 = Int.random(in: 0 ..< 10)
        var number2 = Int.random(in: 0 ..< 10)
        var mid_num_transfer = 0
        if number1 < number2 {
            mid_num_transfer = number1
            number1 = number2
            number2 = mid_num_transfer
        }
        
        let equationSymbol = verified_equation_symbols.randomElement()!
        
        var answer = 0
        if equationSymbol == "x" {
            answer = number1 * number2
        } else if equationSymbol == "+" {
            answer = number1 + number2
        } else {
            answer = number1 - number2
        }
        currentEquation = equationCheck(equation: "\(number1) \(equationSymbol) \(number2)", answer: answer, answerLength: Int(String(answer).count))
        
        //layout constraints
        if currentEquation.answerLength == 2 {
            cardEnterView.frame = CGRect(x: 65, y: 250, width: 200, height: 300)
            cardEnterView2.frame = CGRect(x: 335, y: 250, width: 200, height: 300)
            cardEnterView2.isHidden = false
        } else {
            cardEnterView.frame = CGRect(x: 200, y: 250, width: 200, height: 300)
            cardEnterView2.isHidden = true
        }
    }
    
    let backdropView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 700))
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        number_one = "⁃⁃⁃⁃⁃⁃"
        number_two = "⁃⁃⁃⁃⁃⁃"
        
        Med_Score = 0
        QuestionNumber = 1
        choosenBrailleValue = BrailleCode(character: "", value: "", num_position: 0)
        
        backdropView.backgroundColor = .white
        view.addSubview(backdropView)
        
        backdropView.addSubview(cardEnterView)
        brailleMaker()
        backdropView.addSubview(cardEnterView2)
        brailleMaker2()
        
        backdropView.addSubview(in_correct_Label)
        in_correct_Label.alpha = 0
        
        backdropView.addSubview(QuestionLabel)
        QuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        QuestionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        QuestionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        QuestionLabel.widthAnchor.constraint(equalToConstant: 540).isActive = true
        
        backdropView.addSubview(EquationLabel)
        EquationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        EquationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        EquationLabel.heightAnchor.constraint(equalToConstant: 120).isActive = true
        EquationLabel.widthAnchor.constraint(equalToConstant: 600).isActive = true
        
        generate_equation()
        EquationLabel.text = currentEquation.equation
        
        backdropView.addSubview(QuestionNumberText)
        
        let exitbutton = UIButton.init(type: .system)
        exitbutton.frame = CGRect(x: 600 - 60, y: 15, width: 20, height: 20)
        exitbutton.setImage(UIImage(named: "exitButton.png")!, for: .normal)
        exitbutton.tintColor = UIColor.WWDC_Green
        exitbutton.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        backdropView.addSubview(exitbutton)
        
        let nextButton = UIButton.init(type: .system)
        nextButton.frame = CGRect(x: 275 , y: 600, width: 50, height: 50)
        nextButton.setImage(UIImage(named: "arrow_right_icon.png")!, for: .normal)
        nextButton.tintColor = UIColor.white
        nextButton.backgroundColor = .WWDC_Green
        nextButton.layer.cornerRadius = 25
        nextButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        nextButton.addTarget(self, action: #selector(answerCheck), for: .touchUpInside)
        backdropView.addSubview(nextButton)
    }
    
    var in_correct_Label: UILabel = {
        let label = UILabel(frame: CGRect(x: 300 - (120 / 2), y: 560, width: 120, height: 30))
        label.text = "Correct"
        label.textAlignment = .center
        label.font = label.font.withSize(15)
        label.textColor = UIColor.white
        label.numberOfLines = 2
        label.layer.shadowOpacity = 0.1
        label.layer.shadowRadius = 2
        label.layer.shadowOffset = CGSize(width: 0, height: 5)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.backgroundColor = UIColor.WWDC_Green
        return label
    }()
    
    @objc func answerCheck(_ : UIButton) {
        var numBrailleAnswer1 = ""
        var num1Correct = false
        var numBrailleAnswer2 = ""
        var num2Correct = false
        
        var answerCorrect = false
        
        let numArrayAnswer = Array(String(currentEquation.answer))
        if currentEquation.answerLength == 2 {
            for letter in number_braille_data {
                if String(letter.character) == String(numArrayAnswer[0]) {
                    numBrailleAnswer1 = letter.value
                } else if String(letter.character) == String(numArrayAnswer[1]) {
                    numBrailleAnswer2 = letter.value
                }
            }
            
            if number_one == numBrailleAnswer1 {
                num1Correct = true
            }; if number_two == numBrailleAnswer2 {
                num2Correct = true
            }; if num1Correct == true && num2Correct == true {
                answerCorrect = true
            }
        } else {
            for letter in number_braille_data {
                if String(letter.character) == String(numArrayAnswer[0]) {
                    numBrailleAnswer1 = letter.value
                }
            }
            
            if number_one == numBrailleAnswer1 {
                num1Correct = true
            }; if num1Correct == true {
                answerCorrect = true
            }
        }
        
        print("CHECK-1: \(number_one)")
        print("CHECK-1: \(numBrailleAnswer1)")
        print("CHECK-2: \(number_two)")
        print("CHECK-2: \(numBrailleAnswer2)")
        
        generate_equation()
        EquationLabel.text = currentEquation.equation
        
        number_one = "⁃⁃⁃⁃⁃⁃"
        number_two = "⁃⁃⁃⁃⁃⁃"
        QuestionNumber += 1
        
        if answerCorrect == true {
            Med_Score += 1
            
            in_correct_Label.backgroundColor = .WWDC_Green
            in_correct_Label.text = "Correct"
            in_correct_Label.alpha = 1.0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                    self.in_correct_Label.alpha = 0.0
                    if QuestionNumber != 6 {
                        //Fade In
                        self.QuestionNumberText.text = "Question: \(QuestionNumber) / 5"
                        self.EquationLabel.isHidden = false
                        
                        for subview in self.cardEnterView.subviews{
                            if subview.isKind(of: UIView.self) {
                                for button in subview.subviews{
                                    if button is UIButton {
                                        button.backgroundColor = .dimmedWhite
                                    }
                                }
                            }
                        }
                        for subview in self.cardEnterView2.subviews{
                            if subview.isKind(of: UIView.self) {
                                for button in subview.subviews{
                                    if button is UIButton {
                                        button.backgroundColor = .dimmedWhite
                                    }
                                }
                            }
                        }
                    } else {
                        self.EquationLabel.alpha = 0
                        self.cardEnterView.alpha = 0
                        self.cardEnterView2.alpha = 0
                    }
                }, completion: nil)
            }
        } else {
            in_correct_Label.backgroundColor = .WWDC_Peach
            in_correct_Label.text = "Incorrect"
            in_correct_Label.alpha = 1.0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                    self.in_correct_Label.alpha = 0.0
                    if QuestionNumber != 6 {
                        //Fade In
                        self.QuestionNumberText.text = "Question: \(QuestionNumber) / 5"
                        self.EquationLabel.isHidden = false
                        
                        for subview in self.cardEnterView.subviews{
                            if subview.isKind(of: UIView.self) {
                                for button in subview.subviews{
                                    if button is UIButton {
                                        button.backgroundColor = .dimmedWhite
                                    }
                                }
                            }
                        }
                        for subview in self.cardEnterView2.subviews{
                            if subview.isKind(of: UIView.self) {
                                for button in subview.subviews{
                                    if button is UIButton {
                                        button.backgroundColor = .dimmedWhite
                                    }
                                }
                            }
                        }
                    } else {
                        self.EquationLabel.alpha = 0
                        self.cardEnterView.alpha = 0
                        self.cardEnterView2.alpha = 0
                    }
                }, completion: nil)
            }
        }
        
        if QuestionNumber == 6 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                let backdropView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 700))
                backdropView.backgroundColor = UIColor.white.withAlphaComponent(0.0)
                self.view.addSubview(backdropView)
                
                let exitBackdrop = UIButton.init(type: .system)
                exitBackdrop.frame = CGRect(x: 0, y: 0, width: 600, height: 700)
                exitBackdrop.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
                exitBackdrop.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                    backdropView.addSubview(exitBackdrop)
                
                let foreground = UIView(frame: CGRect(x: 300 / 2, y: (750 / 2) - (300 / 2), width: 300, height: 300))
                foreground.backgroundColor = .white
                foreground.layer.cornerRadius = 25
                backdropView.addSubview(foreground)
                
                let QuestionNumberText = UILabel(frame: CGRect(x: 0, y: 25, width: 300, height: 30))
                if Med_Score < 2 {
                    QuestionNumberText.text = "Bad Luck"
                } else if Med_Score <= 3 {
                    QuestionNumberText.text = "Keep Practising!"
                } else {
                    QuestionNumberText.text = "Well Done!"
                }
                QuestionNumberText.textAlignment = .center
                QuestionNumberText.font = QuestionNumberText.font.withSize(25)
                QuestionNumberText.textColor = UIColor.lightGray
                foreground.addSubview(QuestionNumberText)
                
                let resultText = UILabel(frame: CGRect(x: 0, y: 80, width: 300, height: 60))
                resultText.text = "\(Med_Score) out of 5"
                resultText.textAlignment = .center
                resultText.font = resultText.font.withSize(50)
                resultText.textColor = UIColor.WWDC_Green
                foreground.addSubview(resultText)
                
                let helpText = UILabel(frame: CGRect(x: 20, y: 150, width: 260, height: 60))
                helpText.text = "If you need help memorising the Braille numeracy characters, make sure to check out the Flashcards on the Homepage. "
                helpText.textAlignment = .center
                helpText.numberOfLines = 3
                helpText.font = helpText.font.withSize(12)
                helpText.textColor = UIColor.lightGray
                foreground.addSubview(helpText)
                
                let go_to_easy_level = UIButton.init(type: .system)
                go_to_easy_level.frame = CGRect(x: 50, y: 220, width: 200, height: 50)
                go_to_easy_level.setTitle("Return to Home", for: .normal)
                go_to_easy_level.layer.borderWidth = 5.0
                go_to_easy_level.layer.borderColor = UIColor.white.cgColor
                go_to_easy_level.backgroundColor = UIColor.WWDC_Green
                go_to_easy_level.tintColor = UIColor.white
                go_to_easy_level.layer.cornerRadius = 15.0
                go_to_easy_level.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                foreground.addSubview(go_to_easy_level)
                
                let exitbutton = UIButton.init(type: .system)
                exitbutton.frame = CGRect(x: 250, y: 30, width: 20, height: 20)
                exitbutton.setImage(UIImage(named: "exitButton.png")!, for: .normal)
                exitbutton.tintColor = UIColor.WWDC_Green
                exitbutton.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                foreground.addSubview(exitbutton)
            }
        }
    }
    
    @objc func buttonClicked(_ : UIButton) {
        print("Moved to Main View Controller...")
        dismiss(animated: true)
    }
}
