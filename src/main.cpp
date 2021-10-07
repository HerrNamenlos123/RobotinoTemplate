
#include <iostream>
#include "Robotino.h"
#include "RobotinoAction.h"
#include "Robotino/RobotinoApi2.h"

int main() {

    // Initialize logging
    LOG_INIT(LOG_LEVEL_TRACE);

    try {
        RobotinoAction();
    }
    catch (Robotino::NotConnectedException e) {
        LOG_CRITICAL("Robotino is not connected!");
        rec::robotino::api2::shutdown();
        return 0;
    }
    catch (std::exception e) {
        LOG_CRITICAL("std::exception: {}", e.what());
        rec::robotino::api2::shutdown();
        return 0;
    }
    catch (...) {
        LOG_CRITICAL("Unknown exception!");
        rec::robotino::api2::shutdown();
        return 0;
    }

    rec::robotino::api2::shutdown();

    LOG_INFO("Application stopped");
}
