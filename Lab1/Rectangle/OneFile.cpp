#include <iostream>
#include <vector>
#include <string>
#include <functional>

//Обертка для вывода текста
void print(const std::string& message)
{
	std::cout << message;
}

//Класс меню - в нем храняться разные состояния
//в каком меню находимся и т.п
class Menu
{
public:
	Menu() = default;
	~Menu() = default;
	void run();
	void setMenu(const std::vector<std::string>& menuItems);
	void draw(const int item) const;
private:
	enum MenuState
	{
		isMenu,
		Inputting,
		Move,
		Scale,
		Contains,
		Intersect,
		Exit,
		Abort
	};
	std::vector<std::string> m_menuItems;
	MenuState m_state = MenuState::isMenu;
};

//класс приложения
//Запускает всю логику в себе содержит меню
class App
{
public:
	App() = default;
	~App() = default;
	void run();
private:
	Menu m_menu;
	std::vector<std::string> m_items;
};

//Вспомогательный класс 
//для точек на плоскости x,y
class Vector2f
{
public:
	Vector2f() = default;
	~Vector2f() = default;
	Vector2f(const float x, const float y);
	Vector2f(const Vector2f& vector);
	friend Vector2f operator+(const Vector2f& a, const Vector2f& b);
	friend bool operator==(const Vector2f& a, const Vector2f& b);
	Vector2f& operator+=(const Vector2f& other);
	friend std::istream& operator>> (std::istream& is, Vector2f& vec);
	float& x();
	float& y();
	float x() const;
	float y() const;
	void draw() const;
private:
	float m_x = 0.f, m_y = 0.f;
};

//Основной класс прямоугольников
//Содержит в себе два Vector2f
//это нижний левый угол и размер прямоугольника
//Можн двигать, увеличивать, находить объедение двух прямоугольников
//а также их пересечение
class Rectangle
{
public:
	Rectangle() = default;
	Rectangle(
		const Vector2f& point,
		const Vector2f& size);
	~Rectangle() = default;
	void setRect(
		const Vector2f& point,
		const Vector2f& size);
	void move(const Vector2f& moveXY);
	void scale(const Vector2f& size);
	void draw() const;
	std::vector<Vector2f> vertices() const;
public:
	static Rectangle intersect(const Rectangle& rect1, const Rectangle& rect2);
	static Rectangle contains(const Rectangle& rect1, const Rectangle& rect2);
private:
	Vector2f findXY(const std::function<float(float, float)>& comp) const;
private:
	Vector2f m_point, m_size;
};


//Тестовый класс который проверяет
//базовый функционал класса Rectangle
class RectangleTest
{
public:
	RectangleTest() = default;
	~RectangleTest() = default;
	static void runAllTests();
	static void test1();
};


//Старт программы
int main(void)
{
	RectangleTest::runAllTests();

	App app;
	app.run();

	return 0;
}


//-------------------------------------------------------------------------
//Реализация класса App

void App::run()
{
	m_items = { "\t\tMenu \
				 \n\t1)Input new two rectangles \
				 \n\t2)Move one of rectangles \
				 \n\t3)Scale one of rectangles \
				 \n\t4)Contains rectangles \
				 \n\t5)Intersect rectangles \
			     \n\t6)Exit\n",
				 "\t\tInput x,y and width and height rectangle, twice!\n",
				 "\t\tChose who move 1 or 2 and offset\n",
				 "\t\tChose who scale 1 or 2 and offset\n",
				 "\t\tContains, 0 to abort:\n",
				 "\t\tIntersect, 0 to abort:\n",
	};

	m_menu.setMenu(m_items);

	m_menu.run();
}

//-------------------------------------------------------------------------
//Реализация класса меню

