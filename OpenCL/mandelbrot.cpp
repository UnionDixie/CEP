#include <iostream>
#include <vector>
#include <algorithm>
#include <SFML/Graphics.hpp>
#include <stdio.h>
#include <immintrin.h>

sf::Image simd_Mandelbrot() 
{
	double a[100], b[100], c[100];

	for (int i = 0; i < 100; i += 4) {
		// загрузим два отрезка по 256 бит в свои регистры
		__m256d x = _mm256_loadu_pd(&a[i]);
		__m256d y = _mm256_loadu_pd(&b[i]);
		// - 256 означает размер регистров
		// - d означает "double"
		// - pd означает "packed double"

		// просуммируем числа и положим результат в другой регистр:
		__m256d z = _mm256_add_pd(x, y);
		// запишем содержимое регистра в память:
		_mm256_storeu_pd(&c[i], z);
	}

	return {};
}

sf::Image naive_Mandelbrot()
{
	constexpr int n = 1920;
	constexpr int m = 1080;

	constexpr int size = n * m;

	std::vector<int> img(size, -1);
	int k = 0;

	sf::Image image;
	image.create(n, m, sf::Color(0, 0, 0, 0));

	int z = 0;
	int w = 0;
	
	for (int i = -960; i < 960; i++)
	{
		const float x0 = float(i) / 960.0;
		w = 0;
		for (int j = -540; j < 540; j++)
		{
			const float y0 = float(j) / 540.0;
			float x = 0.0f;
			float y = 0.0f;
			bool fl = 0;
			for (size_t z = 0; z < 1e4; z++)
			{
				const float xn = x * x - y * y;
				y = 2 * x * y + x0;
				x = xn + y0;
				if (x * x + y * y > 1e16) {
					//std::cout << i << "\n";
					fl = 0;
					break;
				}
				if (z == 100 - 1)
					fl = 1;
			}
			if (fl) {
				img[k++] = 10;
				image.setPixel(z, w, sf::Color(255, 255, 0));
			}
			w++;
			//std::cout << k << "\n";
		}
		z++;
	}


	const int pixRes = std::count_if(img.begin(), img.end(), [](const int x) {
		return x > 9;
	});

	std::cout << pixRes << "\n";

	return image;
}

int main()
{
	sf::Image img = naive_Mandelbrot();

	sf::Texture t;
	t.loadFromImage(img);

	sf::Sprite spite(t);
	

	sf::RenderWindow  window(sf::VideoMode(1920, 1080), "My window");

	// run the program as long as the window is open
	while (window.isOpen())
	{
		// check all the window's events that were triggered since the last iteration of the loop
		sf::Event event;
		while (window.pollEvent(event))
		{
			// "close requested" event: we close the window
			if (event.type == sf::Event::Closed)
				window.close();
		}

		window.clear(sf::Color::Black);

		window.draw(spite);

		window.display();

	}

	simd_Mandelbrot();


	return 0;
}