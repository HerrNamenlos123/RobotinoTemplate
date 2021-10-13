
#include "Robotino.h"

#include <sstream>
#include <fstream>
#include <iostream>

void RobotinoAction() {
	Robotino::Robotino robotino;
    robotino.Connect("172.26.1.1");

    while (!robotino.GetBumper()) {
        robotino.DriveDirect(0.0f, 0.1f, 0.0f);
        //std::this_thread::sleep_for(std::chrono::milliseconds(50));
    }

    //do {
    //    //auto pose = robotino.GetPose();
    //    //LOG_DEBUG("X: {}, Y: {}, PHI: {}", pose[0], pose[1], pose[2]);
    //    //robotino.GetCamera();
    //    //Robotino::Image image = robotino.GetCamera();
	//	
	//	/*std::ofstream myfile;
	//	myfile.open("image.raw", std::ios::binary);
	//	myfile.write((char*)image.raw(), image.width * image.height * 3);
	//	myfile.close();*/
    //
    //    robotino.DriveDirect(0.2f, 0.1f, 3.f);
    //    std::this_thread::sleep_for(std::chrono::milliseconds(50));
    //} while (!robotino.GetBumper());

    robotino.Disconnect();
}
