
#include <iostream>
#include "RobotinoLib.h"

int main() {

    // Initialize logging
    LOG_INIT(LOG_LEVEL_DEBUG);

    {
        Robotino robotino;
        robotino.Connect("127.0.0.1");

        do {
            robotino.DriveDirect(-0.2, 0, 0);
            std::this_thread::sleep_for(std::chrono::milliseconds(50));
        } while (!robotino.GetBumper());

        robotino.Disconnect();
    }

    LOG_DEBUG("Application stopped properly");
    std::cout << "Press Enter";
    std::cin.get();
}
