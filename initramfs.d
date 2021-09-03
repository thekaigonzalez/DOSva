import std.stdio;
import std.array;
import std.conv;
import std.getopt;
import std.file;

extern (C) char* creadline(char* p);
extern (C) char* cadd_history(char*);

void main(string[] args)
{
 bool changedir = false;
 string ndir = "./";
 try { getopt(args, std.getopt.config.bundling, "newdirectory|n", &changedir, "dir|d", &ndir ); } catch(GetOptException e) { writeln("initramfs: bad argument");  }
 if (changedir == true) { chdir(ndir); }
 writeln("BusyDox v1.0-master");
 writeln("type \"help\" for commands");
 while (1) {
  char* cmd = creadline(cast(char*)"(initramfs) ");
  cadd_history(cmd);
  string[] argv = to!string(cmd).split;
  if (argv[0] == "b")
  {
   writeln("");
  }
 }
}
