export module MyModule;// ��� ������ ������
export import std.core;// ���������� stl(iostream)
export void MyFunc() // ����� �������� exp ������� ��� ��� 
{
	std::cout << "MuFuncTest\n";
}
// ��� ������ �������
export {
	void MyFunc2()
	{
		std::cout << "MuFuncTest2\n";
	}
	//����� ����� ������������ ��������
	namespace MyNamespace {
		constexpr int x = 5;

	}
	template<typename T> 
	void print(const T& message)
	{
		std::cout << message << "\n";
	}
}


