//Пояснительная записка
//добавлено доп список меню позволяет
// в зависимости от времени будет показываеться разное меню
// у блюд переопределен метод проверки 
// можно ли его купить или нет...
// 
//

#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <algorithm>

//Описание класса "чистого" базового класса "Блюдо"
class Dish
{
public:
	Dish() = default;
	Dish(
		const std::string& name,
		const std::vector<std::string>& description,
		const int weight,
		const int price);
	Dish(const Dish& other) = default;
	Dish& operator=(const Dish& other) = default;
	~Dish() = default;
public:
	virtual void draw() const;
	virtual std::string dump() const;
	virtual bool canBuy(int hour) const = 0;
public:
	const bool description() const;
	const int price() const;
	const std::string name() const;
public:
	bool operator<(const Dish& other);
	friend std::ofstream& operator<<(std::ofstream& out, const Dish& dish);
public:
	void setName(const std::string& name);
	void setDescription(const std::vector<std::string>& description);
	void setWeight(const int weight);
	void setPrice(const int price);
protected:
	std::string m_name;
	std::vector<std::string> m_description;
	int m_weight;
	int m_price;
};

//Описание класса "Блюда"
class DishBreakfast : public Dish
{
public:
	DishBreakfast() = default;
	~DishBreakfast() = default;

	DishBreakfast(
		const std::string& name,
		const std::vector<std::string>& description,
		const int weight,
		const int price);
	
	virtual bool canBuy(int hour) const override;
};

class MainDish : public Dish
{
public:
	MainDish() = default;
	~MainDish() = default;

	MainDish(
		const std::string& name,
		const std::vector<std::string>& description,
		const int weight,
		const int price);
	virtual bool canBuy(int hour) const override;

};

class LunchDish : public Dish
{
public:
	LunchDish() = default;
	~LunchDish() = default;

	LunchDish(
		const std::string& type,
		const std::string& name,
		const std::vector<std::string>& description,
		const int weight,
		const int price);

	virtual void draw() const override;

	virtual bool canBuy(int hour) const override;
	virtual std::string dump() const;

private:
	std::string m_type;
};



//Описание класса прайс-лист аля база.данных)
class PriceList
{
public:
	using ptrDish = std::vector<Dish*>::iterator;
public:
	PriceList() = default;
	PriceList(const std::string& path);
	PriceList(const PriceList& other) = default;
	PriceList& operator=(const PriceList& other) = default;
	~PriceList() = default;
public:
	void draw() const;
	void showWhatCanEat(int hour = 0) const;
public:
	bool load(const std::string& path);
	void clear();
	void addDish(Dish* dish);
	void deleteDish();
	void editDish();
	void save();
public:
	std::pair<ptrDish, bool> findDish(const std::string& nameDish);
	const int priceDish(const std::string& nameDish) const;
	void sort();
private:
	std::vector<Dish*> m_dishes;
};

//корзина
class Bill
{
public:
	Bill() = default;
	Bill(const Bill& other) = default;
	Bill& operator=(const Bill& other) = default;
	~Bill() = default;
public:
	void addDish(Dish* dish);
	void show() const;
private:
	std::vector<Dish*> m_selectedDishes;
	int m_bill = 0;
};

class Menu
{
public:
	Menu() = default;
	~Menu() = default;
	void setItems(const std::vector<std::string>& items);
	void draw() const;
private:
	std::vector<std::string> m_items;
};

class App
{
public:
	App();
	App(const App& other) = delete;
	App& operator=(const App& other) = delete;
	~App() = default;
public:
	void run();
private:
	enum State
	{
		nowCanEat = 1,
		Sort,
		More,
		AddDish,
		ShowBill,
		CreateDish,
		DeleteDish,
		EditDish,
		SaveBD,
		Exit
	};
	void input();
	void delay() const;
	void clear() const;
private:
	void whatCanEat();
	void sortPriceList();
	void moreAboutDish();
	void addDishToBill();
	void createDish();
	void showBill() const;
	void deleteDishFromBill();
	void editDish();
	void saveBD();
	void exit();
private:
	bool m_isRun;
	Menu m_menu;
	PriceList m_priceList;
	Bill m_bill;
};

