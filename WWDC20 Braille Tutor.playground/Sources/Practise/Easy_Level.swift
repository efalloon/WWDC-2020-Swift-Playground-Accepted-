import UIKit
import Foundation

var QuestionNumber = 1
var Easy_Score = 0

public class EasyLevelViewController: UIViewController {
    
    let GridCardsCellcellId = "GridCardsCellcellId"
    
    let entire_Braille: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()

    let newCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.backgroundColor = UIColor.dimmedWhite
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        return collection
    }()
    
    let QuestionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.lightGray
        let labelFont = UIFont(name: "HelveticaNeue-Bold", size: 18)
        let attributes :Dictionary = [NSAttributedString.Key.font : labelFont]
        // Create attributed string
        let attrString = NSAttributedString(string: "What is the corresponding Braille Charcater for the follwoing letter? Hold and drag a Braille character over to the area marked below, and relese it. ", attributes:attributes as [NSAttributedString.Key : Any])
        label.attributedText = attrString
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        return label
    }()
    
    let LetterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "A"
        label.lineBreakMode = .byWordWrapping
        label.font = label.font.withSize(100)
        label.textColor = UIColor.WWDC_Green
        label.layer.shadowOpacity = 0.2
        label.layer.shadowRadius = 2
        label.layer.shadowOffset = CGSize(width: 0, height: 4)
        return label
    }()
    
    let in_correct_Label: UILabel = {
        let label = UILabel(frame: CGRect(x: 300 - (120 / 2), y: 370, width: 120, height: 30))
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
    
    let QuestionNumberText: UILabel = {
        let label = UILabel(frame: CGRect(x: 40, y: 15, width: 300, height: 20))
        label.text = "Question: 1 / 5"
        label.font = label.font.withSize(10)
        label.textColor = UIColor.lightGray
        label.layer.shadowOpacity = 0.2
        label.layer.shadowRadius = 2
        label.layer.shadowOffset = CGSize(width: 0, height: 4)
        return label
    }()
    
    let cardEnterView: UIView = {
        let cardView = UIView(frame: CGRect(x: 300 - (165 / 2), y: 120, width: 165, height: 240))
        cardView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        var yourViewBorder = CAShapeLayer()
        yourViewBorder.strokeColor = UIColor.WWDC_Green.cgColor
        yourViewBorder.lineDashPattern = [2, 2]
        yourViewBorder.frame = cardView.bounds
        yourViewBorder.fillColor = nil
        yourViewBorder.path = UIBezierPath(rect: cardView.bounds).cgPath
        cardView.layer.addSublayer(yourViewBorder)
//        cardView.layer.cornerRadius = 25
        
        cardView.layer.shadowRadius = 10
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
        return cardView
    }()
    
    func pickRandomCharacter() -> String{
        randomBrailleCharacter = character_braille_data.randomElement()!
        return randomBrailleCharacter.character
    }
    
    let backdropView = UIView(frame: CGRect(x: 0, y: 0, width: 600, height: 700))
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        QuestionNumber = 1
        Easy_Score = 0
        
        backdropView.backgroundColor = .white
        view.addSubview(backdropView)
        
        randomised_Braille_Data = character_braille_data.shuffle_Braille()
        
        backdropView.addSubview(QuestionLabel)
        backdropView.addSubview(cardEnterView)
        cardEnterView.addSubview(LetterLabel)
        
        LetterLabel.text = pickRandomCharacter().uppercased()
        if LetterLabel.text == "SPACE" {
            LetterLabel.font = LetterLabel.font.withSize(30)
        } else {
            LetterLabel.font = LetterLabel.font.withSize(100)
        }
        
        newCollection.showsHorizontalScrollIndicator = false

        newCollection.delegate = self
        newCollection.dataSource = self
        newCollection.register(GridCardsCell.self, forCellWithReuseIdentifier: GridCardsCellcellId)
        backdropView.addSubview(newCollection)
        newCollection.backgroundColor = UIColor.white
        
        newCollection.dragDelegate = self
//        newCollection.dropDelegate = self
        newCollection.dragInteractionEnabled = true
        
        // Enable dropping onto the image view (see ViewController+Drop.swift).
        let dropInteraction = UIDropInteraction(delegate: self)
        backdropView.addInteraction(dropInteraction)
        
        setupCollection()
        
        backdropView.addSubview(QuestionNumberText)
        
        backdropView.addSubview(in_correct_Label)
        in_correct_Label.isHidden = true
        
        let exitbutton = UIButton.init(type: .system)
        exitbutton.frame = CGRect(x: 600 - 60, y: 15, width: 20, height: 20)
        exitbutton.setImage(UIImage(named: "exitButton.png")!, for: .normal)
        exitbutton.tintColor = UIColor.WWDC_Green
        exitbutton.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        backdropView.addSubview(exitbutton)
    }
    
    @objc func buttonClicked(_ : UIButton) {
        print("Moved to Main View Controller...")
        dismiss(animated: true)
    }
    
    public func setupCollection(){
        QuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        QuestionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        QuestionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        QuestionLabel.widthAnchor.constraint(equalToConstant: 540).isActive = true
        
        LetterLabel.centerXAnchor.constraint(equalTo: cardEnterView.centerXAnchor).isActive = true
//        LetterLabel.topAnchor.constraint(equalTo: QuestionLabel.bottomAnchor, constant: 20).isActive = true
        LetterLabel.centerYAnchor.constraint(equalTo: cardEnterView.centerYAnchor).isActive = true
        LetterLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        LetterLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
//        newCollection.bottomYAnchor.constraint(equalTo: view.bottomYAnchor).isActive = true
        newCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        newCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        newCollection.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        newCollection.heightAnchor.constraint(equalToConstant: 280).isActive = true
        newCollection.widthAnchor.constraint(equalToConstant: 600).isActive = true
    }
}

