module get;

import std.stdio;
import std.file;
import std.net.curl;
import std.json;

void download_file(string packagename) {
    auto content = readText("/etc/dpm/conf.json");
	JSONValue j = parseJSON(content);
	auto address = j["Address"].str;
    download(address~packagename~".tar.gz", "/var/cache/dpm/packages/"~packagename~".tar.gz");
}