int main(void) 
{
	App app;
	app.run();

	return 0;
}

//----Implementation----------------------------

//Оберточка на std::cout
void print(const std::string& message)
{
	std::cout << message;
}

//---APP-------
App::App() :
	m_isRun(false)
{
	const std::vector<std::string> items = {
		"\n\t1)New: what i can eat >_<????",
		"\n\t2)Sort Price List\n",
		"\t3)Read more about current dish\n",
		"\t4)Add current dish to Bill\n",
		"\t5)Show Bill\n",
		"\t6)Added new dish\n",
		"\t7)Delete dish\n",
		"\t8)Edit dish\n",
		"\t9)Save Price List\n",
		"\t10)Exit\n" ,
		"\n\n\t\tMenu :\n"
	};

	m_menu.setItems(items);

	m_priceList.load("Text.txt");
}

void App::run()
{
	m_isRun = true;

	while (m_isRun)
	{
		m_menu.draw();
		m_priceList.draw();

		input();

		clear();
	}
}

void App::input()
{
	int handleInput;
	std::cin >> handleInput;

	switch (handleInput)
	{
	case App::nowCanEat:
		whatCanEat();
		std::cin.get();
		break;
	case App::Sort:
		sortPriceList();
		break;
	case App::More:
		moreAboutDish();
		break;
	case App::AddDish:
		addDishToBill();
		break;
	case App::ShowBill:
		showBill();
		break;
	case App::CreateDish:
		createDish();
		break;
	case App::DeleteDish:
		deleteDishFromBill();
		break;
	case App::EditDish:
		editDish();
		break;
	case App::SaveBD:
		saveBD();
		break;
	case App::Exit:
		exit();
		break;
	default:
		break;
	}
}

void App::delay() const
{
	print("\n\tPress any button to abort\n");
	std::cin.ignore(255, '\n');
	std::cin.get();
}

void App::clear() const
{
	system("cls");
}

void App::sortPriceList()
{
	m_priceList.sort();
}

void App::moreAboutDish()
{
	print("\n\tInput name of dish\n");

	std::cin.ignore(255, '\n');
	std::string name;
	std::getline(std::cin, name);

	auto packet = m_priceList.findDish(name);
	auto dish = *packet.first;
	bool isFound = packet.second;

	if (isFound)
		dish->description();
	else
		print("\n\tAre u sure? Not found this dish\n");

	delay();
}

void App::addDishToBill()
{
	std::string name;
	print("\n\tInput name of dish to add in bill\n");

	std::cin.ignore(255, '\n');
	std::getline(std::cin, name);

	auto packet = m_priceList.findDish(name);
	auto dish = *packet.first;
	bool isFound = packet.second;

	if (!isFound) {
		print("\n\tError to add dish in bill\n");
		delay();
		return;
	}

	print("\n\tAdded - " + name + "\n");

	m_bill.addDish(dish);

	delay();
}

void App::createDish()
{
	std::cin.ignore(255, '\n');

	print("\n\tWrite name of dish\n");
	std::string name;
	std::getline(std::cin, name);

	print("\n\tWrite type of dish - Lunch/Main/Breakfast\n");
	std::string type;
	std::getline(std::cin, type);

	print("\n\tCount lines of description\n");

	int nDescription;
	std::cin >> nDescription;

	std::vector<std::string> description;
	std::string tmp;
	print("\n\tWrite description\n");
	while (nDescription--) {
		std::cin.ignore();
		std::getline(std::cin, tmp);
		description.push_back(tmp + '\n');
	}

	print("\n\tWrite weight\n");
	int weight = 0;
	std::cin >> weight;
	print("\n\tWrite price\n");
	int price = 0;
	std::cin >> price;

	if (type == "Lunch")
		m_priceList.addDish(new LunchDish(type, name, description, weight, price));
	else if (type == "Main")
		m_priceList.addDish(new MainDish(name, description, weight, price));
	else if (type == "Breakfast")
		m_priceList.addDish(new DishBreakfast(name, description, weight, price));
}

void App::showBill() const
{
	m_bill.show();
	delay();
}

void App::deleteDishFromBill()
{
	m_priceList.deleteDish();
}

void App::editDish()
{
	m_priceList.editDish();
}