void Menu::run()
{

	Rectangle r1, r2;
	Vector2f xy1, size1, xy2, size2;
	Vector2f move;
	int x;

	m_state = MenuState::isMenu;

	while (m_state != MenuState::Exit)
	{
		//Переключение между менюшками происходит 
		//на основе состояний
		switch (m_state)
		{
		case MenuState::isMenu:
			draw(m_state);
			std::cin >> x;
			if (x >= 1 && x <= 6)
				m_state = (MenuState)(x);
			//draw them
			break;
		case MenuState::Inputting:
			draw(m_state);
			std::cin >> xy1 >> size1 >> xy2 >> size2;
			r1.setRect(xy1, size1);
			print("\n");
			r2.setRect(xy2, size2);
			m_state = MenuState::isMenu;
			break;
		case MenuState::Move:
			draw(m_state);
			std::cin >> x >> move;
			if (x == 1)
				r1.move(move);
			else if (x == 2)
				r2.move(move);
			m_state = MenuState::isMenu;
			break;
		case MenuState::Scale:
			draw(m_state);
			std::cin >> x >> size1;
			if (x == 1)
				r1.scale(size1);
			else if (x == 2)
				r2.scale(size1);
			m_state = MenuState::isMenu;
			break;
		case MenuState::Contains:
			draw(m_state);
			r1.draw();
			print("\n");
			r2.draw();
			print("\n");
			Rectangle::contains(r1, r2).draw();
			std::cin >> x;
			if (x == 0)
				m_state = MenuState::Abort;
			else
				m_state = MenuState::Contains;
			break;
		case MenuState::Intersect:
			draw(m_state);
			r1.draw();
			print("\n");
			r2.draw();
			print("\n");
			Rectangle::intersect(r1, r2).draw();
			std::cin >> x;
			if (x == 0)
				m_state = MenuState::Abort;
			else
				m_state = MenuState::Intersect;
			break;
		case MenuState::Abort:
			m_state = MenuState::isMenu;
			break;
		case MenuState::Exit:
			break;
		default:
			break;
		}
		system("cls");
	}
}

void Menu::setMenu(const std::vector<std::string>& menuItems)
{
	m_menuItems = menuItems;
}

void Menu::draw(const int item) const
{
	print(m_menuItems[item] + '\n');
}

//-------------------------------------------------------------------------
//Реализация основного класса Rectangle

Rectangle::Rectangle(const Vector2f& point, const Vector2f& size) :
	m_point(point),
	m_size(size)
{
}

void Rectangle::setRect(const Vector2f& point, const Vector2f& size)
{
	m_point = point;
	m_size = size;
}

void Rectangle::move(const Vector2f& moveXY)
{
	m_point += moveXY;
}

void Rectangle::scale(const Vector2f& size)
{
	m_size += size;
}

void Rectangle::draw() const
{
	print("Left down point\n");
	m_point.draw();

	print("Right up point\n");
	Vector2f rigtUP = m_point + m_size;
	rigtUP.draw();

}

std::vector<Vector2f> Rectangle::vertices() const
{
	std::vector<Vector2f> vertices(4);//

	vertices[0] = m_point;
	vertices[1] = m_point + Vector2f(m_size.x(), 0);
	vertices[2] = m_point + Vector2f(0, m_size.y());
	vertices[3] = m_point + m_size;

	return vertices;
}

Rectangle Rectangle::intersect(const Rectangle& rect1, const Rectangle& rect2)
{
	const std::vector<Vector2f> vertices1 = rect1.vertices();
	const std::vector<Vector2f> vertices2 = rect2.vertices();

	//Ищем сначал* максимум по x между A и C
	//потом ищем min по y Между B и C
	//по сути находим все точки прямоугольника
	//который будет в пересечении
	//
	//  *____________B
	//	|			 |
	//	|		T____R_______D
	//	|		|	 |	     |
	//	A_______L____Bo      |
	//			|			 |
	// 			|			 |
	//		    C____________*
	//
	//Потом проверяем, что площадь прямоугольника не 0
	//или одна из длинн не 0
	//

	const Vector2f& a = vertices1[0];
	const Vector2f& b = vertices1[3];

	const Vector2f& c = vertices2[0];
	const Vector2f& d = vertices2[3];

	const float left = std::max(a.x(), c.x());
	const float top = std::min(b.y(), d.y());
	const float right = std::min(b.x(), d.x());
	const float bottom = std::max(a.y(), c.y());

	const float width = right - left;
	const float Height = top - bottom;

	if (width == 0 || Height == 0)
		print("Not Found intersect\n");

	return Rectangle(Vector2f(left, bottom), Vector2f(width, Height));
}

Rectangle Rectangle::contains(const Rectangle& rect1, const Rectangle& rect2)
{
	//
	//    Rect1
	//  *______B___________V
    //	|	   |    	   |
    //	A______*		   |
    //	|		    	   |
	//	|			 Rect2 | 
	//	|			*______D
	// 	|			|	   |
	// 	U___________C______*
	//      U V координаты нового большого прямоугольника
	// 
    //Для каждого прямоугольника находим
	//его максимум и минимум по xy
	//И комбинируем из это максимальную и минимальную  точку
	//
	//На рисунке это будет точки U V
	//  
	//

	auto min = [](float a, float b) {
		return std::min(a, b);
	};
	auto max = [](float a, float b) {
		return std::max(a, b);
	};
	//U
	float minX = std::min(rect1.findXY(min).x(), rect2.findXY(min).x());
	float minY = std::min(rect1.findXY(min).y(), rect2.findXY(min).y());
	//V
	float maxX = std::max(rect1.findXY(max).x(), rect2.findXY(max).x());
	float maxY = std::max(rect1.findXY(max).y(), rect2.findXY(max).y());

	return Rectangle(Vector2f(minX, minY), Vector2f(maxX - minX, maxY - minY));
}

