namespace RstMgn.Constants
{
    public class SQLQuery
    {
        public static string Dish_Insert = "Insert into dish_9227(Item, price, itemtype, foodid) values(@item, @price, @itemtype, (SELECT id FROM Restautant_9227 WHERE id = @id))";
        public static string Insert_User = "Insert into registration_9227(Username,Password,Usertype) Values(@name, @password, 0)";
        public static string Insert = "Insert into Restautant_9227 (Restaurant,Veg,NonVeg,Offers,Location,City,Reviews)" + "Values (@name, @veg, @nonveg, @offers, @location, @city, @reviews)";
        public static string Restaurant = "Select * from restautant_9227";
        public static string User = "Select username from registration_9227";
        public static string Authenticate = "select UserType from Registration_9227 where Username = @user";
        public static string City = "select distinct City from restautant_9227";
        public static string Location = "select distinct Location from restautant_9227 where city = @City";
        public static string Grid = "select Restaurant,Veg,NonVeg,Offers from Restautant_9227 where city = @City AND Location = @Location";
        public static string Select_Restaurant = "select Location, veg,nonveg,reviews from Restautant_9227 where Restaurant = @Rest";
        public static string Select_Veg = "select food.item, food.price from dish_9227 as food inner join restautant_9227 as restaurant on food.Foodid = restaurant.id where restaurant.restaurant = @Rest";
        public static string Select_Nonveg_Veg = "select food.item,food.price from dish_9227 as food inner join restautant_9227 as restaurant on food.Foodid = restaurant.id where restaurant.restaurant = @Rest";
        public static string Select_Nonveg = "select food.item,food.price from dish_9227 as food inner join restautant_9227 as restaurant on food.Foodid = restaurant.id where restaurant.restaurant = @Rest";
    }
}