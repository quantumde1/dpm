module list;

import std.stdio;
import std.file;

void show_packages() {
    auto ps = readText("/var/lib/dpm/installedpkg.txt");
    writeln(ps);
}