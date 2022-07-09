export module MyModule;// им€ вашего модул€
export import std.core;// подключаем stl(iostream)
export void MyFunc() // можно объ€вить exp функцию так или 
{
	std::cout << "MuFuncTest\n";
}
// так внутри импорта
export {
	void MyFunc2()
	{
		std::cout << "MuFuncTest2\n";
	}
	//также можно использовать немспейс
	namespace MyNamespace {
		constexpr int x = 5;

	}
	template<typename T> 
	void print(const T& message)
	{
		std::cout << message << "\n";
	}
}


