
#include "Robotino.h"

void RobotinoAction() {
	Robotino::Robotino robotino;
    robotino.Connect("127.0.0.1");

    while (!robotino.GetBumper()) {
        robotino.DriveDirect(0.1f, 0.0f, 0.0f);
        LOG_DEBUG("Driving forward...");
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }

    robotino.Disconnect();
}
