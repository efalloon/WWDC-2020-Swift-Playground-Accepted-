import UIKit
import PlaygroundSupport

//public func createImageArray(total: Int, imagePrefix: String) -> [UIImage] {
//
//    var imageArray: [UIImage] = []
//
//    for imageCount in 0..<total {
//        let imageName = "swipe_frames/\(imagePrefix)-\(imageCount).png"
//        var image = UIImage(named: imageName)!.withRenderingMode(.alwaysTemplate)
//        image = image.imageWithColor(UIColor.WWDC_Peach)!
//
//        imageArray.append(image)
//    }
//    return imageArray
//}
//public func animate(imageView: UIImageView, images: [UIImage]) {
//    imageView.animationImages = images
//    imageView.animationDuration = 2.0
//    imageView.animationRepeatCount = 999
//    imageView.startAnimating()
//}

//get list of alphabet characters
let aScalars = "a".unicodeScalars
let aCode = aScalars[aScalars.startIndex].value

let characters: [Character] = (0..<26).map {
    i in Character(UnicodeScalar(aCode + i)!)
}
//print(characters)

public class QueCardViewController: UIViewController {

    let cellId = "cellId"

    let newCollection: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.backgroundColor = UIColor.dimmedWhite
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        return collection
    }()

    let name_of_view: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .WWDC_Green
        label.text = "Flashcards"
        return label
    }()
    
    let swipeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .WWDC_Green
        label.text = "Swipe on the card above to change Braille Symbol."
        label.font = label.font.withSize(15)
        label.numberOfLines = 3
        return label
    }()

    let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
//        image.clipsToBounds = true
//        image.layer.cornerRadius = 50
//        image.backgroundColor = UIColor.gray
        return image
    }()

    override public func viewDidLoad() {
        super.viewDidLoad()
        //set page numbers automatically
        for index in 0..<braille_data.count {
            braille_data[index].num_position = index + 1
        }

        //background colour
        view.backgroundColor = UIColor.dimmedWhite
        view.addSubview(name_of_view)
        view.addSubview(imageView)
        view.addSubview(swipeLabel)
        
//        var images_swipe: [UIImage] = []
//        images_swipe = createImageArray(total: 46, imagePrefix: "frame")
//        animate(imageView: imageView, images: images_swipe)

        //collection view
        newCollection.decelerationRate = UIScrollView.DecelerationRate.fast
        newCollection.isPagingEnabled = true
        newCollection.showsHorizontalScrollIndicator = false

        newCollection.delegate = self
        newCollection.dataSource = self
        newCollection.register(CustomeCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(newCollection)
        
        setupCollection()
        
        let exitbutton = UIButton.init(type: .system)
        exitbutton.frame = CGRect(x: 600 - 35, y: 15, width: 20, height: 20)
        exitbutton.setImage(UIImage(named: "exitButton.png")!, for: .normal)
        exitbutton.tintColor = UIColor.WWDC_Green
        exitbutton.addTarget(self, action: #selector(buttonClicked(_ :)), for: .touchUpInside)
        view.addSubview(exitbutton)
        
        self.view = view
    }
    
    @objc func buttonClicked(_ : UIButton) {
        print("Moved to Main View Controller...")
        dismiss(animated: true)
    }

    public func setupCollection(){
        name_of_view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        name_of_view.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        name_of_view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        name_of_view.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        
        swipeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        swipeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45).isActive = true
        swipeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        swipeLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true

        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true

        // Define attributes
        let labelFont = UIFont(name: "HelveticaNeue-Bold", size: 45)
        let attributes :Dictionary = [NSAttributedString.Key.font : labelFont]
        // Create attributed string
        let attrString = NSAttributedString(string: "Flashcards", attributes:attributes as [NSAttributedString.Key : Any])
        name_of_view.attributedText = attrString

        newCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newCollection.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        newCollection.heightAnchor.constraint(equalToConstant: view.frame.height - 200).isActive = true
        newCollection.widthAnchor.constraint(equalToConstant: (view.frame.width)).isActive = true
    }
}

extension QueCardViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return braille_data.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newCollection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomeCell
        cell.backgroundColor  = .white
        cell.layer.cornerRadius = 10
        cell.layer.shadowOpacity = 3

//        cell.imageView.image = UIImage(named: "b")//"\(letters[indexPath.row])")
//        cell.textLabel.text = "\(characters[indexPath.row])".uppercased()

        // Define attributes
        var labelFont = UIFont(name: "HelveticaNeue-Bold", size: 18)
        var attributes :Dictionary = [NSAttributedString.Key.font : labelFont]
        // Create attributed string
        var attrString = NSAttributedString(string: "\(braille_data[indexPath.row].character)".uppercased(), attributes:attributes as [NSAttributedString.Key : Any])
        cell.characterLabel.attributedText = attrString

        // Define attributes
        labelFont = UIFont(name: "HelveticaNeue-Bold", size: 15)

        attributes = [NSAttributedString.Key.font : labelFont]
        // Create attributed string
        attrString = NSAttributedString(string: "\(braille_data[indexPath.row].num_position)/\(braille_data.count)".uppercased(), attributes:attributes as [NSAttributedString.Key : Any])
        cell.page_number.attributedText = attrString

        let braille_dots = braille_data[indexPath.row]
        cell.finalBox = braille_dots
//        print(characters[indexPath.row])
        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 275, height: 400)
    }


    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: (view.frame.width - 275) / 2, bottom: 3, right: (view.frame.width - 275) / 2)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return (view.frame.width - 275)
    }
}



//MARK: -customise the cell look
public class CustomeCell: UICollectionViewCell {

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
        dot.layer.cornerRadius = 25 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 2
        dot.layer.borderColor = UIColor.gray.cgColor
        return dot
    }()
    let dot_V2: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 25 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 2
        dot.layer.borderColor = UIColor.gray.cgColor
        return dot
    }()
    let dot_V3: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 25 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 2
        dot.layer.borderColor = UIColor.gray.cgColor
        return dot
    }()
    let dot_V4: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 25 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 2
        dot.layer.borderColor = UIColor.gray.cgColor
        return dot
    }()
    let dot_V5: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 25 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 2
        dot.layer.borderColor = UIColor.gray.cgColor
        return dot
    }()
    let dot_V6: UIView = {
        let dot = UIView()
        dot.translatesAutoresizingMaskIntoConstraints = false
        dot.layer.cornerRadius = 25 //change
        dot.backgroundColor = UIColor.black
        dot.layer.borderWidth = 2
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
        label.textColor = .WWDC_Green
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
        characterLabel.bottomAnchor.constraint(equalTo: entire_Braille.topAnchor, constant: -10).isActive = true
        characterLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        characterLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

        entire_Braille.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        entire_Braille.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        entire_Braille.heightAnchor.constraint(equalToConstant: (50 * 5)).isActive = true
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

        textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: entire_Braille.bottomAnchor, constant: 5).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

        page_number.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        page_number.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5).isActive = true
        page_number.heightAnchor.constraint(equalToConstant: 30).isActive = true
        page_number.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//PlaygroundPage.current.liveView = QueCardViewController()