void App::saveBD()
{
	m_priceList.save();
}

void App::exit()
{
	m_isRun = false;
}

void App::whatCanEat()
{
	print("\tPlease input current time\n");

	int hour;
	std::cin >> hour;

	clear();

	if (hour >= 0 && hour <= 24)
		m_priceList.showWhatCanEat(hour);

	std::cin.get();

}

//------------Dish---

Dish::Dish(
	const std::string& name,
	const std::vector<std::string>& description,
	const int weight,
	const int price) :
	m_name(name),
	m_description(description),
	m_weight(weight), 
	m_price(price)
{
}

void Dish::draw() const
{
	const std::string infoAboutDish =
		+ "\n\t"
		+ m_name
		+ "\n\tWeight dish - " + std::to_string(m_weight) + "gr"
		+ "\n\tPrice - " + std::to_string(m_price) + "$\n";

	print(infoAboutDish);
}

std::string Dish::dump() const
{
	std::string tmp;

	tmp = "Dish\n"
		+ m_name + "\n" 
		+ std::to_string(m_description.size()) + "\n";

	for (const auto& it : m_description)
		tmp = tmp + it;

	tmp = tmp + std::to_string(m_weight) + "\n" + std::to_string(m_price) + "\n";

	return tmp;
}

const bool Dish::description() const
{
	std::string fullInfoAboutDish =
		+"\n\tFull Info about "
		+ m_name
		+ "\nComposition of dish:\n";
	for (const auto& it : m_description)
		fullInfoAboutDish += it;
	fullInfoAboutDish +=
		+ "\nWeight dish - " + std::to_string(m_weight) + "gr"
		+ "\nPrice - " + std::to_string(m_price) + "$\n";
	print(fullInfoAboutDish);

	return true;
}

const int Dish::price() const
{
	return m_price;
}

const std::string Dish::name() const
{
	return m_name;
}

bool Dish::operator<(const Dish& other)
{
	return m_name < other.m_name;
}

void Dish::setName(const std::string& name)
{
	m_name = name;
}

void Dish::setDescription(const std::vector<std::string>& description)
{
	m_description = description;
}

void Dish::setWeight(const int weight)
{
	m_weight = weight;
}

void Dish::setPrice(const int price)
{
	m_price = price;
}

std::ofstream& operator<<(std::ofstream& out, const Dish& dish)
{
	out << dish.dump();

	return out;
}

//----------PriceList--------

PriceList::PriceList(const std::string& file)
{
	if (!load(file))
		print("Error load file - " + file);	
}

bool PriceList::load(const std::string& path)
{
	std::string line;
	std::ifstream bd(path);

	if (bd.is_open())
	{
		while (getline(bd, line))
		{
			if (line == "Dish") {
				std::string name;
				std::getline(bd, name);

				std::string countDescription;
				std::getline(bd, countDescription);

				int nDescription = stoi(countDescription);

				std::vector<std::string> description;
				std::string tmp;
				while (std::getline(bd, tmp) && nDescription--)
					description.push_back(tmp + '\n');

				const int weight = stoi(tmp);
				std::getline(bd, tmp);
				const int price = stoi(tmp);

				std::string who_type;
				std::getline(bd, who_type);

				std::string type;

				if (who_type == "Lunch")
					std::getline(bd, type);

				if (who_type == "Lunch")
					addDish(new LunchDish(type, name, description, weight, price));
				else if (who_type == "Main")
					addDish(new MainDish(name, description, weight, price));
				else if (who_type == "Breakfast")
					addDish(new DishBreakfast(name, description, weight, price));

			}			
		}
		bd.close();
		return true;
	}

	return false;
}

void PriceList::clear()
{
	m_dishes.clear();
}

void PriceList::addDish(Dish* dish)
{
	m_dishes.push_back(dish);
}

void PriceList::deleteDish()
{
	print("\n\tInput name of dish to delete from PriceList\n");
	std::string name;
	std::cin.ignore(255, '\n');
	std::getline(std::cin, name);

	const auto packet = findDish(name);
	const auto dish = packet.first;
	const auto isFound = packet.second;

	if (isFound) {
		print("Deleting...");
		m_dishes.erase(dish);
	}
	else 
		print("Error!!!");
}

