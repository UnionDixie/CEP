#include <iostream>

#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;
using namespace std;

int main(void)
{
	//{
	//	const std::string path = "data/lena.jpg";
	//	Mat color = imread(path);
	//	Mat gray = imread(path, cv::ImreadModes::IMREAD_GRAYSCALE);
	//	if (color.data == 0)
	//		return -1;
	//	imwrite("lenaGray.jpg", gray);
	//	const int nc = gray.cols - 1;
	//	const int nr = gray.rows - 1;
	//	Vec3b pixel = color.at<Vec3b>(nc, nr);
	//	cout << pixel << "\n";
	//	imshow("lena.jpg", color);
	//	waitKey(0);
	//}
	{
		VideoCapture cap;
		cap.open(0);
		if (!cap.isOpened())
			return -1;
		namedWindow("WebCam", 1);
		while (true)
		{
			Mat frame;
			cap >> frame;
			//if (frame)
				imshow("WebCam", frame);
			if (waitKey(10) >= 0)
				break;
		}
		cap.release();
	}
	//Scalar a()

	return 0;
}