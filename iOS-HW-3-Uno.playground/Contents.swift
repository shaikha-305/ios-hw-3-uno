import UIKit
/*:
 # الواجب الثالث: لعبة UNO
 
 تحتوي لعبة الأونو على ٤ ألوان و١٠ أرقام.
 - تتكرر الأرقام لكل لون مرتين. ماعدا الرقم صفر، يتواجد مرة واحدة للون الواحد.
- توجد هناك ورقتين Action Cards لكل لون.
 1. Draw
 2. Reverse
 3. Pass

*/


//: ![Uno Deck](deck.jpg)


/*:
 ### المطلوب:
#### الجزء الأول:
 -- قم بإنشاء struct باسم Card به  الصفات التالية
 * color: String
 * number: Int
 
 -- قم بإنشاء مصفوفة من نوع `Card` فارغة، ثم قم بملئها بالأرقام فقط مرة واحدة من دون ال action cards ومن دون تكرار كل رقم مرتين (تكرار الأرقام بونص 🎁)
 
 - Green: 0 -> 9
 - Red: 0 -> 9
 - Blue: 0 -> 9
 - Yellow: 0 -> 9
 
 #### الجزء الثاني:
-- قم بإنشاء دالة بداخل الستركت Card باسم  `imageName`والتي تقوم بإرجاع اسم الصورة للكرت. قم بفتح المجلد Resources الموجود بداخل الplayground من النافذة اليسرى لرؤية طريقة تسمية الكرت
 ###### مثال على تسمية الكروت موضحة كالتالي، قم بتشغيل الكود لرؤية الصور أسفل هذه الأكواد:
 */


var blue_5 = UIImage(named: "Blue_6.png")
var red_9 = UIImage(named: "Red_9.png")

var green_Skip = UIImage(named: "Green_Skip.png")
var wild_Draw = UIImage(named: "Wild_Draw.png")


/*:
 
 
 ### الجزء الثالث (تجريب الكود😍):
 قم بإزالة الملاحظة عن الأسطر الأخيرة لتجربة الكود إن كان يعمل بشكل مناسب،
 الجزء الأول سيظهر كرت عشوائي
 الجزء الثاني سيظهر مجموعة الكروت كاملة 🃏🎴
 ```
 let randomCard = cards.randomElement()!
 let randomCardImage = UIImage(named: randomCard.imageName())
```

 ```
 let cardImages = cards.map{UIImage(named: $0.imageName())}
 randomCardImage
 ```
 إن تم ذلك بالشكل الصحيح من دون أي خطأ، فقد نجحت في المهمة! 🎉
 
  #### الجزء الرابع (بونص 🎁):
 -- قم بتعبئة مجموعة الكروت كل رقم يعرض مرتين، إلا الصفر، يعرض مرة واحدة، كما هو موضح في صورة مجموعة الأونو في بداية الملف
 -- قم باستعمال For Loop لتعبئة جميع الكروت

 
 #### الجزء الخامس (إكسترا إكسترا بونص 🌶🔥)
 -- قم بتعبئة المصفوفة أيضاً ب Action Cards من خلال تحويلك للصفات إلى optional بإضافة علامة الاستفهام إليها
اسم ال Action Cards موضح في الصور بداخل ال Resources
 
 ```
 var color: String?
 var action: String?
 var number: Int?
 ```
  لا تنسى إزالة كلمة  Optional بسبب تحويلك للمتغيرات إلى متغيرات بعلامة الاستفهام. ربما ستضطر إلى كتابة بعض أوامر if
  
 */


//: ---

//: # الحل ...



/// قم بإنشاء الستركت هنا

// struct ...
//struct Card
//{
//    var color: String?
//    var number: Int?
//    var action: String?
//
//    func imageName() -> String
//    {
//        if color != "Wild"  && number != nil && action == nil
//       {
//            return "\(color!)_\(number!)"
//        } else if color != "Wild" && number == nil && action != nil {
//            return "\(color!)_\(action!)"
//        } else if color == "Wild" && number == nil && action != nil {
//            return "\(action!)"
//       }
//        return ""
//    }
//}
//
//var colors = ["Blue", "Green", "Red", "Yellow", "Wild"]
//var actions = ["Reverse", "Skip", "Draw"]
//var wildActions = ["Wild", "Wild_Draw"]
//var cards: [Card] = []
//for color in colors
//{
//    if color != "Wild" {
//    for num in 0...9
//    {
//
//        var sampleCard = Card(color: color, number: num)
//
//        cards.append(sampleCard)
//        if sampleCard.number != 0{
//            cards.append(sampleCard)
//        }
//
//    }
//    for action1 in actions{
//        var sampleCard = Card(color: color, action: action1)
//        cards.append(sampleCard)
//    }
//    } else if color == "Wild" {
//        for action in wildActions {
//            var wildCards = Card(color: "Wild", action: action)
//            cards.append(wildCards)
//            cards.append(wildCards)
//            cards.append(wildCards)
//            cards.append(wildCards)
//        }
//    }
//}

enum Card{
    case number(Color, Int)
    case action(Color, Action)
    case wild(Wild)
    
    func image() -> String{
        switch self{
        case .number(let color, let number):
            return "\(color)_\(number)"
        case .action(let color, let action):
            return "\(color)_\(action)"
        case .wild(let wild):
            return "\(wild)"
        }
    }
}
enum Color: CaseIterable{
    case Red, Blue, Green, Yellow
}

enum Action: CaseIterable{
    case Skip, Draw, Reverse
}

enum Wild: CaseIterable{
    case Wild, Wild_Draw
}

var cards: [Card] = []


for color in Color.allCases{
    for i in 0...9{
        let card = Card.number(color, i)
        cards.append(card)
    }
    for action in Action.allCases{
        let card = Card.action(color, action)
        cards.append(card)
    }
    for i in 1...9{
       let card = Card.number(color, i)
        cards.append(card)
    }
    for action in Action.allCases{
        let card = Card.action(color, action)
        cards.append(card)
    }
    
    for wild in Wild.allCases{
        let card = Card.wild(wild)
        cards.append(card)
    }
}



let randomCard = cards.randomElement()!
let randomCardImage = UIImage(named: randomCard.image())

let cardImages = cards.map{UIImage(named: $0.image())}
cardImages







// لا تقم بإزالة الملاحظات إلا عند وصولك للمطلوب الثالث


//let randomCard = cards.randomElement()!
//let randomCardImage = UIImage(named: randomCard.imageName())
//
//
//let cardImages = cards.map{UIImage(named: $0.imageName())}
//randomCardImage
//cardImages



struct Movie{
    var title: String
    var pgRate: String
    var description: String
    
    func printDescription(){
        if pgRate == "PG"{
            print("movie is suitable for kids, \(description)")
        }else if pgRate == "PG-13"{
            print("movie is not suitable for kids, \(description)")
        }
    }
}
 var harryPotter = Movie(title: "Harry Poter", pgRate: "PG", description: "movie")

for color in ["yellow", "green", "blue"]{
    print(color)
}