extension EasyLevelViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomised_Braille_Data.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newCollection.dequeueReusableCell(withReuseIdentifier: GridCardsCellcellId, for: indexPath) as! GridCardsCell
        cell.backgroundColor  = .white
        cell.layer.cornerRadius = 5
        cell.layer.shadowOpacity = 3
        
        // Define attributes
        let labelFont = UIFont(name: "HelveticaNeue-Bold", size: 8)
        var attributes :Dictionary = [NSAttributedString.Key.font : labelFont]
        // Create attributed string
        var attrString = NSAttributedString(string: "\(randomised_Braille_Data[indexPath.row].character)".uppercased(), attributes:attributes as [NSAttributedString.Key : Any])
        cell.characterLabel.attributedText = attrString

        // Define attributes
//        labelFont = UIFont(name: "HelveticaNeue-Bold", size: 3)

        attributes = [NSAttributedString.Key.font : labelFont]
        // Create attributed string
        attrString = NSAttributedString(string: "\(randomised_Braille_Data[indexPath.row].num_position)/\(randomised_Braille_Data.count)".uppercased(), attributes:attributes as [NSAttributedString.Key : Any])
        cell.page_number.attributedText = attrString
        cell.page_number.isHidden = true
        cell.textLabel.isHidden = true
        cell.characterLabel.isHidden = true

        let braille_dots = randomised_Braille_Data[indexPath.row]
        cell.finalBox = braille_dots
        
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 82.5, height: 120) //CGSize(width: 275, height: 400)
    }


    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

//MARK: -customise the cell look
public class GridCardsCell: UICollectionViewCell {

    override public init(frame: CGRect) {
        super.init(frame: frame)
            setupView()
    }

    let entire_Braille: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()

