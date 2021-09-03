#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

//extern (C) int run_dos()

int run_dos()
{
  lua_State* L = luaL_newstate();
  luaL_openlibs(L);
  char* nstr = getenv("DOS");
  strcat(nstr, "/dos.lua");
  if (luaL_dofile(L, nstr) == 1) { fprintf(stderr, "lua: %s", lua_tostring(L, -1)); } ;
}
