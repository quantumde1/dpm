module remove;

import std.stdio;
import std.file;
import std.string;
import std.range;
import std.process;

void rm_pkg(string packagename) {
    auto ps = execute(["/usr/bin/dpm_search", packagename]);
    writeln(ps.output);
    if (ps.output == "found\n") {
        writeln("Installed, so will be removed");
        auto path = "/usr/bin/"~packagename;
        path.remove;
        rmdirRecurse("/etc/"~packagename);
    }
    else {
        writeln("Not installed, so will be not removed");
    }
}