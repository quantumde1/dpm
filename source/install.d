module install;

import std.file;
import std.stdio;
import std.zip;
import std.process;

void addtodb(string packagename) {
    auto db = "/var/lib/dpm/installedpkg.txt";
    auto path = "/usr/bin/"~packagename~"\n";
    append(db, path);
}

void unpack(string packagename) {
    auto archive = "/var/cache/dpm/packages/"~packagename~"/"~packagename~".tar.gz";
    execute(["tar", "-xvf", archive, "-C", "/usr/bin/"]);
}