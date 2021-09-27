
#include <iostream>
#include "RobotinoLib.h"

int main() {

    // Initialize logging
    //LOG_INIT(LOG_LEVEL_DEBUG);
    LOG_INIT(LOG_LEVEL_TRACE);

    {
        Robotino robotino;
        robotino.Connect("172.26.1.1");

        do {
            auto pose = robotino.GetPose();
            LOG_INFO("X: {}, Y: {}, PHI: {}", pose[0], pose[1], pose[2]);

            robotino.DriveDirect(0.2, 0.1, 3);
            std::this_thread::sleep_for(std::chrono::milliseconds(50));
        } while (!robotino.GetBumper());

        robotino.Disconnect();
    }

    LOG_DEBUG("Application stopped properly");
    system("Pause");
}
