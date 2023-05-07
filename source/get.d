module get;

import std.stdio;
import std.file;
import std.net.curl;
import std.json;
import install;

void deps(string packagename) {
    auto content = readText("/var/cache/dpm/packages/"~packagename~"/"~packagename~".deps");
    JSONValue j = parseJSON(content);
    auto deps = j["deps"].str;
    writeln("Dependencies:");
    writeln(deps);
    if (deps != "nodeps") {
        mkdir("/var/cache/dpm/packages/"~deps);
        download_file(deps);
        unpack(deps);
		addtodb(deps);
    }
    else if (deps == "nodeps") {
        writeln("nodeps detected, not installing dependencies");
    }
}

void download_file(string packagename) {
    auto content = readText("/etc/dpm/conf.json");
	JSONValue j = parseJSON(content);
	auto address = j["Address"].str;
    download(address~packagename~".tar.gz", "/var/cache/dpm/packages/"~packagename~"/"~packagename~".tar.gz");
    download(address~packagename~".deps", "/var/cache/dpm/packages/"~packagename~"/"~packagename~".deps");
    deps(packagename);
}