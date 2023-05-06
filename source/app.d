import std.stdio;
import std.json;
import std.file;
import get;

void main(string[] args) {
	if (args.length <= 1) {
		writeln("Not enough arguments");
		assert(1);
	}
	if (args[1] == "install") {
		writeln("Downloading ", args[2]);
		download_file(args[2]);
	}
}