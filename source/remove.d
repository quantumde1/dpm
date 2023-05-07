module remove;

import std.stdio;
import std.file;
import std.string;
import std.range;

void rm_pkg(string packagename) {
    auto path = "/usr/bin/"~packagename;
    path.remove;
    rmdirRecurse("/etc/"~packagename);
}