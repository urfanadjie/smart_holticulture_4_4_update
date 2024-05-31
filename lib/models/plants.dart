class Plant {
  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorited;
  final String description;
  bool isSelected;

  Plant (
      {
        required this.plantId,
        required this.price,
        required this.category,
        required this.plantName,
        required this.size,
        required this.rating,
        required this.humidity,
        required this.temperature,
        required this.imageURL,
        required this.isFavorited,
        required this.description,
        required this.isSelected
    });

    //List of Plants data
    static List<Plant> plantList = [
      Plant(
        plantId: 0,
        price: 22,
        category: 'Indoor',
        plantName: "Sanseviera",
        size: 'Small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        imageURL: 'assets/plant/plant_anthurium.png',
        isFavorited: true,
        description: 'Tanaman terbaik yang tumbuh di beberapa kawasan negara di dunia dan dapat tumbuh dengan baik di segala tempat.',
        isSelected: false,
      ),
      Plant(
        plantId: 2,
        price: 18,
        category: 'Indoor',
        plantName: 'Beach Daisy',
        size: 'Large',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        imageURL: 'assets/plant/plant_epiphyllum_anguliger.png',
        isFavorited: false,
        description: 'Tanaman ini salah satu yang terbaik dimana tanaman ini dapat hidup di berbagai negara dan tahan terhadap cuaca ekstrim.',
        isSelected: false
      ),
      Plant(
        plantId: 3,
        price: 30,
        category: 'Outdoor',
        plantName: 'Big Bluestem',
        size: 'Small',
        rating: 4.5,
        humidity: 35,

        temperature: '23 -28',
        imageURL: 'assets/plant/plant_epiphyllum_anguliger.png',
        isFavorited: false,
        description: 'Tanaman terbaik, dapat tumbuh di berbagai negara walaupun dalam cuaca ekstrim.',
        isSelected: false
      ),
      Plant(
        plantId: 4,
        price: 24,
        category: 'Recommended',
        plantName: 'Big Blustem',
        size: 'Large',
        rating: 4.1,
        humidity: 66,
        temperature: '12 - 26',
        imageURL: 'assets/plant/plant_epiphyllum_anguliger.png',
        isFavorited: true,
        description: 'Tanaman ini merupakan salah satu yang terbaik, dapat tumbuh di seluruh negara, dan adaptasi terhadap cuaca ekstrim',
        isSelected: false,
      ),
      Plant(
        plantId: 5,
        price: 24,
        category: 'Outdoor',
        plantName: 'Meadow Sage',
        size: 'Medium',
        rating: 4.4,
        humidity: 36,
        temperature: '15 - 18',
        imageURL: 'assets/images/plant-five.png',
        isFavorited: false,
        description:
        'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false
      ),
      Plant(
          plantId: 6,
          price: 19,
          category: 'Garden',
          plantName: 'Plumbago',
          size: 'Small',
          rating: 4.2,
          humidity: 46,
          temperature: '23 - 26',
          imageURL: 'assets/images/plant-six.png',
          isFavorited: false,
          description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
              'even the harshest weather condition.',
          isSelected: false
      ),
      Plant(
          plantId: 7,
          price: 23,
          category: 'Garden',
          plantName: 'Tritonia',
          size: 'Medium',
          rating: 4.5,
          humidity: 34,
          temperature: '21 - 24',
          imageURL: 'assets/images/plant-seven.png',
          isFavorited: false,
          description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
              'even the harshest weather condition.',
          isSelected: false
      ),
      Plant(
          plantId: 8,
          price: 46,
          category: 'Recommended',
          plantName: 'Tritonia',
          size: 'Medium',
          rating: 4.7,
          humidity: 46,
          temperature: '21 - 25',
          imageURL: 'assets/images/plant-eight.png',
          isFavorited: false,
          description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
              'even the harshest weather condition.',
          isSelected: false
      ),
    ];

    //Get the favorated items
    static List<Plant> getFavoritedPlants() {
      List<Plant> _travelList = Plant.plantList;
      return _travelList.where((element) => element.isFavorited == true).toList();
    }

    //Get the carts items
    static List<Plant> addedToCartPlants(){
      List<Plant> _selectedPlants = Plant.plantList;
      return _selectedPlants.where((element) => element.isSelected == true).toList();
    }

}