import 'package:food_delivery/model/item_model.dart';

class Data{
    List<ItemModel> items = [
    ItemModel(
        id: 1,
        image: "assets/pizza_image.png",
        name: "Margarita Pizza ",
        desc:
            "Sadece en taze malzemelerle hazırlanan eşsiz lezzetimizle tanışın! Margarita pizzamız, nefis mozzarella peyniri, taptaze domates ve taze fesleğenle harmanlanarak damaklarınıza unutulmaz bir lezzet şöleni sunuyor. İtalyan mutfağının en özel tatlarından biri olan margarita pizza, lezzetin zirvesine çıkar!",
        price: 14,
        time: "45 Dak",
        calories: "410 Kal",
        rating: "4.5",
        placeholderImage: "assets/chilli.png"),
    ItemModel(
        id: 2,
        image: "assets/PngItem_2269637 1.png",
        desc:
            "Pirinçli körili tavuk, tavuk parçalarının baharatlı köri sosunda pişirilmesi ve buharda pişirilmiş pirinç yatağı üzerinde servis edilmesiyle yapılan lezzetli bir yemektir. Köri sosu tipik olarak aromatik baharatlar ve kişniş karışımının yanı sıra krema için hindistan cevizi sütü ile yapılır.  ",
        price: 11,
        placeholderImage: "assets/chilli.png",
        name: 'Sarımsaklı Tavuk ',
        time: '30 Dak',
        rating: '4.9',
        calories: '275 Kal'),
    ItemModel(
        id: 3,
        image: "assets/PngItem_4744308 1.png",
        desc:
            "Sofranıza Akdeniz'in sıcak esintisini getirin! Mediterr Tavuk ile her ısırık, tazelik ve lezzet dolu bir yolculuğa davet. Marine edilmiş özel baharatlarla özenle hazırlanan tavuk, her lokmada Akdeniz mutfağının eşsiz tadını sunuyor. Sağlıklı ve lezzetli bir seçenek arıyorsanız, Mediterr Tavuk sizin için mükemmel bir tercih!",
        price: 12,
        placeholderImage: "assets/chilli.png",
        name: 'Mediterr Tavuk  ',
        time: '40 Dak',
        calories: '320 Kal',
        rating: '4.1'),
    ItemModel(
        id: 4,
        image: "assets/dish.png",
        desc:
            "Tadında baharatlarla dans eden, ızgara ateşinde pişirilen nefis Tavuk Kebabı ile lezzetin sınırlarını zorlayın! Her ısırıkta taze ve sulu tavuk eti, özenle seçilmiş baharatlarla buluşarak damaklarda unutulmaz bir lezzet bırakıyor. Şimdi, Tavuk Kebabı ile sofralarınıza keyifli bir lezzet şöleni getirin ve geleneksel lezzetin en iyisini deneyimleyin!",
        price: 9,
        placeholderImage: "assets/chilli.png",
        name: 'Tavuk Kebabı  ',
        time: '38 Dak',
        calories: '250 Kal',
        rating: '3.5'),
  ];
}