    let dot_V1: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 7.5 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 1
        dot.layer.borderColor = UIColor.gray.cgColor
        return dot
    }()
    let dot_V2: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 7.5 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 1
        dot.layer.borderColor = UIColor.gray.cgColor
        return dot
    }()
    let dot_V3: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 7.5 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 1
        dot.layer.borderColor = UIColor.gray.cgColor
        return dot
    }()
    let dot_V4: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 7.5 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 1
        dot.layer.borderColor = UIColor.gray.cgColor
        return dot
    }()
    let dot_V5: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 7.5 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 1
        dot.layer.borderColor = UIColor.gray.cgColor
        return dot
    }()
    let dot_V6: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 7.5 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 1
        dot.layer.borderColor = UIColor.gray.cgColor
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

    let page_number: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .mintBlue
        return label
    }()

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

    public func setupView(){
//        addSubview(imageView)
        addSubview(textLabel)
        addSubview(page_number)
        addSubview(characterLabel)
        addSubview(entire_Braille)

        characterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        characterLabel.bottomAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: 2).isActive = true
        characterLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        characterLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true

        entire_Braille.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        entire_Braille.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        entire_Braille.heightAnchor.constraint(equalToConstant: (75)).isActive = true
        entire_Braille.widthAnchor.constraint(equalToConstant: 60).isActive = true

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
                    list_of_dots[counter].topAnchor.constraint(equalTo: list_of_dots[value].topAnchor, constant: 22.5).isActive = true
                    list_of_dots[counter].trailingAnchor.constraint(equalTo: entire_Braille.trailingAnchor, constant: -7.5).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 15).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 15).isActive = true
                } else {
                    list_of_dots[counter].topAnchor.constraint(equalTo: list_of_dots[value].topAnchor, constant: 22.5).isActive = true
                    list_of_dots[counter].leadingAnchor.constraint(equalTo: entire_Braille.leadingAnchor, constant: 7.5).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 15).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 15).isActive = true
                }
            } else {
                if counter % 2 != 0 {
                    list_of_dots[counter].topAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: 7.5).isActive = true
                    list_of_dots[counter].trailingAnchor.constraint(equalTo: entire_Braille.trailingAnchor, constant: -7.5).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 15).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 15).isActive = true
                } else {
                    list_of_dots[counter].topAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: 7.5).isActive = true
                    list_of_dots[counter].leadingAnchor.constraint(equalTo: entire_Braille.leadingAnchor, constant: 7.5).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 15).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 15).isActive = true
                }
            }
            counter += 1
        }

        textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: entire_Braille.bottomAnchor, constant: 1).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true

        page_number.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        page_number.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 1).isActive = true
        page_number.heightAnchor.constraint(equalToConstant: 6).isActive = true
        page_number.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EasyLevelViewController: UICollectionViewDragDelegate, UIDropInteractionDelegate {
    
    func brailleMaker() {

        let dot_V1: UIView = {
            let dot = UIView()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 15 //change
            dot.backgroundColor = UIColor.black
            dot.layer.borderWidth = 1
            dot.layer.borderColor = UIColor.gray.cgColor
            return dot
        }()
        let dot_V2: UIView = {
            let dot = UIView()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 15 //change
            dot.backgroundColor = UIColor.black
            dot.layer.borderWidth = 1
            dot.layer.borderColor = UIColor.gray.cgColor
            return dot
        }()
        let dot_V3: UIView = {
            let dot = UIView()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 15 //change
            dot.backgroundColor = UIColor.black
            dot.layer.borderWidth = 1
            dot.layer.borderColor = UIColor.gray.cgColor
            return dot
        }()
        let dot_V4: UIView = {
            let dot = UIView()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 15 //change
            dot.backgroundColor = UIColor.black
            dot.layer.borderWidth = 1
            dot.layer.borderColor = UIColor.gray.cgColor
            return dot
        }()
        let dot_V5: UIView = {
            let dot = UIView()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 15 //change
            dot.backgroundColor = UIColor.black
            dot.layer.borderWidth = 1
            dot.layer.borderColor = UIColor.gray.cgColor
            return dot
        }()
        let dot_V6: UIView = {
            let dot = UIView()
            dot.translatesAutoresizingMaskIntoConstraints = false
            dot.layer.cornerRadius = 15 //change
            dot.backgroundColor = UIColor.black
            dot.layer.borderWidth = 1
            dot.layer.borderColor = UIColor.gray.cgColor
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
        LetterLabel.isHidden = true

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
        entire_Braille.heightAnchor.constraint(equalToConstant: (150)).isActive = true
        entire_Braille.widthAnchor.constraint(equalToConstant: 120).isActive = true

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
                    list_of_dots[counter].topAnchor.constraint(equalTo: list_of_dots[value].topAnchor, constant: 45).isActive = true
                    list_of_dots[counter].trailingAnchor.constraint(equalTo: entire_Braille.trailingAnchor, constant: -15).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 30).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 30).isActive = true
                } else {
                    list_of_dots[counter].topAnchor.constraint(equalTo: list_of_dots[value].topAnchor, constant: 45).isActive = true
                    list_of_dots[counter].leadingAnchor.constraint(equalTo: entire_Braille.leadingAnchor, constant: 15).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 30).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 30).isActive = true
                }
            } else {
                if counter % 2 != 0 {
                    list_of_dots[counter].topAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: 15).isActive = true
                    list_of_dots[counter].trailingAnchor.constraint(equalTo: entire_Braille.trailingAnchor, constant: -15).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 30).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 30).isActive = true
                } else {
                    list_of_dots[counter].topAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: 15).isActive = true
                    list_of_dots[counter].leadingAnchor.constraint(equalTo: entire_Braille.leadingAnchor, constant: 15).isActive = true
                    list_of_dots[counter].heightAnchor.constraint(equalToConstant: 30).isActive = true
                    list_of_dots[counter].widthAnchor.constraint(equalToConstant: 30).isActive = true
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
    
    public func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        let dropLocation = session.location(in: view)
        updateLayersForHover(forDropLocation: dropLocation)

        let operation: UIDropOperation

        if cardEnterView.frame.contains(dropLocation) {
            operation = session.localDragSession == nil ? .copy : .move
        } else {
            operation = .cancel
        }

        return UIDropProposal(operation: operation)
    }
    
    // Update UI, as needed, when touch point of drag session enters view.
    public func dropInteraction(_ interaction: UIDropInteraction, sessionDidEnd session: UIDropSession) {
        let dropLocation = session.location(in: view)
        updateLayers(forDropLocation: dropLocation)
    }
    
    func updateLayersForHover(forDropLocation dropLocation: CGPoint) {
        if cardEnterView.frame.contains(dropLocation) {
            view.layer.borderWidth = 0.0
            cardEnterView.layer.borderWidth = 2.0
            cardEnterView.layer.borderColor = UIColor.mintBlue.cgColor
        } else if view.frame.contains(dropLocation) {
            view.layer.borderWidth = 2.0
            view.layer.borderColor = UIColor.mintBlue.cgColor
            cardEnterView.layer.borderWidth = 0.0
        } else {
            view.layer.borderWidth = 0.0
            cardEnterView.layer.borderWidth = 0.0
        }
    }
    
    func updateLayers(forDropLocation dropLocation: CGPoint) {
        if cardEnterView.frame.contains(dropLocation) {
            view.layer.borderWidth = 0.0
            cardEnterView.layer.borderWidth = 0.0
            if choosenBrailleValue.character == randomBrailleCharacter.character {
                print("Correct")
                Easy_Score += 1
                
                QuestionNumber += 1
                QuestionNumberText.text = "Question: \(QuestionNumber) / 5"
                
                brailleMaker()
                entire_Braille.alpha = 1.0
                in_correct_Label.alpha = 1.0
                in_correct_Label.backgroundColor = UIColor.WWDC_Green
                in_correct_Label.text = "Correct"
                in_correct_Label.isHidden = false
                
                LetterLabel.text = pickRandomCharacter().uppercased()
                if LetterLabel.text == "SPACE" {
                    LetterLabel.font = LetterLabel.font.withSize(30)
                } else {
                    LetterLabel.font = LetterLabel.font.withSize(100)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                        //Fade Out
                        self.entire_Braille.alpha = 0.0
                        self.in_correct_Label.alpha = 0.0
                        if QuestionNumber != 6 {
                            //Fade In
                            self.LetterLabel.isHidden = false
                            self.QuestionNumberText.text = "Question: \(QuestionNumber) / 5"
                        }
                        
                    }, completion: nil)
                }
            } else {
                print("Incorrect")
                
                brailleMaker()
                entire_Braille.alpha = 1.0
                in_correct_Label.alpha = 1.0
                in_correct_Label.backgroundColor = UIColor.WWDC_Peach
                in_correct_Label.text = "Incorrect"
                in_correct_Label.isHidden = false
                
                QuestionNumber += 1
                
                LetterLabel.text = pickRandomCharacter().uppercased()
                if LetterLabel.text == "SPACE" {
                    LetterLabel.font = LetterLabel.font.withSize(30)
                } else {
                    LetterLabel.font = LetterLabel.font.withSize(100)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
                        //Fade Out
                        self.entire_Braille.alpha = 0.0
                        self.in_correct_Label.alpha = 0.0
                        if QuestionNumber != 6 {
                            //Fade In
                            self.LetterLabel.isHidden = false
                            self.QuestionNumberText.text = "Question: \(QuestionNumber) / 5"
                        }
                        
                    }, completion: nil)
                }
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
                exitBackdrop.addTarget(self, action: #selector(self.exit), for: .touchUpInside)
                backdropView.addSubview(exitBackdrop)
                
                let foreground = UIView(frame: CGRect(x: 300 / 2, y: (750 / 2) - (300 / 2), width: 300, height: 300))
                foreground.backgroundColor = .white
                foreground.layer.cornerRadius = 25
                backdropView.addSubview(foreground)
                
                let QuestionNumberText = UILabel(frame: CGRect(x: 0, y: 25, width: 300, height: 30))
                if Easy_Score < 2 {
                    QuestionNumberText.text = "Bad Luck"
                } else if Easy_Score <= 3 {
                    QuestionNumberText.text = "Keep Practising!"
                } else {
                    QuestionNumberText.text = "Well Done!"
                }
                QuestionNumberText.textAlignment = .center
                QuestionNumberText.font = QuestionNumberText.font.withSize(25)
                QuestionNumberText.textColor = UIColor.lightGray
                foreground.addSubview(QuestionNumberText)
                
                let resultText = UILabel(frame: CGRect(x: 0, y: 80, width: 300, height: 60))
                resultText.text = "\(Easy_Score) out of 5"
                resultText.textAlignment = .center
                resultText.font = resultText.font.withSize(50)
                resultText.textColor = UIColor.WWDC_Green
                foreground.addSubview(resultText)
                
                let helpText = UILabel(frame: CGRect(x: 20, y: 150, width: 260, height: 60))
                helpText.text = "If you need help memorising the Braille literary characters, make sure to check out the Flashcards on the Homepage. "
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
                go_to_easy_level.addTarget(self, action: #selector(self.exit), for: .touchUpInside)
                foreground.addSubview(go_to_easy_level)
                
                let exitbutton = UIButton.init(type: .system)
                exitbutton.frame = CGRect(x: 250, y: 30, width: 20, height: 20)
                exitbutton.setImage(UIImage(named: "exitButton.png")!, for: .normal)
                exitbutton.tintColor = UIColor.WWDC_Green
                exitbutton.addTarget(self, action: #selector(self.exit), for: .touchUpInside)
                foreground.addSubview(exitbutton)
            }
        }
    }
    
    @objc func exit(_ : UIButton) {
        dismiss(animated: true)
    }
    
    public func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let item = UIDragItem(itemProvider: NSItemProvider())
//        item.localObject = dataSource.itemIdentifier(for: indexPath)
        choosenBrailleValue = randomised_Braille_Data[indexPath.row]
        return [item]
    }

    public func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        true
    }

    public func collectionView(_ collectionView: UICollectionView, dragSessionAllowsMoveOperation session: UIDragSession) -> Bool {
        true
    }

    public func collectionView(_ collectionView: UICollectionView, dragSessionIsRestrictedToDraggingApplication session: UIDragSession) -> Bool {
        true
    }
}
