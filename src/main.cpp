
#include "Robotino.h"
#include "RobotinoAction.h"

#pragma warning( disable : 4101 )	// Suppress warning about unused variable 'e' (Only in this .cpp file)

int main() {

    try {
        LOG_TRACE("Starting RobotinoAction...");

        RobotinoAction();

        LOG_INFO("Application stopped");
    }
    catch (const Robotino::NotConnectedException& e) {
        LOG_CRITICAL("Robotino is not connected!");
    }
    catch (const std::exception& e) {
        LOG_CRITICAL("std::exception: {}", e.what());
    }
    catch (...) {
        LOG_CRITICAL("Unknown exception!");
    }

    Robotino::Shutdown();

    return 0;
}