void PriceList::save()
{
	std::ofstream bd("Text.txt");

	if (bd.is_open())
	{
		for (const auto& dish : m_dishes) 
			bd << *dish;
		bd.close();
	}
}

void PriceList::editDish()
{
	print("\n\tInput name of dish to edit from PriceList\n");
	std::string name;
	std::cin.ignore(255, '\n');
	std::getline(std::cin, name);

	const auto packet = findDish(name);
	auto dish = *packet.first;
	const auto isFound = packet.second;

	if (isFound) {
		print("\n\tFound dish\n");	
		print("\n\tWhat edit? name,description,weight,price\n");
		std::string item;
		
		std::getline(std::cin, item);
	
		print("\n\tTODO!!!!\n");

		std::string newItem;

		if (item == "name") {
			std::getline(std::cin, newItem);
			dish->setName(newItem);
		}
		else if (item == "description") {
			int nCount;
			print("\n\tCount line of discription");
			std::cin >> nCount;
			std::vector<std::string> dedescription;
			for (size_t i = 0; i < nCount; i++)
			{
				std::getline(std::cin, newItem);
				dedescription.push_back(item);
			}
			dish->setDescription(dedescription);
		}
		else if (item == "weight") {
			int weight;
			print("\n\tNew weight");
			std::cin >> weight;
			dish->setWeight(weight);
		}
		else if (item == "price") {
			int price;
			print("\n\tNew price");
			std::cin >> price;
			dish->setPrice(price);
		}
		else {
			print("\n\tFailed!\n");
		}
	}
	else
		print("Error!!!");
}

void PriceList::draw() const
{
	for (const auto& dish : m_dishes)
			dish->draw();

	print("\n");
}

void PriceList::showWhatCanEat(int hour) const
{
	for (const auto& dish : m_dishes)
		if (dish->canBuy(hour))
			dish->draw();

	print("\n");
}

std::pair<PriceList::ptrDish, bool> PriceList::findDish(const std::string& nameDish)
{
	auto foundIterator = std::find_if(m_dishes.begin(), m_dishes.end(),
		[&nameDish](Dish* currDish) {
			return currDish->name() == nameDish;
		});
	return { foundIterator, foundIterator != m_dishes.end() };
}

const int PriceList::priceDish(const std::string& nameDish) const
{
	for (const auto& dish : m_dishes)
		if (dish->name() == nameDish)
			return dish->price();
	return 0;
}

void PriceList::sort()
{
	std::sort(m_dishes.begin(), m_dishes.end());
}

void Menu::setItems(const std::vector<std::string>& items)
{
	m_items = items;
}

void Menu::draw() const
{
	for (const auto& item : m_items)
		print(item);
}

void Bill::addDish(Dish* dish)
{
	m_selectedDishes.push_back(dish);
	m_bill += dish->price();
}

void Bill::show() const
{
	print("\n\tList of Bill:\n");
	for (const auto& dish : m_selectedDishes)
		dish->draw();
	print("\n\tFinal bill - " + std::to_string(m_bill) + "$\n");
}

//-------------------------------------

DishBreakfast::DishBreakfast(
	const std::string& name,
	const std::vector<std::string>& description,
	const int weight,
	const int price) : Dish(name, description, weight, price)
{
}

bool DishBreakfast::canBuy(int hour) const
{
	return hour >= 8 && hour <= 11;
}

MainDish::MainDish(
	const std::string& name,
	const std::vector<std::string>& description,
	const int weight,
	const int price) : Dish(name, description, weight, price)
{
}

bool MainDish::canBuy(int hour) const
{
	return true;
}

LunchDish::LunchDish(
	const std::string& type,
	const std::string& name,
	const std::vector<std::string>& description,
	const int weight,
	const int price) : 
	Dish(name, description, weight, price),
	m_type(type)
{
}

bool LunchDish::canBuy(int hour) const
{
	return hour >= 12 && hour <= 16;
}

void LunchDish::draw() const
{
	Dish::draw();
	print("\tType of dish : " + m_type);
}

std::string LunchDish::dump() const
{
	return Dish::dump() + "\n" + m_type;
}