
#include <iostream>
#include "Robotino.h"
#include "RobotinoAction.h"

int main() {

    // Initialize logging
    LOG_INIT(LOG_LEVEL_TRACE);

    try {
        RobotinoAction();
    }
    catch (Robotino::NotConnectedException e) {
        LOG_CRITICAL("Robotino is not connected!");
        return 0;
    }
    catch (std::exception e) {
        LOG_CRITICAL("std::exception: {}", e.what());
        return 0;
    }

    LOG_INFO("Application stopped");
}