//функция которая возращает точку из набора вершин
//прямоугольника на основе
//функции компаратора -> std::min или std::max
//чтобы не писать две фунции 
//добавил это, чтобы указывать что нужно искать
//максимум или минимум
Vector2f Rectangle::findXY(const std::function<float(float, float)>& comp) const
{
	const std::vector<Vector2f> m_vertices = vertices();

	float maxX = m_vertices[0].x();
	float maxY = m_vertices[0].y();

	const int n = 4;
	for (size_t i = 0; i < n; i++) {
		maxX = comp(maxX, m_vertices[i].x());
		maxY = comp(maxY, m_vertices[i].y());
	}

	return { maxX, maxY };
}



//--------------------------------------------------------------------------------
//Реализация класса Vector2f
//Ничего интересно просто обертка над двумя float
//

Vector2f::Vector2f(const float x, const float y) :
	m_x(x), m_y(y)
{
}

Vector2f::Vector2f(const Vector2f& vector) :
	m_x(vector.x()),
	m_y(vector.y())
{
}

Vector2f& Vector2f::operator+=(const Vector2f& other)
{
	*this = *this + other;
	return *this;
}

float& Vector2f::x()
{
	return m_x;
}

float& Vector2f::y()
{
	return m_y;
}

float Vector2f::x() const
{
	return m_x;
}

float Vector2f::y() const
{
	return m_y;
}

void Vector2f::draw() const
{
	std::string message =
		"X:" + std::to_string(m_x) + ",Y:" + std::to_string(m_y) + '\n';
	print(message);
}

Vector2f operator+(const Vector2f& a, const Vector2f& b)
{
	Vector2f tmp(a);
	tmp.m_x += b.x();
	tmp.m_y += b.y();
	return tmp;
}

bool operator==(const Vector2f& a, const Vector2f& b)
{
	return a.m_x == b.m_x && a.m_y == b.m_y;
}

std::istream& operator>>(std::istream& is, Vector2f& vec)
{
	is >> vec.m_x >> vec.m_y;
	return is;
}


//--------------------------------------------------------------------------------
//Базовые тесты для проверки работоспособности класса Rectangle

void RectangleTest::runAllTests()
{
	test1();
}

void RectangleTest::test1()
{
	{
		Vector2f xy(1, 1), size(1, 1);
		Rectangle r1(xy, size);
		if (r1.vertices() ==
			std::vector<Vector2f>{ {1, 1}, { 2, 1 }, { 1, 2 }, { 2, 2 } })
			print("OkInit\n");
	}

	{
		Vector2f xy(1, 1), size(1, 1);
		Rectangle r1(xy, size);
		r1.move(Vector2f(1, 1));
		if (r1.vertices() ==
			std::vector<Vector2f>{ {2, 2}, { 3, 2 }, { 2, 3 }, { 3, 3 } })
			print("OkMove\n");
	}

	{
		Vector2f xy(1, 1), size(1, 1);
		Rectangle r1(xy, size);
		r1.scale(Vector2f(1, 1));
		if (r1.vertices() ==
			std::vector<Vector2f>{ {2, 2}, { 4, 3 }, { 3, 4 }, { 4, 4 } })
			print("OkScale\n");
	}

	{
		Vector2f xy(1, 1), size(1, 1);
		Rectangle r1(xy, size);
		Rectangle r2(xy + Vector2f(-1, -1), size + Vector2f(1, 1));
		if (Rectangle::contains(r1, r2).vertices() ==
			std::vector<Vector2f>{ {0, 0}, { 2, 0 }, { 0, 2 }, { 2, 2 } })
			print("OkContains\n");
	}


	{
		Vector2f xy(1, 1), size(1, 1);
		Rectangle r1(xy, size);
		Rectangle r2(xy + Vector2f(-1, -1), size + Vector2f(1, 1));
		if (Rectangle::intersect(r1, r2).vertices() ==
			std::vector<Vector2f>{ {1, 1}, { 2, 1 }, { 1, 2 }, { 2, 2 } })
			print("OkIntersect\n");
	}
	print("\n\n");
}
