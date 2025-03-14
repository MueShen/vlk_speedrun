cmake_minimum_required(VERSION 3.2)
project(speedrun)




set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ../bin/)
file(GLOB_RECURSE SOURCES "src/*.cpp")
file(GLOB_RECURSE HEADERS "src/include/*.hpp" "src/include/*.h")

add_executable(core ${SOURCES} ${HEADERS})
target_link_libraries(core vulkan glfw dl pthread X11 Xxf86vm Xrandr Xi)

