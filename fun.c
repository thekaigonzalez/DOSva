#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

//extern (C) int run_dos()

int run_dos()
{
  lua_State* L = luaL_newstate();
  luaL_openlibs(L);
  if (luaL_dofile(L, "./dos.lua") == 1) { fprintf(stderr, "lua: %s", lua_tostring(L, -1)); } ;
}
