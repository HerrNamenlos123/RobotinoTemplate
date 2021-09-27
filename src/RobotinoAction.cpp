
#include "Robotino.h"

void RobotinoAction() {
    Robotino::Robotino robotino;
    robotino.Connect("127.0.0.1");

    do {
        //auto pose = robotino.GetPose();
        //LOG_DEBUG("X: {}, Y: {}, PHI: {}", pose[0], pose[1], pose[2]);

        robotino.DriveDirect(0.2f, 0.1f, 3.f);
        std::this_thread::sleep_for(std::chrono::milliseconds(50));
    } while (!robotino.GetBumper());

    robotino.Disconnect();
}
